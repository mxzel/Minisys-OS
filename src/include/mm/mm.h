#ifndef INCLUDE_MM_MM_H_
#define INCLUDE_MM_MM_H_

#include <include/mm/pmm.h>
#include <include/mm/vmm.h>

uint32_t page_alloc_addrs[64];
uint8_t page_alloc_counts[64];
int idx;
#define PAGE_SIZE 4096
=======
extern uint32_t page_alloc_addrs[64];
extern uint8_t page_alloc_counts[64];
extern int idx;

>>>>>>> origin/minxue
// 地址转换为指针
void *addr_to_ptr(uint32_t addr);

// 内存管理子系统初始化
void mm_init(void);

void *kmalloc(pid_t pid, size_t size);

void kfree(void *ptr);

#endif // INCLUDE_MM_MM_H_