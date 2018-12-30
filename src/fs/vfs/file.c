#include<fs/vfs.h>
#include <list.h>
#include <mm/mm.h>


//file_read_actor - 将页的内容复制到指定缓冲区
//@parameter desc 读操作的详细信息
//@parameter page 要复制的页
//@parameter offset 从页内的offset开始复制
//@parameter 复制size字节
//@return 剩余多少字节复制失败
int file_read_actor(read_descriptor_t *desc, struct page *page,
                    unsigned long offset, unsigned long size)
{
  char *kaddr;
  unsigned long left, count = desc->count;

  if (size > count)
    size = count;

  kaddr = page->address;
  left = copy_to_buffer(desc->arg.buf, kaddr + offset, size);

  if (left) {//有没复制过去的
    size -= left;
    desc->error = -1;
  }

  desc->count = count - size;
  desc->written += size;
  desc->arg.buf += size;
  return size;
}


//do_generic_mapping_read - 执行对页实际的读取操作
//@parameter
void do_generic_mapping_read(struct address_space *mapping,
                             //struct file_ra_state *_ra,
			     struct file *filp,
                             loff_t *ppos,//是一个地址
			     read_descriptor_t *desc)
{
	struct inode *inode = mapping->host;
	unsigned long index;//页号
	unsigned long end_index;//一共多少页
	unsigned long offset;//页内偏移量
	loff_t isize;
	struct page *cached_page;

	cached_page = NULL;
	index = *ppos >> PAGE_SHIFT;//要读的页号
	offset = *ppos & ~PAGE_MASK;//要读的偏移

	isize = inode->mode.size;
	if (!isize)//文件是空的
		goto out;

	end_index = (isize - 1) >> PAGE_SHIFT;//最后一页的页号
	for (;;) {
		struct page *page;
		unsigned long  nr, ret;

		nr = PAGE_SIZE;//当前页需要读的大小
		if (index >= end_index) {//最后一页了
          if (index > end_index)//读多了，非法
				goto out;
			nr = ((isize - 1) & ~PAGE_MASK) + 1;
			if (nr <= offset) {//要读的比文件还往后了，报错
				goto out;
			}
		}
		nr = nr - offset;//这一页里要读的大小

find_page:
        //TODO
		page = find_get_page(mapping, index);//根据页号从所有页中找到对应的页
page_ok:

		/* If users can be writing to this page using arbitrary
		 * virtual addresses, take care about potential aliasing
		 * before reading the page on the kernel side.
		 */
        //？？?
		//if (mapping_writably_mapped(mapping))
		//	flush_dcache_page(page);

		/*
		 * When (part of) the same page is read multiple times
		 * in succession, only mark it as accessed the first time.
		 */
		//if (prev_index != index)
		//mark_page_accessed(page);//标记这页正在被访问
		//prev_index = index;

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
        //把页复制到用户空间
		ret = file_read_actor(desc, page, offset, nr);//实际上往用户缓冲区内复制了多少
		offset += ret;//接下来要读的地方
		index += offset >> PAGE_SHIFT;//接下来要读的页
		offset &= ~PAGE_MASK;//

		//page_cache_release(page);//???
		if (ret == nr && desc->count)//如果这一页要读的正确复制，然后还有下面的要读
          continue;//就继续循环读下一页
		goto out;

	}

out:
	//*_ra = ra;

	*ppos = ((loff_t) index << PAGE_SHIFT) + offset;
	//if (cached_page)
	//	page_cache_release(cached_page);
	//if (filp)
    //TODO
	file_accessed(filp);//文件标记为被访问
}



//generic_file_read -
ssize_t generic_file_read(struct file *filp, char  *buf, size_t count, loff_t *ppos){
  struct iovec iov = { .iov_base = buf, .iov_len = count };

  ssize_t retval;
  unsigned long seg;
  retval = 0;


  read_descriptor_t desc;

  desc.written = 0;
  desc.arg.buf = iov.iov_base;
  desc.count = iov.iov_len;
  desc.error = 0;
  do_generic_mapping_read(filp->mapping,filp,ppos,&desc);

  retval += desc.written;

  return retval;

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
