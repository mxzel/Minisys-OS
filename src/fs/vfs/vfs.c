#include<include/fs/fs.h>
#include<vfs.h>
#include<include/lib/list.h>

struct list_head mount_list;//所有已挂载的文件系统


extern struct fs_type ramfs_fs_type;



void mount_init(struct fs_type *fs_type){
  LIST_HEAD_INIT(mount_list);
  struct vfsmonut * mnt = alloc_mount();
  list_add(&mnt->list,&mount_list);
  mnt->parent = mnt;
  mnt->sb=fs_type->alloc_sb();



}


void fs_init(){
  elements_init();//初始化inode/dentry/file
  mount_init(&ramfs_fs_type);

}
