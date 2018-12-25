#define DNAME_INLINE_LEN 8

#include <types.h>



//=====================================================
//=vfs.h
//=
//=本文件涉及所有文件系统相关结构体的定义
//=同时需要extern所有需要用在.c文件中的所有函数和变量
//=便于.c文件通过直接include本文件即可使用他们
//
//=====================================================




//把所有需要的、写在别的.c中的函数全部extern进来
extern struct vfsmount * alloc_mount();
extern struct super_block * alloc_sb();
extern struct inode* alloc_inode(struct super_block *sb);
extern struct dentry *alloc_dentry_root(struct inode *root_inode);
extern struct dentry *alloc_dentry(struct dentry * parent, const struct qstr *name);


//把所有需要的、写在别的.c中的变量全部extern进来
extern struct list_head mount_list;

extern int nr_inodes;
extern struct list_head inode_list;

struct qstr {
  unsigned int len;
  const char *name;
};

//每个文件系统一个
struct fs_type{
  const char * name;
  struct super_block * (*alloc_sb)();
  void (*kill_sb) (struct super_block *);
  //struct list_head list;
};

//已挂载的文件系统链表
struct vfsmount {
  struct list_head list;
  char *devname;
  //int flags;
  struct vfsmount *parent;    // 指向mount树中的父节点
  struct dentry *mountpoint;//mount点的目录项
  struct dentry *root;//被mount的文件系统根目录项
  struct list_head mounts;    //和下级child相连
  struct list_head child; // 和上级的mount相连
  struct super_block *sb;

  short count;
};

struct sb_mode{
  short mounted;//是否已经挂载
  bool readable;//1可0不可
  bool writeable;//1可0不可
};

//对一个文件系统的描述
struct super_block{
  struct list_head    list;//所有文件系统链表
  unsigned long blocksize;//TODO 块数量？
  int use_count;//使用计数
  int ref_count;//引用计数
  struct sb_mode mode;//状态信息

  //struct file_system_type *type;//TODO 文件系统类型？
  struct super_operations *sb_operations;//sb操作的接口
  struct dentry *root;//根目录
  //struct dentry_operations *d_operations;
  struct list_head files;//所有file
  struct list_head inodes;//所有inode
};



//sb操作的接口定义
struct super_operations {
   	struct inode *(*alloc_inode)(struct super_block *sb);
	void (*destroy_inode)(struct inode *);

	void (*read_inode) (struct inode *);

	int (*write_inode) (struct inode *, int);
  //void (*put_inode) (struct inode *);

	void (*umount_begin) (struct super_block *);
};

//address_space, 管理inode 的存储
struct address_space {
  struct inode		*host;//指向对应的inode
  struct list_head  pages;//所有存储需要的page
  //gfp_t			gfp_mask;
  //atomic_t		i_mmap_writable;
  //struct rb_root_cached	i_mmap;
  //struct rw_semaphore	i_mmap_rwsem;
  unsigned long		nrpages;//总page数量
  //unsigned long		nrexceptional;
  //pgoff_t			writeback_index;//写回的page偏移量
  const struct address_space_operations *a_operations;
  //unsigned long		flags;
  //spinlock_t		private_lock;
  //struct list_head	private_list;
  //void			*private_data;
};

struct address_space_operations {
  //int (*writepage)(struct page *page, struct writeback_control *wbc);用于写入IO的，似乎没用
  int (*readpage)(struct file *, struct page *);

  int (*prepare_write)(struct file *, struct page *, unsigned, unsigned);//将用户的数据copy到内核
  int (*commit_write)(struct file *, struct page *, unsigned, unsigned);//写入对应的页中

  // int (*invalidatepage) (struct page *, unsigned long);

  int (*releasepage) (struct page *, int);
};



//TODO inode 的状态信息
struct inode_mode{
  enum{I_NEW, I_LOCk, I_FREEING} state;
  //struct timespec modify_time;
  //struct timespec create_time;
  unsigned size;//代表文件大小以字节为单位
  int type;
};

//定义vfs内的元素inode
struct inode{
  struct list_head     i_list;//所有inode
  //struct hlist_node list;//指向hash链表指针，用于inode的hash表
  unsigned long ino;//节点号
  atomic_t  count;//引用
  unsigned int nlink;//建立硬链接的文件数
  atomic_t write_count;//记录多少进程以刻写模式打开此文件
  atomic_t read_count;//记录多少进程以读模式打开此文件
  struct inode_mode mode;//文件的类型和状态
  int pages;

  //用于描述页高速缓存中的页面的。一个文件对应一个address_space，一个address_space和一个偏移量可以确定一个页高速缓存中的页面。
  struct address_space * mapping;//表示向谁请求页面
  struct address_space data;//被inode读写的页面

