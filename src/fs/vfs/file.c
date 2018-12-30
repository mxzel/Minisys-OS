#include<fs/vfs.h>
#include <list.h>
#include <mm/mm.h>


/*
 * This is a generic file read routine, and uses the
 * mapping->a_ops->readpage() function for the actual low-level
 * stuff.
 *
 * This is really ugly. But the goto's actually try to clarify some
 * of the logic when it comes to error handling etc.
 *
 * Note the struct file* is only passed for the use of readpage.  It may be
 * NULL.
 */
void do_generic_mapping_read(struct address_space *mapping,
			     struct file_ra_state *_ra,
			     struct file *filp,
                             loff_t *ppos,//是一个地址
			     read_descriptor_t *desc,
			     read_actor_t actor)
{
	struct inode *inode = mapping->host;
	unsigned long index;//页号
	unsigned long end_index;//一共多少页
	unsigned long offset;//页内偏移量
	unsigned long req_size;//
	unsigned long next_index;
	unsigned long prev_index;
	loff_t isize;
	struct page *cached_page;
	int error;
	struct file_ra_state ra = *_ra;

	cached_page = NULL;
	index = *ppos >> PAGE_SHIFT;//要读的页号
	next_index = index;
	prev_index = ra.prev_page;
	req_size = (desc->count + PAGE_SIZE - 1) >> PAGE_SHIFT;//为什么+PAGE_SIZE？
	offset = *ppos & ~PAGE_MASK;//要读的偏移

	isize = inode->mode.size;
	if (!isize)//文件是空的
		goto out;

	end_index = (isize - 1) >> PAGE_SHIFT;//？？？？？
	for (;;) {
		struct page *page;
		unsigned long ret_size, nr, ret;

		/* nr is the maximum number of bytes to copy from this page */
        //当前页需要读的大小
		nr = PAGE_SIZE;
		if (index >= end_index) {//最后一页了
          if (index > end_index)//非法
				goto out;
			nr = ((isize - 1) & ~PAGE_MASK) + 1;
			if (nr <= offset) {//最后一页要读的操作完了
				goto out;
			}
		}
		nr = nr - offset;

		cond_resched();
		if (index == next_index && req_size) {
			ret_size = page_cache_readahead(mapping, &ra,
					filp, index, req_size);
			next_index += ret_size;
			req_size -= ret_size;
		}

find_page:
		page = find_get_page(mapping, index);
		if (unlikely(page == NULL)) {
			handle_ra_miss(mapping, &ra, index);
			goto no_cached_page;
		}
		if (!PageUptodate(page))
			goto page_not_up_to_date;
page_ok:

		/* If users can be writing to this page using arbitrary
		 * virtual addresses, take care about potential aliasing
		 * before reading the page on the kernel side.
		 */
		if (mapping_writably_mapped(mapping))
			flush_dcache_page(page);

		/*
		 * When (part of) the same page is read multiple times
		 * in succession, only mark it as accessed the first time.
		 */
		if (prev_index != index)
			mark_page_accessed(page);
		prev_index = index;

		/*
		 * Ok, we have the page, and it's up-to-date, so
		 * now we can copy it to user space...
		 *
		 * The actor routine returns how many bytes were actually used..
		 * NOTE! This may not be the same as how much of a user buffer
		 * we filled up (we may be padding etc), so we can only update
		 * "pos" here (the actor routine has to update the user buffer
		 * pointers and the remaining count).
		 */
		ret = actor(desc, page, offset, nr);
		offset += ret;
		index += offset >> PAGE_CACHE_SHIFT;
		offset &= ~PAGE_CACHE_MASK;

		page_cache_release(page);
		if (ret == nr && desc->count)
			continue;
		goto out;

page_not_up_to_date:
		/* Get exclusive access to the page ... */
		lock_page(page);

		/* Did it get unhashed before we got the lock? */
		if (!page->mapping) {
			unlock_page(page);
			page_cache_release(page);
			continue;
		}

		/* Did somebody else fill it already? */
		if (PageUptodate(page)) {
			unlock_page(page);
			goto page_ok;
		}

readpage:
		/* Start the actual read. The read will unlock the page. */
		error = mapping->a_ops->readpage(filp, page);

		if (unlikely(error))
			goto readpage_error;

		if (!PageUptodate(page)) {
			lock_page(page);
			if (!PageUptodate(page)) {
				if (page->mapping == NULL) {
					/*
					 * invalidate_inode_pages got it
					 */
					unlock_page(page);
					page_cache_release(page);
					goto find_page;
				}
				unlock_page(page);
				error = -EIO;
				goto readpage_error;
			}
			unlock_page(page);
		}

		/*
		 * i_size must be checked after we have done ->readpage.
		 *
		 * Checking i_size after the readpage allows us to calculate
		 * the correct value for "nr", which means the zero-filled
		 * part of the page is not copied back to userspace (unless
		 * another truncate extends the file - this is desired though).
		 */
		isize = i_size_read(inode);
		end_index = (isize - 1) >> PAGE_CACHE_SHIFT;
		if (unlikely(!isize || index > end_index)) {
			page_cache_release(page);
			goto out;
		}

		/* nr is the maximum number of bytes to copy from this page */
		nr = PAGE_CACHE_SIZE;
		if (index == end_index) {
			nr = ((isize - 1) & ~PAGE_CACHE_MASK) + 1;
			if (nr <= offset) {
				page_cache_release(page);
				goto out;
			}
		}
		nr = nr - offset;
		goto page_ok;

readpage_error:
		/* UHHUH! A synchronous read error occurred. Report it */
		desc->error = error;
		page_cache_release(page);
		goto out;

no_cached_page:
		/*
		 * Ok, it wasn't cached, so we need to create a new
		 * page..
		 */
		if (!cached_page) {
			cached_page = page_cache_alloc_cold(mapping);
			if (!cached_page) {
				desc->error = -ENOMEM;
				goto out;
			}
		}
		error = add_to_page_cache_lru(cached_page, mapping,
						index, GFP_KERNEL);
		if (error) {
			if (error == -EEXIST)
				goto find_page;
			desc->error = error;
			goto out;
		}
		page = cached_page;
		cached_page = NULL;
		goto readpage;
	}

out:
	*_ra = ra;

	*ppos = ((loff_t) index << PAGE_CACHE_SHIFT) + offset;
	if (cached_page)
		page_cache_release(cached_page);
	if (filp)
		file_accessed(filp);
}

