#include<fs/vfs.h>
#include<list.h>

//=====================================================
//=vfs.h
//=
//=本文件涉及所有与dentry有关的操作
//=要将函数都通过extern声明在vfs.h中，
//=便于其他.c文件通过直接include本文件即可使用他们
//
//=====================================================



//dget - 为dentry增加一个引用
//@parameter dentry 对应的dentry
//@return 指向增加过引用的dentry的指针
// inline struct dentry *dget(struct dentry *dentry)
// {
//   atomic_inc(&dentry->count);
//   return dentry;
// }

/**
 * This turns negative dentries into productive full members
 * of society.
 *
 * NOTE! This assumes that the inode count has been incremented
 * (or otherwise set) by the caller to indicate that it is now
 * in use by the dcache.
 */
//d_instantiate - 把dentry和对应的inode关联起来
//@parameter entry dentry
//@parameter inode 要关联的inode
void d_instantiate(struct dentry *entry, struct inode * inode)
{
  //if (!list_empty(&entry->alias)) BUG();
  //spin_lock(&dcache_lock);
  if (inode){
    list_add(&entry->alias, &inode->d_list);
  entry->inode = inode;
  }
  //spin_unlock(&dcache_lock);
  //security_d_instantiate(entry, inode);
}
