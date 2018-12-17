//TODO 已挂载的文件系统链表
struct vfsmount {
  char *mnt_devname;
  int mnt_flags;
  struct dentry *mnt_mountpoint;
  struct dentry *mnt_root;
  struct super_block *mnt_sb;
  short mnt_count;
};

//对一个文件系统的描述
struct super_block{
  struct list_head    list;//所有文件系统链表
  unsigned long blocksize;//TODO 块数量？
  int use_count;//使用计数
  int ref_count;//引用计数
  struct sb_mode mode;//状态信息
  
  struct file_system_type *type;//TODO 文件系统类型？
  struct super_operations *sb_operations;//sb操作的接口
  struct dentry *root;//根目录
  const struct dentry_operations *d_operations;
  struct list_head files;//所有file
  struct list_head inodes;//所有inode
  struct mutex 	lock;//锁
};

struct sb_mode{
  short mounted;//是否已经挂载
  bool readable;//1可0不可
  bool writeable;//1可0不可
};

//TODO sb操作的接口定义，需要删减
struct super_operations{
   	struct inode *(*alloc_inode)(struct super_block *sb);
	void (*destroy_inode)(struct inode *);

   	void (*dirty_inode) (struct inode *, int flags);
	int (*write_inode) (struct inode *, struct writeback_control *wbc);
	int (*drop_inode) (struct inode *);
	void (*evict_inode) (struct inode *);
	void (*put_super) (struct super_block *);
	int (*sync_fs)(struct super_block *sb, int wait);
	int (*freeze_super) (struct super_block *);
	int (*freeze_fs) (struct super_block *);
	int (*thaw_super) (struct super_block *);
	int (*unfreeze_fs) (struct super_block *);
	int (*statfs) (struct dentry *, struct kstatfs *);
	int (*remount_fs) (struct super_block *, int *, char *);
	void (*umount_begin) (struct super_block *);

	int (*show_options)(struct seq_file *, struct dentry *);
	int (*show_devname)(struct seq_file *, struct dentry *);
	int (*show_path)(struct seq_file *, struct dentry *);
	int (*show_stats)(struct seq_file *, struct dentry *);
#ifdef CONFIG_QUOTA
	ssize_t (*quota_read)(struct super_block *, int, char *, size_t, loff_t);
	ssize_t (*quota_write)(struct super_block *, int, const char *, size_t, loff_t);
	struct dquot **(*get_dquots)(struct inode *);
#endif
	int (*bdev_try_to_free_page)(struct super_block*, struct page*, gfp_t);
	long (*nr_cached_objects)(struct super_block *,
				  struct shrink_control *);
	long (*free_cached_objects)(struct super_block *,
				    struct shrink_control *);
};

//TODO 定义vfs内的元素inode
struct inode{
  struct hlist_node hash;//指向hash链表指针，用于inode的hash表
  unsigned long ino;//节点号
  unsigned short ref_conut;//引用
  const unsigned int nlink;//建立硬链接的文件数
  //TODO 需要 (set|clear|inc|drop)_nlink/ inode_(inc|dec)_link_count 来修改
  unsigned short write_count;//记录多少进程以刻写模式打开此文件
  unsigned short read_count;//记录多少进程以刻写模式打开此文件
  struct inode_mode mode;//文件的类型和访问权限

  //用于描述页高速缓存中的页面的。一个文件对应一个address_space，一个address_space和一个偏移量可以确定一个页高速缓存中的页面。
  struct address_space * mapping;//表示向谁请求页面
  struct address_space data;//被inode读写的页面

  struct hlist_head  dentry;//指向目录项链表指针，注意一个inodes可以对应多个dentry，因为一个实际的文件可能被链接到其他的文件，那么就会有另一个dentry，这个链表就是将所有的与本inode有关的dentry都连在一起。
  struct timespec access_time;
  struct timespec modify_time;
  struct timespec create_time;
  unsigned size;//代表的，文件大小以字节为单位
  unsiged long state;//TODO
  
  struct inode_operations *i_operations;//对inode的操作
  const struct file_operations *f_operations;//对文件和目录的操作(sys calls)
  struct super_block *sb;  //所属的超级块

