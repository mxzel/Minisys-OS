#include <mm/mm.h>
#include <debug.h>
#include <mm/mm_test.h>

/**
 * 
 *  cd "c:\Comprehensive\OSX\src\" ; if ($?) { gcc main.c -o main -I ./include -I ./lib -I ./include/lib } ; if ($?) { .\main }
 * 
 */

void test_pmm(){
    /**
     * 开始时一共有28个空闲物理页
     * 第一次分配的物理页地址为 0x0003E000（物理地址）
     * 最后一次分配的物理页地址为 0x00022000（物理地址）
     */
    pmm_init();
    int i = 0;
    for (i = 0; i < 35; ++i){
        uint32_t phy_page_addr = pmm_alloc_page();
        writeValTo7SegsHex(phy_page_addr);
        delay();
    }
    // pmm_init();
    // uint32_t phy_page_addr = ?mm_alloc_page();
    // int32_t ret = get_pmm_stack_top();
    // writeValTo7SegsDec(phy_page_addr);
    // writeValTo7SegsHex(1);
}

void test_vmm(){
    /**
     * 第一次分配的虚拟页地址为 0x00022000（虚拟地址）
     * 
     */
    pmm_init();
    // uint32_t phy_page_addr = pmm_alloc_page();
    vmm_init();
    uint32_t vmm_page_addr = (uint32_t)kmalloc(0, 32);

    // pte_t *pte = get_pte_by_page_addr(vmm_page_addr);
    // if(pte != NULL){
    //     uint32_t high = (uint32_t)((*pte) >> 32);
    //     uint32_t low = (uint32_t)(*pte);
    //     writeValTo7SegsHex(high);
    //     delay();
    //     writeValTo7SegsHex(low);
    // }else{
    //     int vpn = get_vpn_from_page_addr(vmm_page_addr);
    //     writeValTo7SegsHex(0xffffffff);
    // }
    
}

int main(){
    mm_init();
    test_alloc_memory();
    // test_rw_memory();
    // test_vmm();
    return 0;

    mm_init();
    unsigned int page_addr;
    // page_addr = (unsigned int)(int *)kmalloc(1, 32);
    // pte_t *pte;
    // pte = get_pte_by_page_addr(page_addr);
    // uint32_t high = (uint32_t)((*pte) >> 32);
    // uint32_t low = (uint32_t)(*pte);
    // uint32_t ppn = get_ppn_from_pte(*pte);
    // uint32_t vpn = get_vpn_from_pte(*pte);
    // writeValTo7SegsHex((ppn << 4) + vpn);
    
    delay();
    return 0;
}