#include<fs/vfs/vfs.h>
#include<include/lib/list.h>

#define INODE_DIR 1
#define INODE_FILE 2

static struct super_operations ramfs_ops;
static struct address_space_operations ramfs_aops;
static struct inode_operations ramfs_file_iops;
static struct inode_operations ramfs_dir_iops;


static struct vfsmount *ramfs_mount;
static struct super_block * ramfs_sb = NULL;

int nr_inodes;
int last_ino=0;

LIST_HEAD(inode_list);

struct fs_type ramfs_fs_type={
  .name = "ramfs";
  .alloc_sb = ramfs_alloc_sb;
  .kill_sb = ramfs_kill_sb;
};

struct super_block * ramfs_alloc_sb(){
  struct super_block * sb;
  sb = alloc_sb();
  sb->sb_operations=&ramfs_ops;
  sb->d_operations=&ramfs_dops;
  struct inode * inode;
  struct dentry * root;

  inode = ramfs_get_inode(sb,INODE_DIR);

  root = d_alloc_root(inode);
  if (!root) {
    iput(inode);
    return -ENOMEM;
  }
  sb->s_root = root;

  return sb;
}
void* ramfs_kill_sb (struct super_block *){

}


//================================
//=    ramfs super operations    =
//================================

//TODO
static struct inode* ramfs_alloc_inode(struct super_block *sb,int mode){

  struct inode *inode;

  inode=alloc_inode(sb);

  if(inode){
    inode->mode.type = mode;
    inode->i_mapping->a_ops = &ramfs_aops;
    switch (mode) {
      //default:
      //init_special_inode(inode, mode, dev);
      //break;
    case INODE_FILE:
      inode->i_op = &ramfs_file_iops;
      inode->i_fop = &ramfs_fops;
      break;
    case INODE_DIR:
      inode->i_op = &ramfs_dir_iops;
      inode->i_fop = &simple_dir_operations;
      /* directory inodes start off with i_nlink == 2 (for "." entry) */
      inode->i_nlink++;
      break;
    }
  }
  list_add(inode,&inode_list);
  return inode;
}




//TODO
void ramfs_destroy_inode(struct inode *inode)
{

}

//TODO
void ramfs_umount_begin (struct super_block *){

}




struct super_operations ramfs_ops = {
  .alloc_inode		= ramfs_alloc_inode,
  .destroy_inode	= ramfs_delete_inode,
  .umount_begin     = ramfs_umount_begin,
};

struct address_space_operations ramfs_aops = {
  .readpage	= simple_readpage,
  .prepare_write	= simple_prepare_write,
  .commit_write	= simple_commit_write
};

struct file_operations ramfs_fops = {
  .read		= generic_file_read,
  .write		= generic_file_write,
  .mmap		= generic_file_mmap,
  .fsync		= simple_sync_file,
  .sendfile	= generic_file_sendfile,
  .llseek		= generic_file_llseek,
};


//TODO
struct dentry_operations ramfs_dops = {

}

//TODO
struct file_operations simple_dir_operations = {
  .open		= dcache_dir_open,
  .release	= dcache_dir_close,
  .llseek	= dcache_dir_lseek,
  .read		= generic_read_dir,
  .readdir	= dcache_readdir,
};
