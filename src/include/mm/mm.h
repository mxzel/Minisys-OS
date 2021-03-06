#ifndef INCLUDE_MM_MM_H_
#define INCLUDE_MM_MM_H_

#include <mm\pmm.h>
#include <mm\vmm.h>


#define PAGE_SHIFT	12
#define PAGE_SIZE	(1UL << PAGE_SHIFT)

uint32_t page_alloc_addrs[64];
uint8_t page_alloc_counts[64];
int idx;

// 地址转换为指针
void *addr_to_ptr(uint32_t addr);

// 内存管理子系统初始化
void mm_init(void);

// 为进程分配指定大小的内存
void *kmalloc(pid_t pid, size_t size);

// 释放内存
void kfree(void *ptr);

#endif // INCLUDE_MM_MM_H_
