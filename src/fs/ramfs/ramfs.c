#include <list.h>
#include <fs/vfs.h>
#include <mm/mm.h>
#include <types.h>
#include <string.h>



static struct super_operations ramfs_super_ops;
//static struct dentry_operatons ramfs_dops;
static struct address_space_operations ramfs_address_space_ops;
static struct inode_operations ramfs_inode_ops_file;
static struct inode_operations ramfs_inode_ops_dir;
struct file_operations ramfs_file_ops_file;
struct file_operations ramfs_file_ops_dir;


//static struct vfsmount *ramfs_mount;
//static struct super_block * ramfs_sb = NULL;


static struct inode* ramfs_alloc_inode(struct super_block *sb,int mode);

//TODO
//可能写的有问题，是否需要查找已经创建的sb并返回？
struct super_block * ramfs_get_sb(){
  struct super_block * sb;
  sb = alloc_sb();
  sb->sb_operations=&ramfs_super_ops;
  //sb->d_operations=&ramfs_dops;
  struct inode * inode;
  struct dentry * root;

  inode = ramfs_alloc_inode(sb,INODE_DIR);

  if (inode) {
    inode->i_operations = &ramfs_inode_ops_dir;
    inode->f_operations = &ramfs_file_ops_dir;
    /* directory inodes start off with i_nlink == 2 (for "." entry) */
    inode->nlink++;
  }


  root = alloc_dentry_root(inode);

  sb->root = root;

  return sb;
}
void ramfs_kill_sb (struct super_block * sb){

}

struct fs_type ramfs_fs_type={
  .name = "ramfs",
  .get_sb = ramfs_get_sb,
  .kill_sb = ramfs_kill_sb,
};


//================================
//=    ramfs super operations    =
//================================

static struct inode* ramfs_alloc_inode(struct super_block *sb,int mode){

  struct inode *inode;

  inode=alloc_inode(sb);

  if(inode){
    inode->mode.type = mode;
    inode->mapping->a_operations = &ramfs_address_space_ops;
    switch (mode) {
      //TODO
      //default:
      //init_special_inode(inode, mode, dev);
      //break;
    case INODE_FILE:
      inode->i_operations = &ramfs_inode_ops_file;
      inode->f_operations = &ramfs_file_ops_file;
      break;
    case INODE_DIR:
      inode->i_operations = &ramfs_inode_ops_dir;
      inode->f_operations = &ramfs_file_ops_dir;
      /* directory inodes start off with i_nlink == 2 (for "." entry) */
      inode->nlink++;
      break;
    }
  }
  list_add(&inode->i_list,&inode_list);
  return inode;
}




//TODO
void ramfs_delete_inode(struct inode *inode)
{

}

//TODO
void ramfs_umount_begin (struct super_block *sb){

}


//================================
//=    ramfs inode operations    =
//================================


//ramfs_mknod - 创建dentry对应的inode
//@parameter dir 要创建inode的目录
//@parameter dentry 要创建的inode对应的dentry
//@parameter mode inode类型（文件/目录）
static void ramfs_mknod(struct inode *dir, struct dentry *dentry, int mode)
{
  struct inode * inode = ramfs_alloc_inode(dir->sb, mode);//获取一个inode

  d_instantiate(dentry, inode);//把dentry和inode关联起来
  dget(dentry);	/* Extra count - pin the dentry in core */
}

//ramfs_mkdir - 创建dentry对应的inode(目录)
static inline void ramfs_mkdir(struct inode * dir, struct dentry * dentry, int mode)
{
  ramfs_mknod(dir, dentry, INODE_DIR);
  dir->nlink++;
}

//ramfs_create - 创建dentry对应的inode(文件）
static inline void ramfs_create(struct inode *dir, struct dentry *dentry, int mode, struct nameidata *nd){
  ramfs_mknod(dir, dentry, INODE_FILE);
}


static int simple_delete_dentry(struct dentry *dentry){
  return 1;
}

//simple_lookup - 查找dentry对应的inode
struct dentry *simple_lookup(struct inode *dir, struct dentry *dentry, struct nameidata *nd){
  static struct dentry_operations simple_dentry_operations = {
    .d_delete = simple_delete_dentry,
  };

