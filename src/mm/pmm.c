/*
 * =====================================================================================
 *
 *       Filename:  pmm.c
 *
 *    Description:  页内存管理
 * 
 * =====================================================================================
 */

// #include "multiboot.h"
// #include "common.h"
// #include "debug.h"
#include <include/mm/pmm.h>

// 物理内存页面管理的栈
static uint32_t pmm_stack[PAGE_MAX_COUNT];

// 物理内存管理的栈指针
static uint32_t pmm_stack_top;

// 物理内存页的数量
uint32_t phy_page_count;

void pmm_init(){
    phy_page_count = -1;
    uint32_t page_addr = PTE_ADDR;
    while (page_addr + PMM_PAGE_SIZE < RAM_STOP){
        pmm_free_page(page_addr);
        page_addr += PMM_PAGE_SIZE;
        phy_page_count++;
    }
}

uint32_t pmm_alloc_page()
{
	assert(pmm_stack_top != -1, "out of memory");

	uint32_t page = pmm_stack[pmm_stack_top--];

	return page;
}

void pmm_free_page(uint32_t p)
{
	assert(pmm_stack_top != PAGE_MAX_COUNT, "out of pmm_stack stack");

	pmm_stack[++pmm_stack_top] = p;
}

