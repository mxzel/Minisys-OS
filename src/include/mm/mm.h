#ifndef INCLUDE_MM_MM_H_
#define INCLUDE_MM_MM_H_

#include <mm/pmm.h>
#include <mm/vmm.h>



#define PAGE_SIZE 4096

extern uint32_t page_alloc_addrs[64];
extern uint8_t page_alloc_counts[64];
extern int idx;


// 地址转换为指针
void *addr_to_ptr(uint32_t addr);

// 内存管理子系统初始化
void mm_init(void);

void *kmalloc(pid_t pid, size_t size);

void kfree(void *ptr);

#endif // INCLUDE_MM_MM_H_