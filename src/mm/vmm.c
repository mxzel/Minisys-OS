#include <include/mm/vmm.h>

static pte_t *pte_addr = (pte_t *)PTE_ADDR;
// TODO: 硬件上设置页面大小
void vmm_init(void){    
    // 页表数组指针
    pte_t (*pte_kern)[PTE_COUNT] = (pte_t (*)[PTE_COUNT])pte_addr;

    // 构造页目录(MMU需要的是物理地址，此处需要减去偏移)
    uint32_t pgd_idx = PGD_INDEX(PAGE_OFFSET);
    for (uint32_t i = pgd_idx; i < pgd_idx + PTE_COUNT; ++i) {
            pgd_kern[i] = ((uint32_t)ka_to_pa(pte_kern[i])) | PAGE_PRESENT | PAGE_WRITE;
    }

    // 构造页表映射，内核 0xC0000000～0xF8000000 映射到 物理 0x00000000～0x38000000 (物理内存前896MB)
    uint32_t *pte_start = (uint32_t *)(pte_addr + PTE_SIZE * pgd_idx);
    for (uint32_t i = 0; i < PTE_SIZE * PTE_COUNT; ++i) {
            pte_start[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;
    }
}