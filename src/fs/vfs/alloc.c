#include<list.h>
#include<types.h>
#include<mm/mm.h>
#include<fs/vfs.h>


//TODO memset/memcopy

//=====================================================
//=alloc.c
//=
//=本文件涉及所有文件系统相关结构体的内存管理（创建/释放等）
//=需要将函数签名声明在vfs.h中，通过include"vfs.h"来使用。
//=
//=====================================================


//=====================================================
//以下是用来管理所有结构体变量的链表和统计信息

//VFSMOUNT相关变量
LIST_HEAD(mount_list);//所有已挂载的文件系统


//INODE相关变量
int nr_inodes;//inode数量
LIST_HEAD(inode_list);//保存所有inode的链表

//DENTRY相关变量
int nr_dentries;


//=======================================================
//以下是相关函数

//alloc函数
//此处的所有alloc仅对结构体的基本字段进行初始化，不涉及具体文件系统。
//文件系统对应的函数调用alloc函数后再进行针对性的初始化。


struct vfsmount * alloc_mount(){
  struct vfsmount * mnt;
  mnt = kmalloc(0,sizeof(struct vfsmount));
  memset(mnt,0,sizeof(struct vfsmount));
  INIT_LIST_HEAD(&mnt->list);
  INIT_LIST_HEAD(&mnt->mounts);
  INIT_LIST_HEAD(&mnt->child);
  mnt->count = 0;
  return mnt;
}

struct super_block * alloc_sb(){
  struct super_block * sb;
  sb = kmalloc(0,sizeof(struct super_block));
  memset(sb,0,sizeof(struct super_block));
  INIT_LIST_HEAD(&sb->list);
  INIT_LIST_HEAD(&sb->files);
  INIT_LIST_HEAD(&sb->inodes);
  sb->mode.mounted=0;
  return sb;
}


struct inode* alloc_inode(struct super_block *sb){
  static struct address_space_operations empty_aops;
  static struct inode_operations empty_iops;
  static struct file_operations empty_fops;
  struct inode *inode;
  static unsigned long last_ino;


  inode=(struct inode*)kmalloc(0,sizeof(struct inode));

  if(inode){
    struct address_space * const mapping = &inode->data;
    inode->ino=last_ino++;
    inode->sb = sb;
    atomic_set(&inode->count, 1);
    inode->nlink=0;
    inode->i_operations = &empty_iops;
    inode->f_operations = &empty_fops;
    inode->nlink = 1;
    atomic_set(&inode->write_count, 0);
    atomic_set(&inode->read_count, 0);

    inode->mode.size = 0;
    inode->mode.state = I_NEW;

    mapping->a_operations = &empty_aops;
    mapping->host = inode;
    mapping->nrpages = 0;
    INIT_LIST_HEAD(&mapping->pages);
    inode->mapping=mapping;
  }

  list_add(&inode->i_list, &inode_list);
  return inode;

}


struct dentry *alloc_dentry(struct dentry * parent, const struct qstr *name)
{
	struct dentry *dentry;
	char *dname;

	dentry = kmalloc(0,sizeof(struct dentry));

    dname = kmalloc(0,name->len + 1);

	dentry->d_name.name = dname;
	dentry->d_name.len = name->len;
	memcpy(dname, name->name, name->len);
	dname[name->len] = 0;

	atomic_set(&dentry->count, 1);
	dentry->inode = NULL;
	dentry->parent = NULL;
	dentry->sb = NULL;
	dentry->operations = NULL;
	dentry->mounted = 0;
	INIT_LIST_HEAD(&dentry->subdirs);
	INIT_LIST_HEAD(&dentry->alias);

	if (parent) {
      dentry->parent = dget(parent);
      dentry->sb = parent->sb;
	} else {
	  INIT_LIST_HEAD(&dentry->child);
	}

	if (parent)
		list_add(&dentry->child, &parent->subdirs);
	nr_dentries++;

    return dentry;
}

struct dentry * alloc_dentry_root(struct inode *root_inode){
  struct dentry *res = NULL;

  if (root_inode) {
    static const struct qstr name = { .name = "/", .len = 1 };

    res = alloc_dentry(NULL, &name);
    res->sb = root_inode->sb;
    res->parent = res;
    list_add(&res->alias, &root_inode->d_list);
    res->inode = root_inode;
  }
  return res;
}

struct file* alloc_file(){
  struct file* f = kmalloc(0,sizeof(struct file));
  memset(f,0,sizeof(struct file));
  INIT_LIST_HEAD(&f->list);


}
