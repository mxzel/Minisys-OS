#include <fs/vfs.h>
#include <list.h>
#include <mm/mm.h>
#include <string.h>


/**
copy_to_buffer - 将一段内存的内容复制到指定地方
@parameter to 指针，复制到哪里
@parameter from 从哪里开始复制
@parameter length 要复制多长
@return 有多大没有复制成功
 **/
unsigned long copy_to_buffer(void* to,void* from,unsigned long length ){
  memcpy(to,from,length);
  return 0;
}

/**
find_get_page - 在as中找到第index页
@parameter mapping
@parameter index 页的下标
@return 创建新的页的结构体的指针
 */
struct page *find_get_page(struct address_space *mapping, unsigned long index){
  struct list_head *next_node = mapping->pages.next;
  unsigned long current_index=0;
  struct page * ret=NULL;
  while(next_node){
    ret = list_entry(next_node,struct page,list);
    if(current_index==index) return ret;
    current_index++;
    next_node = ret->list.next;
  }
  return ret;
}

/**
file_accessed - 标记文件已被访问
@parameter filp 要被标记的文件指针
 */
void file_accessed(struct file *filp){
  return;
}


/**
file_read_actor - 将页的内容复制到指定缓冲区
@parameter desc 读操作的详细信息
@parameter page 要复制的页
@parameter offset 从页内的offset开始复制
@parameter 复制size字节
@return 剩余多少字节复制失败
**/
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

/**
do_generic_mapping_read - 执行对页实际的读取操作
@parameter mapping file对应的address space
@parameter filp 文件
@parameter ppos 读取位置的指针
@parameter desc 读取行为描述符
**/
void do_generic_mapping_read(struct address_space *mapping,struct file *filp,loff_t *ppos,read_descriptor_t *desc)
{
	struct inode *inode = mapping->host;
	unsigned long index;//页号
	unsigned long end_index;//一共多少页
	unsigned long offset;//页内偏移量
	loff_t isize;

	index = *ppos >> PAGE_SHIFT;//要读的页号
	offset = *ppos & ~PAGE_MASK;//要读的偏移

	isize = inode->mode.size;
	if (!isize){//文件是空的
      return;
    }

	end_index = (isize - 1) >> PAGE_SHIFT;//最后一页的页号
	for (;;) {
		struct page *page;
		unsigned long  nr, ret;

		nr = PAGE_SIZE;//当前页需要读的大小
		if (index >= end_index) {//最后一页了
          if (index > end_index)//读多了，非法
            return;
          nr = ((isize - 1) & ~PAGE_MASK) + 1;
          if (nr <= offset) {//要读的位置比文件结尾还往后了，报错
            return;
          }
          //desc->error = 0;//其他情况，无错
		}
		nr = nr - offset;//这一页里要实际读的字节数

  		page = find_get_page(mapping, index);//根据页号从所有页中找到对应的页
        //把页复制到用户空间
		ret = file_read_actor(desc, page, offset, nr);//实际上往用户缓冲区内复制了多少
		offset += ret;//接下来要读的地方
		index += offset >> PAGE_SHIFT;//接下来要读的页
		offset &= ~PAGE_MASK;//下一页的页内偏移

		//kfree(page);//未新建page，故不用free
		if (ret == nr && desc->count)//如果这一页要读的正确复制，然后还有下面的要读
          continue;//就继续循环读下一页
		return;
	}

out:
	*ppos = ((loff_t) index << PAGE_SHIFT) + offset;
	file_accessed(filp);//文件标记为被访问,实际上没啥用好像
}


/**
generic_file_read - 读文件函数
@parameter filp 要读取的文件
@parameter buf 缓冲区位置
@parameter count 读取字节数
@return 成功0 ，失败-1
**/
int generic_file_read(struct file *filp, char  *buf, size_t count){
  struct iovec iov = { .iov_base = buf, .iov_len = count };
  //ssize_t retval=0;
  read_descriptor_t desc={.written = 0, .arg.buf = iov.iov_base, .count = iov.iov_len,.error = -1};
  if(filp->state.readable)
  do_generic_mapping_read(filp->mapping,filp,&filp->position,&desc);

  //retval += desc.written;
  return desc.error;
}

