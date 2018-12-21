#include<vfs.h>
#include<include/lib/list.h>

extern struct super_operations ramfs_ops;
extern struct address_space_operations ramfs_aops;
extern struct file_operations ramfs_fops;
extern struct dentry_operations ramfs_dops;


struct vfsmount * alloc_mount(){
  struct vfsmount * mnt;
  mnt = malloc(sizeof(struct vfsmount));
  memset(mnt,0,sizeof(struct vfsmount));
  LIST_HEAD_INIT(mnt->list);
  LIST_HEAD_INIT(mnt->mounts);
  LIST_HEAD_INIT(mnt->child);
  mnt->count = 0;
  return mnt;
}

struct super_block * alloc_sb(){
  struct super_block * sb;
  sb = malloc(sizeof(struct super_block));
  memset(sb,0,sizeof(struct super_block));
  LIST_HEAD_INIT(sb->list);
  LIST_HEAD_INIT(sb->files);
  LIST_HEAD_INIT(sb->inodes);
  //sb->sb_operations=&ramfs_ops;
  //sb->d_operations=&ramfs_dops;
  sb->sb_mode.mounted=0;
  return sb;
}


struct inode* alloc_inode(struct super_block *sb){
  static struct address_space_operations empty_aops;
  static struct inode_operations empty_iops;
  static struct file_operations empty_fops;
  struct inode *inode;

  inode=(struct inode*)malloc(sizeof(struct inode));

  if(inode){
    struct address_space * const mapping = &inode->data;
    inode->ino=last_ino++;
    inode->sb = sb;
    atomic_set(&inode->count, 1);
    inode->nlink=0;
    inode->i_operations = &empty_iops;
    inode->f_operations = &empty_fops;
    inode->nlink = 1;
    atomic_set(&inode->write_count, 0);
    atomic_set(&inode->read_count, 0);

    inode->mode.size = 0;
    inode->mode.state = I_NEW;

    mapping->a_operations = &empty_aops;
    mapping->host = inode;
    mapping->nrpages = 0;
    mapping->pages=NULL;
    inode->mapping=mapping;
  }
  return inode;

}