  struct list_head     lru_list;//所有inode
  //TODO 可能有其他inode list
};

//TODO
struct inode_mode{
  enum{I_NEW, I_LOCk, I_FREEING} state;
}

//TODO inode的操作
struct inode_operations{
  int (*create) (struct inode *, struct dentry*, struct nameidata *);
  struct dentry *(*lookup)(struct inode *, struct dentry *, struct nameidata *);
  int (*mkdir)(struct inode *, struct dentry *, umode_t);
  int (*rmdir) (struct inode *,struct dentry *);
  int (*rename)(struct inode *, struct dentry *, struct inode *, struct dentry *);
  //int (*setattr) (struct dentry *, struct iattr *);
  //int (*getattr) (const struct path *, struct kstat *, u32, unsigned int);
  int (*update_time)(struct inode *, struct timespec *, int);
}

//dentry的定义（树结构）
struct dentry { 
  atomic_t d_count;//目录项对象使用计数器,可以有未使用态,使用态和负状态   
  struct inode *d_inode; //关联的inode
  struct dentry *d_parent; //父目录的目录项对象 
  struct list_head d_hash; //TODO 散列表表项,用于管理dentry
  struct list_head d_lru; //未使用的dentry
  struct list_head d_child; //所有子dentry 
  struct list_head d_subdirs;//表示子目录的dentry 
  struct list_head d_alias; //所有与对应inode有关的dentry的链表（inode中的struct hlist_head  dentry）
  int d_mounted; //该目录下挂载的文件系统的数量 
  struct qstr d_name; //名称
  unsigned long d_time; /* 重新变为有效的时间！注意只要操作成功这个dentry就是有效的，否则无效。（used by d_revalidate） */ 
  struct dentry_operations *d_operations;// 目录项方法 
  struct super_block * sb; //文件的超级块对象 
  //unsigned long d_vfs_flags; 
  void * d_fsdata;//与文件系统相关的数据 
  unsigned char d_iname [DNAME_INLINE_LEN];// 存放短文件名
};

//TODO dentry的操作
struct dentry_operations {
    int (*d_compare)(const struct dentry *, const struct inode *,
                    const struct dentry *, const struct inode *,
                    unsigned int, const char *, const struct qstr *);
    int (*d_delete)(const struct dentry *);
    void (*d_release)(struct dentry *);
    void (*d_iput)(struct dentry *, struct inode *);
    char *(*d_dname)(struct dentry *, char *, int);
};

//打开的文件
struct file {
  struct llist_node	list;//记录所有文件
  struct path		path;//文件路径
  struct inode		*inode;//对应的inode
  loff_t position;//访问文件内的位置
  struct mutex m_position;//修改位置的互斥锁
  const struct file_operations	*f_operations;//对文件的所有操作
  struct file_mode * mode;//文件的状态和权限
  short count;//文件的打开次数
  //当我们关闭一个进程的某一个文件描述符时候，其实并不是真正的关闭文件，仅仅是将f_count减一，当f_count=0时候，才会真的去关闭它。
  struct fown_struct	f_owner;//打开文件的进程
  struct address_space	*mapping;//与inode 的mapping一样
};

struct file_mode{
  enum{F_NONE,F_INIT,F_OPENED,F_CLOSED} status;
  bool readable;//1可0不可
  bool writeable;//1可0不可
};

//TODO 文件的操作
struct file_operations {
	struct module *owner;
	loff_t (*llseek) (struct file *, loff_t, int);
	ssize_t (*read) (struct file *, char __user *, size_t, loff_t *);
	ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
	int (*mmap) (struct file *, struct vm_area_struct *);
	unsigned long mmap_supported_flags;
	int (*open) (struct inode *, struct file *);
	int (*release) (struct inode *, struct file *);
};
//TODO 文件列表等
//https://cloud.tencent.com/developer/article/1053876

//TODO 互斥锁实现
struct mutex;

struct list_head {
　　struct list_head *next, *prev;
};
//TODO
struct hlist_node{};

//TODO
struct llist_node{};

//TODO
struct address_space{};

//TODO
struct fown_struct{};

//TODO define loff_t