//=====================================================

/**
generic_file_buffered_write - 实际的写操作函数
@parameter file
@parameter iov
@parameter pos
@parameter ppos
@parameter count
@parameter written
@return
 **/
ssize_t generic_file_buffered_write(struct file *file, const struct iovec *iov, loff_t pos, loff_t *ppos,size_t count, ssize_t written)
{
	struct address_space * mapping = file->mapping;
	struct address_space_operations *a_ops = mapping->a_operations;
	struct page	*page;
	size_t		bytes;
	char *buf = iov->iov_base + written;


	do {
		unsigned long index;
		unsigned long offset;
		size_t copied;

		offset = (pos & (PAGE_SIZE -1)); //页内偏移
		index = pos >> PAGE_SHIFT;//要写的页号
		bytes = PAGE_SIZE - offset;//本页中实际要写的字节数
		if (bytes > count)
			bytes = count;


        //TODO
        //按照index取出对应的页，如果不存在就新建
		page = grab_page(mapping,index);

		//status = a_ops->prepare_write(file, page, offset, offset+bytes);
        //TODO
        //从用户处拷贝到存储位置，返回已经拷贝的大小
	   copied = copy_from_user(page, offset,buf, bytes);

       //如果扩大了文件则改变inode的大小
       a_ops->commit_write(file, page, offset, offset+bytes);
       //更新，准备写下一页
		if (copied > 0) {
            written += copied;
            count -= copied;
            pos += copied;
            buf += copied;
		}

	} while (count);
	*ppos = pos;

	return written;
}

int __generic_file_write_nolock(const struct file* file,const struct iovec *iov, loff_t *ppos)
{
	size_t count=iov->iov_len;;		/* after file limit checks */
	loff_t		pos=*ppos;
	ssize_t		written=0;

    //检查一些可能的错误
	if (file->state.writeable||count == 0)
      goto out;

    //写，返回实际写了多少字节
	written = generic_file_buffered_write(file, iov,pos, ppos, count, written);
out:
	//current->backing_dev_info = NULL;
	return written ? written : -1;
}


/**
   generic_file_write - 写文件函数
   @parameter filp 要写的文件
   @parameter buf 缓冲区位置
   @parameter count 写字节数
   @return 成功0 ，失败-1
**/
int generic_file_write(struct file *file, const char *buf,size_t count){
  struct address_space *mapping = file->mapping;
  struct inode *inode = mapping->host;
  ssize_t	ret;
  struct iovec local_iov = { .iov_base = (void *)buf,
                             .iov_len = count };

  ret = __generic_file_write_nolock(file, &local_iov, &file->position);


  //？？？
  if (ret > 0 && ((file->f_flags & O_SYNC) || IS_SYNC(inode))) {
    ssize_t err;

    err = sync_page_range(inode, mapping, file->position - ret, ret);
    if (err < 0)
      ret = err;
  }
  return ret;
}






//TODO
//dcache_readdir - 读取目录中的所有文件
//@parameter filp 打开的目录对应的file
//@parameter dirent 返回的结果
//@parameter 如何填写dirent的函数
//           ref：https://elixir.bootlin.com/linux/v2.6.11/source/fs/readdir.c#L71
/*
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
			//fallthrough
		case 1:
			ino = parent_ino(dentry);
			if (filldir(dirent, "..", 2, i, ino, DT_DIR) < 0)
				break;
			filp->position++;
			i++;
			// fallthrough
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
                // next is still alive
				list_del(q);
				list_add(q, p);
				p = q;
				filp->position++;
			}
			//spin_unlock(&dcache_lock);
	}
	return 0;
}
*/
