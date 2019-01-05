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

//临时结构体：保存在查找过程中的相关信息
struct nameidata{
    struct dentry  *dentry;     /*目录项对象的地址*/
    struct vfsmount  *mnt;      /*安装点的数据*/
    struct qstr  last;          /*路径中的最后一个component*/
    unsigned int  flags;        /*查找标识*/
    //int  last_type;             /*路径中的最后一个component的类型*/
    unsigned  depth;            /*当前symbolic link的嵌套深度，不能大于6*/
    char   *saved_names[MAX_NESTED_LINKS + 1];/
    /*和嵌套symbolic link 相关的pathname*/
    //union {
    //    struct open_intent open; /*说明文件该如何访问*/
    //} intent;   /*专用数据*/
}
#define LOOKUP_FOLLOW         1
#define LOOKUP_DIRECTORY     2
#define LOOKUP_CONTINUE         4
#define LOOKUP_PARENT        16

#define    EPERM         1    /* Operation not permitted */
#define    ENOENT         2    /* No such file or directory */
#define    ESRCH         3    /* No such process */
#define    EINTR         4    /* Interrupted system call */
#define    EIO         5    /* I/O error */
#define    ENXIO         6    /* No such device or address */
#define    E2BIG         7    /* Argument list too long */
#define    ENOEXEC         8    /* Exec format error */
#define    EBADF         9    /* Bad file number */
#define    ECHILD        10    /* No child processes */
#define    EAGAIN        11    /* Try again */
#define    ENOMEM        12    /* Out of memory */
#define    EACCES        13    /* Permission denied */
#define    EFAULT        14    /* Bad address */
#define    ENOTBLK        15    /* Block device required */
#define    EBUSY        16    /* Device or resource busy */
#define    EEXIST        17    /* File exists */
#define    EXDEV        18    /* Cross-device link */
#define    ENODEV        19    /* No such device */
#define    ENOTDIR        20    /* Not a directory */
#define    EISDIR        21    /* Is a directory */
#define    EINVAL        22    /* Invalid argument */
#define    ENFILE        23    /* File table overflow */
#define    EMFILE        24    /* Too many open files */
#define    ENOTTY        25    /* Not a typewriter */
#define    ETXTBSY        26    /* Text file busy */
#define    EFBIG        27    /* File too large */
#define    ENOSPC        28    /* No space left on device */
#define    ESPIPE        29    /* Illegal seek */
#define    EROFS        30    /* Read-only file system */
#define    EMLINK        31    /* Too many links */
#define    EPIPE        32    /* Broken pipe */
#define    EDOM        33    /* Math argument out of domain of func */
#define    ERANGE        34    /* Math result not representable */
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
    struct file * f = get_file(filename,mode);
    current->files[fd]=f;
  }
  return fd;
}

//构造并返回打开文件的file结构体
//@parameter filename 文件名（包含路径）
//@parameter mode 读写权限
//@return 指向构建的file结构体的指针
struct file* get_file(const char* filename,int mode){
  struct file* file=alloc_file();
  //TODO
    int error=0;
    struct nameidata nd;
    error=open_namei(filename,mode,&nd);
    if(!error)
        return dentry_open(nd.dentry,nd.mnt);
    //打开失败
    //已经被打开
    return *error;
}

