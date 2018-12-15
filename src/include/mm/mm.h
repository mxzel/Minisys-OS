#ifndef INCLUDE_MM_MM_H_
#define INCLUDE_MM_MM_H_

#include <include/mm/pmm.h>
#include <include/mm/vmm.h>

// 内存管理子系统初始化
void mm_init(void);

// 为指定进程分配一个页框
uint32_t alloc_page(pid_t pid);

// 释放指定页框
void free_page(uint32_t p);

#endif // INCLUDE_MM_MM_H_