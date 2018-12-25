#include <fs/fs.h>
#include <fs/vfs.h>
#include <list.h>

//=====================================================
//=fs.c
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
  mnt->root = dget(mnt->sb->root);
  mnt->mountpoint = mnt->sb->root;
  mnt->parent = mnt;
  //TODO:处理namepsace问题
  //https://elixir.bootlin.com/linux/v2.6.11-tree/source/fs/namespace.c#L1361


}


void fs_init(){
  elements_init();//初始化inode/dentry/file
  mount_init(&ramfs_fs_type);//挂载ramfs
}

//TODO: mount
//https://elixir.bootlin.com/linux/v2.6.11-tree/source/fs/namespace.c#L1008
//http://www.cnblogs.com/cslunatic/p/3683117.html