//根据路径名解析
//@parameter pathname 文件路径名(可以是全路径，也可以是相对路径名)
//@parameter mode 读写权限
//@parameter nd ...
//@return
int open_namei(const char *pathname,int flag,int mode,struct nameidata *nd){
    int acc_mode,error=0;
    struct dentry *dentry;
    struct dentry *dir;
    int count = 0;
    
    acc_mode = ACC_MODE(flag);
    
    // 这是打开文件最简单的一种情况 查找文件，保存在nd中
    if (!(flag & O_CREAT)) {
        error = path_lookup(pathname, lookup_flags(flag)|LOOKUP_OPEN, nd);
        if (error)
            return error;
        goto ok;
    }
    //文件不存在,首先需要创建文件
    error = path_lookup(pathname, LOOKUP_PARENT|LOOKUP_OPEN|LOOKUP_CREATE, nd);
    if (error)
        return error;

    dir = nd->dentry;
    nd->flags &= ~LOOKUP_PARENT;
    dentry=nd->dentry;
do_last:
    if (！dentry))
        goto exit;

    /* Negative dentry 文件不存在，需要创建inode*/
    if (!dentry->d_inode) {
        error = vfs_create(dir->d_inode, dentry, mode, nd);
        dput(nd->dentry);
        nd->dentry = dentry;
        if (error)
            goto exit;
        /* Don't check for write permission, don't truncate */
        acc_mode = 0;
        flag &= ~O_TRUNC;
        goto ok;
    }
    /*文件不存在*/
    error = -EEXIST;//17 文件存在
    if (flag & O_EXCL)
        goto exit_dput;
     /*检查是否一个mount点，如果是mount点需要切换到源mount点*/
    if (dentry->mounted) {
        error = -ELOOP;
        if (flag & O_NOFOLLOW)
            goto exit_dput;
       // while (__follow_down(&nd->mnt,&dentry) && (dentry->mounted));
    }
    error = -ENOENT;
    if (!dentry->d_inode)
        goto exit_dput;
    
    dput(nd->dentry);
    nd->dentry = dentry;
    error = -EISDIR;
//    if (dentry->d_inode && S_ISDIR(dentry->d_inode->i_mode))
//        goto exit;
ok://打开文件
    error = may_open(nd, acc_mode, flag);
    if (error)
        goto exit;
    return 0;
    
exit_dput:
    dput(dentry);
exit:
    path_release(nd);
    return error;

    
}

