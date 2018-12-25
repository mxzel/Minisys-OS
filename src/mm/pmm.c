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
    pmm_stack_top = -1;
    uint32_t page_addr = PTE_ADDR + PAGE_TABLE_SIZE; // 页目录占用几个页框，在此之后才是可分配的页
    int cnt;
    for (cnt = 0; cnt < PAGE_MAX_COUNT; ++cnt)
    {
        pmm_free_page(page_addr);
        page_addr += PMM_PAGE_SIZE;
        phy_page_count++;
    }
}

uint32_t pmm_alloc_page()
{
    // 返回页框的物理地址（内核栈中存放的是页框的物理地址）
	assert(pmm_stack_top != -1, "out of memory");

	uint32_t page = pmm_stack[pmm_stack_top--];
    --phy_page_count;
    
    return page;
}

void pmm_free_page(uint32_t p)
{
    // 参数为页面的物理地址
	assert(pmm_stack_top != PAGE_MAX_COUNT, "out of pmm_stack stack");

	pmm_stack[++pmm_stack_top] = p;
    ++phy_page_count;
}

uint32_t free_pages_count(void){
    return phy_page_count;
}
