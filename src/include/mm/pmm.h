/*
 * 物理内存管理
 * 主要为初始化空闲空间链表
 */

#ifndef INCLUDE_MM_PMM_H_
#define INCLUDE_MM_PMM_H_

// 支持的最大物理内存
#define PMM_MAX_SIZE 0x0003F800

// 内核在物理内存中的起始位置
#define RAM_KERNEL_START 0x80000000

// 内核在物理内存中的结束位置
// 需要 4KB 对齐
#define RAM_KERNEL_STOP 0x8001FFFF

// 物理内存的起始与结束位置
#define RAM_START 0x80000000
#define RAM_STOP 0x8003F800

// 页面大小 4K
#define PMM_PAGE_SIZE 0x1000
// 页掩码 4K 对齐地址
#define PAGE_MASK  0xFFFFF000

// 页表大小 
#define PAGE_TABLE_SIZE (2 * PMM_PAGE_SIZE)

// 页表起始位置（页目录位置） 
#define PTE_ADDR ((RAM_KERNEL_STOP & PAGE_MASK) + PMM_PAGE_SIZE)

// 页表 0x80020000
// 页框 0x80022000

// 最多支持的物理页面个数
#define RESERVED_NUM 34
// #define PAGE_MAX_COUNT ((RAM_STOP - PTE_ADDR - PAGE_TABLE_SIZE) / PMM_PAGE_SIZE + RESERVED_NUM)
#define PAGE_MAX_COUNT ((RAM_STOP - PTE_ADDR - PAGE_TABLE_SIZE) / PMM_PAGE_SIZE)

#include <types.h>
#include <debug.h>
#include <atomic.h>

// 物理内存页面管理的栈
extern uint32_t pmm_stack[PAGE_MAX_COUNT + 1];

// 物理内存管理的栈指针
extern int32_t pmm_stack_top;

// 物理内存页的数量
extern int32_t phy_page_count;


// 物理内存管理初始化
void pmm_init();

uint32_t pmm_alloc_page();

void pmm_free_page(uint32_t p);

// 当前可用内存页，重启时一共有28个空闲的物理页
uint32_t free_pages_count(void);

#endif  // INCLUDE_MM_PMM_H_