  struct list_head  d_list;//指向目录项链表指针，注意一个inodes可以对应多个dentry，因为一个实际的文件可能被链接到其他的文件，那么就会有另一个dentry，这个链表就是将所有的与本inode有关的dentry都连在一起。


  struct inode_operations *i_operations;//对inode的操作
  const struct file_operations *f_operations;//对文件和目录的操作(sys calls)
  struct super_block *sb;  //所属的超级块


  //TODO 可能有其他inode list
};



//inode的操作
struct inode_operations{
  int (*create) (struct inode *, struct dentry*, struct nameidata *);//为dentry创建inode
  struct dentry *(*lookup)(struct inode *, struct dentry *, struct nameidata *);//在dentry和它对应的inode下查找dentry
  int (*mkdir)(struct inode *, struct dentry *, umode_t);//为dentry创建一个inode
  int (*rmdir) (struct inode *,struct dentry *);//删除dentry下对应的inode的子dentry
  int (*rename)(struct inode *, struct dentry *, struct inode *, struct dentry *);//将old_dir目录下的文件 old_dentry移到new_dir目录下，新文件名包含在 new_dentry指向的目录项中
  //int (*setattr) (struct dentry *, struct iattr *);//设置dentry属性
   int (*getattr) (const struct path *, struct kstat *, u32, unsigned int);
};

//dentry的定义（树结构）
struct dentry {
  atomic_t count;//目录项对象使用计数器,（有多少个dentry指向同一个inode）
  struct inode *inode; //关联的inode
  struct dentry *parent; //父目录的目录项对象
  //struct list_head lru; //未使用的dentry
  struct list_head child; //所有子dentry
  struct list_head subdirs;//表示子目录的子dentry
  struct list_head alias; //所有与对应inode有关的dentry的链表（inode中的struct hlist_head  dentry）
  int mounted; //该目录下挂载的文件系统的数量
  //unsigned long time; /* 重新变为有效的时间！注意只要操作成功这个dentry就是有效的，否则无效。（used by d_revalidate） */
  struct dentry_operations *operations;// 目录项方法
  struct super_block * sb; //文件的超级块对象
  //unsigned long d_vfs_flags;
  // void * d_fsdata;//与文件系统相关的数据
  struct qstr d_name;// 存放文件名
};

//dentry的操作
struct dentry_operations {
    int (*d_compare)(const struct dentry *, const struct inode *,
                    const struct dentry *, const struct inode *,
                     unsigned int, const char *, const struct qstr *);//比较两个dentry
  // int (*d_delete)(const struct dentry *);
  void (*d_release)(struct dentry *);//用于释放dentry资源
  void (*d_iput)(struct dentry *, struct inode *);//释放dentry对应inode引用计数
};


//TODO
struct fown_struct{};

//打开的文件
struct file {
  struct list_head	list;//记录所有文件
  //struct path		path;//文件路径
  struct dentry     *dentry;
  struct inode		*inode;//对应的inode
  loff_t            position;//访问文件内的位置
  //struct mutex      m_position;//修改位置的互斥锁
  const struct file_operations	*f_operations;//对文件的所有操作
  struct file_state * state;//文件的状态和权限
  atomic_t count;//文件的打开次数
  //当我们关闭一个进程的某一个文件描述符时候，其实并不是真正的关闭文件，仅仅是将count减一，当count=0时候，才会真的去关闭它。
  struct fown_struct	owner;//打开文件的进程
  struct address_space	*mapping;//与inode 的mapping一样
};

struct file_state{
  enum{F_NONE,F_INIT,F_OPENED,F_CLOSED} status;
  bool readable;//1可0不可
  bool writeable;//1可0不可
};

//文件的操作
struct file_operations {
  //struct module *owner;
  loff_t (*llseek) (struct file *, loff_t, int);//改变读写位置
  ssize_t (*read) (struct file *, size_t, loff_t *);
  ssize_t (*write) (struct file *, size_t, loff_t *);

  int (*readdir) (struct file *, void *, filldir_t);//读取目录，返回什么？

  int (*open) (struct inode *, struct file *);//从inode打开文件

  int (*release) (struct inode *, struct file *);//从inode释放文件
  ssize_t (*sendfile)(struct file*,loff_t *, size_t,read_actor_t, void *);

  //t (*dir_notify)(struct file *filp, unsigned long arg);//请求改变目录时调用
};
//TODO 文件列表等
//https://cloud.tencent.com/developer/article/1053876
static inline struct dentry *dget(struct dentry *dentry)
{
  atomic_inc(&dentry->count);
  return dentry;
}

struct path {
  struct vfsmount *mnt;
  struct dentry *dentry;
};
