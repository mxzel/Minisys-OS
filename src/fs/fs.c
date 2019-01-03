#include <fs/fs.h>
#include <fs/vfs.h>
#include <list.h>
#include <current.h>

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

/*
//TODO
ssize_t vfs_read(struct file * file ,const char* buf ,size_t count, loff_t * pos){
  ssize_t ret;

  if (!file->f_operations || !file->f_operations->read)
    return -1;
  //TODO 保证区域可读写且有权限
  //ret = rw_verify_area(READ, file, pos, count);
  //if (!ret) {
  //ret = security_file_permission (file, MAY_READ);
  // if (!ret) {
  ret = file->f_operations->read(file, buf,count, pos);

      // }
      // }

 return ret;
}
**/

//获得当前进程中可用的文件描述符fd
//@return 可用的文件描述符或-1
int get_fd(){
  int fd= 0;
  while(fd<OPEN_MAX&&current->files[fd]!=NULL)fd++;
  if (fd==OPEN_MAX) return -1;
  return fd;
}


int open(const char* filename,int mode){
  //struct file* file = current->files[xxx];
  int fd = get_fd();
  if(fd>=0){
    struct file * f = get_file();
    current->files[fd]=f;
  }
  return fd;
}

/**
get_file - 构造并返回打开文件的file结构体
@parameter filename 文件名（包含路径）
@parameter mode 读写权限
@return 指向构建的file结构体的指针
**/
struct file* get_file(const char* filename,int mode){
  struct file* file=alloc_file();
  //TODO
}



/*
  #define OPEN_MAX 5

memset(task->files,0,sizeof(struct file* )*OPEN_MAX);

  struct file* files[OPEN_MAX];

**/


int __read(int fd,char * buf,size_t len){
  struct file* file = current->files[fd];
  if(file&&file->f_operations->read)
    return file->f_operations->read(file,buf,len);
  return -1;
}

int __write(int fd,char * buf,size_t len){
  struct file* file = current->files[fd];
  if(file&&file->f_operations->write)
    return file->f_operations->write(file,buf,len);
  return -1;
}
