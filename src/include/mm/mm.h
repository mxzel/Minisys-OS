#ifndef INCLUDE_MM_MM_H_
#define INCLUDE_MM_MM_H_

#include <include/mm/pmm.h>
#include <include/mm/vmm.h>

// 内存管理子系统初始化
void mm_init(void);

// 为指定进程分配内存
uint32_t alloc_page(pid_t pid, size_t size);

// 将 src 开始的连续的几个页拷贝到 dst 中
void copy_page(uint32_t src, uint32_t dst, int count);

// 释放指定页框
void free_page(uint32_t p, int count);

#endif // INCLUDE_MM_MM_H_