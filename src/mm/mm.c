/*
 * =====================================================================================
 *
 *       Filename:  mm.c
 *
 *    Description:  内存管理子系统
 *
 *        Version:  1.0
 *        Created:  2014年11月05日 09时54分05秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Qianyi.lh (liuhuan), qianyi.lh@alibaba-inc.com
 *        Company:  Alibaba-Inc Aliyun
 *
 * =====================================================================================
 */

#include <include/mm/mm.h>

void mm_init(void)
{
    pmm_init();
    vmm_init();
}

uint32_t alloc_page(pid_t pid)
{
    uint32_t page_addr = pmm_alloc_page();
    vmm_alloc_page(page_addr, pid);
    return page_addr;
}

void free_page(uint32_t p)
{
    pmm_free_page(p);
    vmm_free_page(p);
}