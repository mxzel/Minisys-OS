#include <fs/fs.h>
#include "vfs.h"
#include <list.h>

//=====================================================
//=vfs.c
//=
//=本文件是文件系统的入口和主文件，实现了所有在fs.h中定义的函数
//=
//=
//=====================================================



extern struct fs_type ramfs_fs_type;


//TODO: 初始化inode/dentry/file
void elements_init(){}




void mount_init(struct fs_type *fs_type){
  INIT_LIST_HEAD(&mount_list);
  struct vfsmount *mnt = alloc_mount();//新建一个挂载
  list_add(&mnt->list,&mount_list);//加入链表
  //设置参数
  mnt->parent = mnt;
  mnt->sb=fs_type->alloc_sb();//建立对应的sb



}


void fs_init(){
  elements_init();//初始化inode/dentry/file
  mount_init(&ramfs_fs_type);

}
