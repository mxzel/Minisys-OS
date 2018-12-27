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

//打开文件主函数
//@parameter filename 文件名
//@parameter mode 读写权限
//@return 打开的文件的文件描述符
int open(const char* filename, int mode);


//文件系统初始化，在系统启动时调用
//构建sb,根目录
void fs_init();
