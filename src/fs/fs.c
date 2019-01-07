#include <fs/fs.h>
#include <fs/vfs.h>
#include <list.h>
#include <task/current.h>

//=====================================================
//=fs.c
//=
//=本文件是文件系统的入口和主文件，实现了所有在fs.h中定义的函数
//=
//=
//=====================================================



extern struct fs_type ramfs_fs_type;
extern struct vfs_mount* only_mount;



void mount_init(struct fs_type *fs_type){
//   INIT_LIST_HEAD(&mount_list);
struct vfsmount *only_mount= alloc_mount();//新建一个挂载
  
//   list_add(&mnt->list,&mount_list);//加入链表
  //设置参数
//   mnt->parent = mnt;
  only_mount->sb=fs_type->alloc_sb();//建立对应的sb
  only_mount->root = only_mount->sb->root;
//   only_mount->root = dget(only_mount->sb->root);
//   mnt->mountpoint = mnt->sb->root;
//   mnt->parent = mnt;
}


void fs_init(){
  mount_init(&ramfs_fs_type);//挂载ramfs
}



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
       struct file * f = get_file(filename,mode);
     current->files[fd]=f;
   }
   return fd;
 }
int close(int fd){
    current->files[fd]=NULL;
}

 /**
 get_file - 构造并返回打开文件的file结构体
 @parameter filename 文件名（包含路径）
 @parameter mode 读写权限
 @return 指向构建的file结构体的指针
 **/
 struct file* get_file(const char* filename,int mode){
     struct file *file;
     fs_init();
   //TODO
     int error=0;
     struct nameidata nd;
     error=open_namei(filename,mode,&nd);
     if(!error)
         return dentry_open(file,nd.dentry,nd.mnt,mode);
     return NULL;
 }

 //根据路径名解析
 //@parameter pathname 文件路径名(可以是全路径，也可以是相对路径名)
 //@parameter mode 读写权限
 //@parameter nd ...
 //@return
 int open_namei(const char *pathname,int mode,struct nameidata *nd){
     int error=0;
     struct dentry *dentry;
     struct dentry *dir;
     nd->last.len=0;

     error = path_lookup(pathname,nd);
     if (error)
         return error;
     struct path last;//确定mnt和dentry
     error = do_lookup(nd, &nd->last, &last);
     if (error)
         return error;
     struct inode *inode = last.dentry->inode;
     if(inode){// 这是打开文件最简单的一种情况 查找文件，保存在nd中
         nd->mnt = last.mnt;//更新nd
         nd->dentry = last.dentry;
         return 0;
     }
     //文件不存在,首先需要创建文件
     dir = nd->dentry;
     dentry = last.dentry;
     /* Negative dentry 文件不存在，需要创建inode*/
     error = vfs_create(dir->inode, dentry, mode, nd);
     nd->dentry = dentry;
     if (error)
         return error;
     return 0;
 }

 //路径查找
 //@parameter pathname 文件路径名(可以是全路径，也可以是相对路径名)
 //@parameter nd 此时不包含任何有用信息，用来返回查找结果
 //@return error
 int path_lookup(const char *name,struct nameidata *nd){
     int error = 0；
     //nd->last_type = 3; //最后一个分量是“/”（也就是整个路径名为“/”）
    
     if(*name=='/'){
         //文件名包含绝对路径，因此我们优先使用文件系统的根目录作为查找起始点
         nd->mnt = only_mount;//当前进程文件系统的根vfsmount对象
         nd->dentry = only_mount->root;//当前进程文件系统的根dentry
     }
     //开始查找
     struct path next;//确定mnt和dentry
     struct inode *inode;
     while (*name=='/')
         name++;
     if (!*name)
         return -1;//没有路径名

     for(;;) {
         struct qstr this;//存放目录项名称
         unsigned int c;
         //inode权限检查
         //提取路径名
         this.name = name;
         c = *(const unsigned char *)name;
         do {
             name++;
             c = *(const unsigned char *)name;
         } while (c && (c != '/'));
         this.len = name - (const char *) this.name;
         /* remove trailing slashes? */
         if (!c)
             goto last_component;//最后一部分
         while (*++name == '/');
         
         /* This does the actual lookups.. */
         error = do_lookup(nd, &this, &next);//根据父目录项和当前路径名找出下一级的dentry
         if (error)
             break;

         inode = next.dentry->inode;
         if (!inode)
             return -1;//没有对应的目录
         continue;
         /* here ends the main loop */
 last_component:
         nd->last = this;
         return 0;
     }
     return -1;
 }

 //获取dentry
 //@parameter nd 是输入参数，这个结构指定了查找的父目录项以及它所在的vfsmount
 //@parameter name 输入参数，指定了路径分量名称。
 //@parameter path 输出参数，保存查找结果。
int do_lookup(struct nameidata *nd, struct qstr *name,
                      struct path *path)
 {
     struct vfsmount *mnt = nd->mnt;
     struct dentry *parent = nd->dentry;
     unsigned int len = name->len;
     const unsigned char *str = name->name;
     struct dentry *dentry = NULL;
     struct inode *dir = parent->inode;
     struct list_head *head = parent->subdirs;
     struct list_head *next = head->next;
     struct dentry* sub;
     while(next!=head){
         sub = list_entry(next, struct dentry, child);
         int i = 0;
         if(sub->d_name.len!=len) {
             next = next->next;
             continue;
         }
         while(sub->d_name.name[i] == str[i]) i++;
         if(i==len)
             break;
         next = next->next;
     }
     if(next!=head)
         dentry = sub;
     if(!dentry&&nd->last.len==0)return -1;
     if(!dentry){//新建dentry
         struct dentry * temp = alloc_dentry(parent, name);
     }
     path->mnt = mnt;
     path->dentry = dentry;
     if(!dentry) return 1;
     return 0;
 }

//创建inode
 int vfs_create(struct inode *dir, struct dentry *dentry, int mode,
                struct nameidata *nd)
 {
     error = dir->i_op->create(dir, dentry, nd); //调用父目录文件索引节点操作方法创建inode
     return error;
 }
 struct file *dentry_open(struct file *f,struct dentry *dentry, struct vfsmount *mnt, int mode)
 {
     struct inode *inode;
     int error;
     
     INIT_LIST_HEAD(&f->list);
     if (!f)
         return -1;
    
     inode=dentry->inode;
     if(mode==OPEN_W||mode==OPEN_WR)
         f->state.writeable = 1;
     if(mode==OPEN_R||mode==OPEN_WR)
         f->state.readable = 1;
     f->mapping = inode->mapping;
     f->dentry = dentry;
     f->inode = inode;
     f->vfsmnt = mnt;
     f->position = 0;
     f->f_operations=inode->f_operations;
     if(inode->sb->files){
         list_add(&f->list, &inode->sb->files);
     }
     if (f->f_operations && f->f_operations->open) {
         error = f->f_op->open(inode,f);
         if (error)
             return -1;
     }
     return f;
 }



int __read(int fd,char * buf,size_t len){
  struct file* file = current->files[fd];
  if(file&&file->f_operations&&file->f_operations->read)
    return file->f_operations->read(file,buf,len);
  return -1;
}

int __write(int fd,char * buf,size_t len){
  struct file* file = current->files[fd];
  if(file&&file->f_operations&&file->f_operations->write)
    return file->f_operations->write(file,buf,len);
  return -1;
}
