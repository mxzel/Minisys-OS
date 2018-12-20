#include <include/mm/vmm.h>

static pte_t *pte_addr = (pte_t *)PTE_ADDR;


// TODO: 硬件上设置页面大小
void vmm_init(void){
    /* 设置页表中的有效页为未分配，无效页为保留 */
    pte_t* pte_p;
    int cnt = 0;
    int mask = 0xffffffcf;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000; pte_p++, cnt++)
    {
        if(cnt < PTE_COUNT)
            *pte_p &= mask;
        else
            *pte_p = (*(pte_p) & mask) | 0x02;
    }
}

uint32_t get_ppn_from_page(uint32_t phy_page_addr){
    // 根据物理地址获得物理页号
    return (phy_page_addr & PAGE_MASK) >> 12;
}

uint32_t get_ppn_from_pte(pte_t pte){
    // 根据 PTE 获得物理页号
    return (pte & 0xfc000000) >> 26;
}

uint32_t get_vpn_from_pte(pte_t pte){
    // 根据 PTE 获得虚拟页号
    return (pte & 0x03ffffc0) >> 6;
}

uint32_t get_vpn_from_page(uint32_t page_addr){
    // 根据虚拟地址获得虚拟页号
    return (page_addr & PAGE_MASK) >> 12;
}

uint32_t get_ppn_by_vpn(uint32_t vpn){
    // 根据虚拟页号获得物理页号
    pte_t *pte_p;
    int cnt = 0;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_vpn_from_pte(*pte_p) == vpn){
            return get_ppn_from_pte(*pte_p);
        }
    }
    assert(false);
    return -1;
}

uint32_t get_phy_addr_by_vir_addr(uint32_t vir_addr){
    // 根据虚拟地址获得物理地址
    uint32_t vpn = get_vpn_from_page(vir_addr);
    uint32_t ppn = get_ppn_by_vpn(vpn);
    uint32_t phy_addr = (ppn << 12) | (vir_addr & PAGE_MASK);
    return phy_addr;
}

void set_page_unallocated(uint32_t ppn){
    set_page_status(ppn, 0);
}
void set_page_allocated(uint32_t ppn){
    set_page_status(ppn, 1);
}
void set_page_reserved(uint32_t ppn){
    set_page_status(ppn, 2);
}

void set_page_status(uint32_t ppn, int status){
    if(status < 0 || status > 2){
        return;
    }
    pte_t* pte_p;
    int cnt = 0;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            int mask = 0xffffffcf;
            status = status << 4;
            *pte_p = (*(pte_p) & mask) | status;
            break;
        }
    }
}

int get_page_status(uint32_t ppn){
    pte_t *pte_p;
    int cnt = 0;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            int mask = 0xffffffcf;
            int status = ((*pte_p) & (~mask)) >> 4;
            return status;
        }
    }
    return -1;
}

void set_page_pid(uint32_t ppn, pid_t pid){
    pte_t *pte_p;
    int cnt = 0;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            int mask = 0xfffffff0;
            *pte_p = (*(pte_p) & mask) | pid;
            break;
        }
    }
    assert(false);
}

pid_t get_page_pid(uint32_t ppn){
    pte_t *pte_p;
    int cnt = 0;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            int mask = 0xfffffff0;
            int pid = *(pte_p) & (~mask);
            return pid;
        }
    }
    assert(false);
    return -1;
}


uint32_t vmm_alloc_page(uint32_t page_addr, pid_t pid)
{
    uint32_t ret_addr = vmm_page_addr;
    uint32_t ppn = get_ppn_from_page(page_addr);
    uint32_t vpn = vmm_page_addr >> 12;
    pte_t *pte_p;
    int cnt = 0;
    for (pte_p = page_table_p; pte_p < page_table_p + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            *pte_p = 0;
            *pte_p |= (ppn << 26);
            *pte_p |= (vpn << 6);
            *pte_p |= (0x01 << 4);
            *pte_p |= (pid & 0x0f);
            return;
        }
    }
    vmm_page_addr += 0x1000;
    return ret_addr;
}

void vmm_free_page(uint32_t page_addr)
{
    /**
     * uint32_t page_addr : 页框的物理地址
     */
    uint32_t ppn = get_ppn_from_page(page_addr);
    set_page_unallocated(ppn);
}