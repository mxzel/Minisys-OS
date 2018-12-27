#include"../types.h"

/*
//文件系统调用

//文件读写操作

open

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

extern ssize_t vfs_read(struct file *, size_t, loff_t *);
extern ssize_t vfs_write(struct file *,  size_t, loff_t *);

extern int vfs_readdir(struct file *, filldir_t, void *);



void fs_init();
