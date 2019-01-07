#include"../types.h"

/*
//文件系统调用

//文件读写操作

creat

close

lseek

//文件系统操作

mount

unmount

rename

rmdir

mkdir
*/

//extern ssize_t vfs_read(struct file *, size_t, loff_t *);
//extern ssize_t vfs_write(struct file *,  size_t, loff_t *);

//extern int vfs_readdir(struct file *, filldir_t, void *);

//三种文件打开权限
#define OPEN_W 1
#define OPEN_R 2
#define OPEN_WR 3

/**
open - 打开文件主函数
@parameter filename 文件名
@parameter mode 读写权限
@return 打开的文件的文件描述符
**/
int open(const char* filename, int mode);

/**
read - 读文件
@parameter fd 要读的文件的描述符
@parameter var 要写的变量
@parameter type 要写到的变量的类型
@return 0成功，-1失败
**/
int __read(int fd,char * buf,size_t len);

#define sys_read(fd,type,var) __read(fd,&var,sizeof(type))

/**
   write - 读文件
   @parameter fd 要写的文件的描述符
   @parameter var 要读的变量
   @parameter type 要读到的变量的类型
   @return 0成功，-1失败
**/
int __write(int fd,char * buf,size_t len);

#define sys_write(fd,type,var) __write(fd,&var,sizeof(type))





/**
fs_init -文件系统初始化，在系统启动时调用,构建sb,根目录
**/
void fs_init();
