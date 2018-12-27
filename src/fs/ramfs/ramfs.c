#include <list.h>
#include <fs/vfs.h>

#define INODE_DIR 1
#define INODE_FILE 2

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


struct super_block * ramfs_alloc_sb(){
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
  .alloc_sb = ramfs_alloc_sb,
  .kill_sb = ramfs_kill_sb,
};


//================================
//=    ramfs super operations    =
//================================

//TODO
static struct inode* ramfs_alloc_inode(struct super_block *sb,int mode){

  struct inode *inode;

  inode=alloc_inode(sb);

  if(inode){
    inode->mode.type = mode;
    inode->mapping->a_operations = &ramfs_address_space_ops;
    switch (mode) {
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

struct file_operations ramfs_file_ops_dir = {
  .open		= dcache_dir_open,
  .release	= dcache_dir_close,
  .llseek	= dcache_dir_lseek,
  .read		= generic_read_dir,
  .readdir	= dcache_readdir,
};


static struct inode_operations ramfs_inode_ops_file={
  .getattr	= simple_getattr,
};

static struct inode_operations ramfs_inode_ops_dir={
  .create		= ramfs_create,
  .lookup		= simple_lookup,
  .mkdir		= ramfs_mkdir,
  .rmdir		= simple_rmdir,
  .mknod		= ramfs_mknod,
  .rename		= simple_rename,
};