  dentry->operations = &simple_dentry_operations;
  //d_add(dentry, NULL);
  d_instantiate(dentry, NULL);
  return NULL;
}

//TODO
//可能不需要该函数
/*int simple_getattr(struct vfsmount *mnt, struct dentry *dentry,
                   struct kstat *stat)
{
  struct inode *inode = dentry->d_inode;
  generic_fillattr(inode, stat);
  stat->blocks = inode->i_mapping->nrpages << (PAGE_CACHE_SHIFT - 9);
  return 0;
}
*/

 //========================================
 //=    ramfs address space operations    =
 //========================================


 //TODO
 //readpage作用是从设备读入cache中的一页，似乎可以不写？
 //ref:https://www.cnblogs.com/wangzahngjun/p/5553793.html
int simple_readpage(struct file *file, struct page *page)
{
/*
  void *kaddr;

  if (PageUptodate(page))
    goto out;

  kaddr = kmap_atomic(page, KM_USER0);
  memset(kaddr, 0, PAGE_CACHE_SIZE);
  kunmap_atomic(kaddr, KM_USER0);
  flush_dcache_page(page);
  SetPageUptodate(page);
 out:
  unlock_page(page);
*/
  return 0;
}

/**
simple_prepare_write -
@parameter file
@parameter page
@parameter from
@parameter to
@return
 **/
//如果from-to不够一页，就把一页中除了from-to以外的地方清零
int simple_prepare_write(struct file *file, struct page* page,
                         unsigned from, unsigned to)
{
  // if (!PageUptodate(page)) {
    if (to - from != PAGE_SIZE) {
      //void *kaddr = kmap_atomic(page, KM_USER0);
      memset(page->address, 0, from);
      memset(page->address + to, 0, PAGE_SIZE - to);
      //flush_dcache_page(page);
      //kunmap_atomic(kaddr, KM_USER0);
    }
    // SetPageUptodate(page);
    // }
  return 0;
}

//simple_commit_write - 写入页成功后的操作（如果写入导致大小变大了则改变inode的大小）
//@parameter file 文件指针
//@parameter page 当前写的那一页
//@parameter offset 从页的哪里开始写
//@parameter to 写到当前页的哪里
int simple_commit_write(struct file *file, struct page *page,
                        unsigned offset, unsigned to)
{
  struct inode *inode = file->mapping->host;
  loff_t pos = ((loff_t)page->address) + to;
  /*
   * No need to use i_size_read() here, the i_size
   * cannot change under us because we hold the i_sem.
   */
  if (pos > inode->mode.size)
    inode->mode.size=pos;
  //set_page_dirty(page);
  return 0;
}



static struct super_operations ramfs_super_ops = {
  .alloc_inode		= ramfs_alloc_inode,
  .delete_inode	= ramfs_delete_inode,
  .umount_begin     = ramfs_umount_begin,
};


static struct address_space_operations ramfs_address_space_ops = {
  .readpage	= simple_readpage,
  .prepare_write	= simple_prepare_write,
  .commit_write	= simple_commit_write
};

struct file_operations ramfs_file_ops_file = {
  .read		= generic_file_read,
  .write		= generic_file_write,
  //.sendfile	= generic_file_sendfile,
  .llseek		= generic_file_llseek,
};

//TODO
//可以考虑不实现，如果对文件file的操作没重用的话就不写，因为体现不出来
//每个打开的目录也会分配对应的fd和struct file,可以通过file进行如下操作：
struct file_operations ramfs_file_ops_dir = {
  .open		= dcache_dir_open,
  .release	= dcache_dir_close,
  .llseek	= dcache_dir_lseek,
  .read		= generic_read_dir,
  .readdir	= dcache_readdir,
};


static struct inode_operations ramfs_inode_ops_file={
  //TODO
  //.getattr	= simple_getattr,
};


static struct inode_operations ramfs_inode_ops_dir={
  .create		= ramfs_create,
  .lookup		= simple_lookup,
  .mkdir		= ramfs_mkdir,
  //.rmdir		= simple_rmdir,
  .mknod		= ramfs_mknod,
  //.rename		= simple_rename,
};