//路径查找
//@parameter pathname 文件路径名(可以是全路径，也可以是相对路径名)
//@parameter nd 此时不包含任何有用信息，用来返回查找结果
//@return error
int path_lookup(const char *name,unsigned int flags,struct nameidata *nd){
    int retval = 0；
    nd->last_type = LAST_ROOT; /* if there are only slashes... */
    nd->flags = flags;
    nd->depth = 0;
    unsigned int lookup_flags = nd->flags;
    
    if(*name=='/'){
        //文件名包含绝对路径，因此我们优先使用文件系统的根目录作为查找起始点
        nd->mnt = mntget(current->fs->rootmnt);//当前进程文件系统的根vfsmount对象
        nd->dentry = dget(current->fs->root);//当前进程文件系统的根dentry
    }else {
        //在进程的当前路径查找文件,那么dentry就是进程当前的dentry对象
        nd->mnt = mntget(current->fs->pwdmnt);//为进程文件系统的当前vfsmount对象
        nd->dentry = dget(current->fs->pwd);//进程文件系统的当前dentry
    }
    current->total_link_count = 0;//初始化符号连接为0
    
    //开始查找
    struct path next;//确定mnt和dentry
    struct inode *inode;
    //unsigned int lookup_flags = nd->flags;
    while (*name=='/')
        name++;
    if (!*name)
        return retval;
    
    inode = nd->dentry->inode;
    if (nd->depth)
        lookup_flags = LOOKUP_FOLLOW;
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
            goto last_component;
        while (*++name == '/');
        if (!*name)
            goto last_with_slashes;
        //处理.和..
        if (this.name[0] == '.') switch (this.len) {
            default:
                break;
            case 2:
                if (this.name[1] != '.')
                    break;
                struct vfsmount *parent;//..
                struct dentry *old = nd->dentry;
                while(1){
                    //如果当前所处的目录即为根目录则break
                    if (nd->dentry == current->fs->root && nd->mnt == current->fs->rootmnt) break;
                    ////如果当前所处的目录不为当前路径所属文件系统的根目录，也就是说可以直接向上退一级
                    if(nd->dentry != nd->mnt->root){
                        nd->dentry = dget(nd->dentry->parent);//当前的目录退到上一级
                        dput(old);
                        break;
                    }
                    //当前所处的目录为文件系统的根目录
                    parent = nd->mnt->parent;//取父文件系统
                    if (parent == nd->mnt) {//父文件系统即为本身，则表明没有父文件系统，直接break
                        break;
                    }
                    mntget(parent);//增加父文件系统的引用计数
                    nd->dentry = dget(nd->mnt->mountpoint);//取当前文件系统的挂载点，这样就退回到了父文件系统
                    dput(old);
                    mntput(nd->mnt);
                    nd->mnt = parent;//设置当前路径的mnt为父文件系统
                    }
                follow_mount(nd->mnt,nd->dentry);
                inode = nd->dentry->inode;
                /* fallthrough */
            case 1:
                continue;
        }
        nd->flags |= LOOKUP_CONTINUE;
        /* This does the actual lookups.. */
        retval = do_lookup(nd, &this, &next);//根据父目录项和当前路径名找出下一级的dentry
        if (retval)
            break;
        /* Check mountpoints.. */
        follow_mount(&next.mnt, &next.dentry);
      
        retval = -ENOENT;/* No such file or directory */
        inode = next.dentry->d_inode;
        if (!inode)
            goto out_dput;
        retval = -ENOTDIR;/* Not a directory */
        if (!inode->i_op)
            goto out_dput;
        retval = -ENOTDIR;/* Not a directory */
        if (!inode->i_op->lookup)
            break;
        continue;
        /* here ends the main loop */
last_with_slashes:
        lookup_flags |= LOOKUP_FOLLOW | LOOKUP_DIRECTORY;
last_component:
        nd->flags &= ~LOOKUP_CONTINUE;
        if (lookup_flags & LOOKUP_PARENT)
            goto lookup_parent;
        if (this.name[0] == '.') switch (this.len) {
            default:
                break;
            case 2:
                if (this.name[1] != '.')
                    break;
                struct vfsmount *parent;//..
                struct dentry *old = nd->dentry;
                while(1){
                    //如果当前所处的目录即为根目录则break
                    if (nd->dentry == current->fs->root && nd->mnt == current->fs->rootmnt) break;
                    ////如果当前所处的目录不为当前路径所属文件系统的根目录，也就是说可以直接向上退一级
                    if(nd->dentry != nd->mnt->root){
                        nd->dentry = dget(nd->dentry->parent);//当前的目录退到上一级
                        dput(old);
                        break;
                    }
                    //当前所处的目录为文件系统的根目录
                    parent = nd->mnt->parent;//取父文件系统
                    if (parent == nd->mnt) {//父文件系统即为本身，则表明没有父文件系统，直接break
                        break;
                    }
                    mntget(parent);//增加父文件系统的引用计数
                    nd->dentry = dget(nd->mnt->mountpoint);//取当前文件系统的挂载点，这样就退回到了父文件系统
                    dput(old);
                    mntput(nd->mnt);
                    nd->mnt = parent;//设置当前路径的mnt为父文件系统
                }
                follow_mount(nd->mnt,nd->dentry);
                inode = nd->dentry->inode;
                /* fallthrough */
            case 1:
                goto return_base;
            
        }
        retval = do_lookup(nd, &this, &next);
        if (retval)
            break;
        follow_mount(&next.mnt, &next.dentry);
        inode = next.dentry->d_inode;
        dput(nd->dentry);
        nd->mnt = next.mnt;
        nd->dentry = next.dentry;
       
        retval = -ENOENT;/* No such file or directory */
        if (!inode)
            break;
        if (lookup_flags & LOOKUP_DIRECTORY) {
            retval = -ENOTDIR;/* Not a directory */
            if (!inode->i_op || !inode->i_op->lookup)
                break;
        }
        goto return_base;
lookup_parent:
        nd->last = this;
        nd->last_type = LAST_NORM;
        if (this.name[0] != '.')
            goto return_base;
        if (this.len == 1)
            nd->last_type = LAST_DOT;
        else if (this.len == 2 && this.name[1] == '.')
            nd->last_type = LAST_DOTDOT;
        else
            goto return_base;
return_base:
        return 0;
out_dput:
        dput(next.dentry);
        break;
    }
    path_release(nd);
    return retval;
}

