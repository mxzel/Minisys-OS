
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