int file_read_actor(read_descriptor_t *desc, struct page *page,
                    unsigned long offset, unsigned long size)
{
  char *kaddr;
  unsigned long left, count = desc->count;

  if (size > count)
    size = count;

  /*
   * Faults on the destination of a read are common, so do it before
   * taking the kmap.
   */
  if (!fault_in_pages_writeable(desc->arg.buf, size)) {
    kaddr = kmap_atomic(page, KM_USER0);
    left = __copy_to_user_inatomic(desc->arg.buf,
                                   kaddr + offset, size);
    kunmap_atomic(kaddr, KM_USER0);
    if (left == 0)
      goto success;
  }

  /* Do it the slow way */
  kaddr = kmap(page);
  left = __copy_to_user(desc->arg.buf, kaddr + offset, size);
  kunmap(page);

  if (left) {
    size -= left;
    desc->error = -EFAULT;
  }
 success:
  desc->count = count - size;
  desc->written += size;
  desc->arg.buf += size;
  return size;
}

/*
 * This is the "read()" routine for all filesystems
 * that can use the page cache directly.
 */
ssize_t
__generic_file_aio_read(struct file *filp,const struct iovec *iov, loff_t *ppos)
{
	ssize_t retval;
	unsigned long seg;
	size_t count= iov->iov_len;

	retval = 0;


    read_descriptor_t desc;

    desc.written = 0;
    desc.arg.buf = iov->iov_base;
    desc.count = iov->iov_len;
    desc.error = 0;
    do_generic_mapping_read(filp->f_mapping,&filp->f_ra,filp,ppos,&desc,file_read_actor);

    retval += desc.written;

    return retval;
}



ssize_t
generic_file_read(struct file *filp, char  *buf, size_t count, loff_t *ppos)
{
  struct iovec local_iov = { .iov_base = buf, .iov_len = count };
  ssize_t ret = __generic_file_aio_read(filp,&local_iov, 1, ppos);
  return ret;
}



//TODO
//dcache_readdir - 读取目录中的所有文件
//@parameter filp 打开的目录对应的file
//@parameter dirent 返回的结果
//@parameter 如何填写dirent的函数
//           ref：https://elixir.bootlin.com/linux/v2.6.11/source/fs/readdir.c#L71
int dcache_readdir(struct file * filp, void * dirent, filldir_t filldir){
	struct dentry *dentry = filp->dentry;
	struct dentry *cursor = filp->private_data;//???
	struct list_head *p, *q = &cursor->child;
	int ino;
	int i = filp->position;//此处的position表示文件在目录中的位置

	switch (i) {
		case 0:
			ino = dentry->inode->ino;
			if (filldir(dirent, ".", 1, i, ino, DT_DIR) < 0)
				break;
			filp->position++;
			i++;
			/* fallthrough */
		case 1:
			ino = parent_ino(dentry);
			if (filldir(dirent, "..", 2, i, ino, DT_DIR) < 0)
				break;
			filp->position++;
			i++;
			/* fallthrough */
		default:
          //spin_lock(&dcache_lock);
			if (filp->position == 2) {
				list_del(q);
				list_add(q, &dentry->subdirs);
			}
			for (p=q->next; p != &dentry->subdirs; p=p->next) {
				struct dentry *next;
				next = list_entry(p, struct dentry, child);
				if (d_unhashed(next) || !next->inode)
					continue;

				//spin_unlock(&dcache_lock);
				if (filldir(dirent, next->d_name.name, next->d_name.len, filp->position, next->inode->ino, dt_type(next->inode)) < 0)
					return 0;
				//spin_lock(&dcache_lock);
				/* next is still alive */
				list_del(q);
				list_add(q, p);
				p = q;
				filp->position++;
			}
			//spin_unlock(&dcache_lock);
	}
	return 0;
}
