/*
 * 一些类型的定义
 * TRUE FALSE bool uint64_t
 * time_t pid_t pgd_t pte_t
 * atomic_t list_head
 */

#ifndef _INCLUDE_TYPES_H
#define _INCLUDE_TYPES_H

#ifndef NULL
#define NULL 0
#endif

#ifndef TRUE
#define TRUE  1
#define FALSE 0
#endif

typedef enum bool {
    false = 0,
    true = 1
} bool;

typedef unsigned long long uint64_t;
typedef          long long int64_t;
typedef unsigned int       uint32_t;
typedef          int       int32_t;
typedef unsigned short     uint16_t;
typedef          short     int16_t;
typedef unsigned char      uint8_t;
typedef          char      int8_t;
//typedef unsigned int       size_t;
typedef          int       ssize_t;

// 时间类型
typedef uint32_t time_t;

// 进程 PID
typedef int32_t pid_t;

// 页表条目
typedef uint64_t pte_t;

// 原子类型
typedef struct {
	volatile int counter;
} atomic_t;

// 内核链表类型
struct list_head {
    struct list_head *next;
    struct list_head *prev;
};

//TODO 互斥锁实现
//struct mutex;

typedef long long loff_t;


struct page{
  struct list_head list;
  uint32_t address;
};

#endif  // _INCLUDE_TYPES_H