//获取dentry
//@parameter nd 是输入参数，这个结构指定了查找的父目录项以及它所在的vfsmount
//@parameter name 输入参数，指定了路径分量名称。
//@parameter path 输出参数，保存查找结果。
static int do_lookup(struct nameidata *nd, struct qstr *name,
                     struct path *path)
{
    struct vfsmount *mnt = nd->mnt;
    struct dentry *parent = nd->dentry;
    unsigned int len = name->len;
    const unsigned char *str = name->name;
    struct dentry *dentry = NULL;
    struct inode *dir = parent->inode;
    struct list_head *head = parent->subdirs;
    struct dentry* sub = list_entry(head->next, struct dentry, child);//？？？
    while(sub!=parent){
        int i = 0;
        if(sub->d_name.len!=len) {sub = list_entry(sub->child->next,struct dentry, child);continue;}
        while(sub->d_name.name[i] == str[i]) i++;
        if(i==len)
            break;
        sub = list_entry(sub->child->next, struct dentry, child);
    }
    if(sub!=parent)
        dentry = sub;
    if(!dentry){
        struct dentry * temp = alloc_dentry(parent, name);
        if (temp) {
            dentry = dir->i_op->lookup(dir, temp, nd);
            if (dentry)
                dput(temp);
            else
                dentry = temp;
        }
    }
    path->mnt = mnt;
    path->dentry = dentry;
    if(!dentry) return 1;/* Operation not permitted */
    return 0;
}

//检查安装点
//@paramter mnt已安装的父文件系统vfsmount结构
//@parameter dentry 已安装的子文件系统所在挂载点的dentry(父文件系统下的角度看)。
static int follow_mount(struct vfsmount **mnt, struct dentry **dentry)
{
    int res = 0;
    while ((*dentry)->mounted) {//目录下有文件系统被安装
        struct vfsmount *p, *mounted = NULL;
        struct list_head *head = (*mnt)->mounts;
        p = list_entry(head->next, struct vfsmount, child);
        while(p!=(*mnt)){
            if (p->parent == (*mnt) && p->mountpoint == (*dentry)) {
                //一定要找到父文件系统和挂载点都匹配的才是要找的那个子文件系统
                mounted = mntget(p);
                break;
            }
            p = list_entry(p->child->next, struct vfsmount, child)
        }
        if (!mounted)
            break;
        mntput(*mnt);//释放mnt
        *mnt = mounted;//保存vfsmount
        dput(*dentry);//释放dentry
        *dentry = dget(mounted->root);//保存dentry，并更新引用计数
        res = 1;
    }
    return res;
}
struct file *dentry_open(struct dentry *dentry, struct vfsmount *mnt, int flags)
{
    struct file * f;
    struct inode *inode;
    int error;
    
    error = -ENFILE;
    //f = get_empty_filp();
    memset(f, 0, sizeof(*f));
    f->count=1;
    if (!f)
        goto cleanup_dentry;
    goto cleanup_file;
    }
    f->mapping = inode->mapping;
    f->dentry = dentry;
    f->vfsmnt = mnt;
    f->pos = 0;
    //f->f_op = fops_get(inode->i_fop);
    //file_move(f, &inode->sb->files);
    
    if (f->f_op && f->f_op->open) {
        error = f->f_op->open(inode,f);
        if (error)
            goto cleanup_all;
    }
    return f;
    
cleanup_all:
    file_kill(f);
    f->dentry = NULL;
    f->vfsmnt = NULL;
cleanup_file:
    put_filp(f);
cleanup_dentry:
    dput(dentry);
    mntput(mnt);
    return *error;
}


void path_release(struct nameidata *nd)
{
    dput(nd->dentry);
    mntput(nd->mnt);
}
/*
  #define OPEN_MAX 5

memset(task->files,0,sizeof(struct file* )*OPEN_MAX);

  struct file* files[OPEN_MAX];

**/
