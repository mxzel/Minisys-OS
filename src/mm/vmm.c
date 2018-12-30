#include <mm/vmm.h>

static pte_t *pte_addr = (pte_t *)PTE_ADDR;

// 各 block 的偏移量（上式从左到右）
uint16_t block_offset[BLOCK_NUM_PER_PAGE] = {0};

// 各 block 的标志位
uint32_t block_flag[BLOCK_NUM_PER_PAGE] = {0};

// 各 block 的大小
uint16_t block_size[BLOCK_NUM_PER_PAGE] = {0};

uint32_t vmm_page_addr = PTE_ADDR + PAGE_TABLE_SIZE - 0x80000000;

// TODO: 硬件上设置页面大小
void vmm_init(void){

    /* 设置页表中的有效页为未分配，无效页为保留 */
    int cnt = 0;
    uint64_t mask = 0xffffffcf;
    for (pte_p = PAGE_TABLE_P; pte_p < PAGE_TABLE_P + PAGE_TABLE_SIZE; pte_p++, cnt++)
    {
        if(cnt < PTE_COUNT)
            *pte_p &= mask;
        else
            *pte_p = 0x03 << 4;
    }

    /* 初始化 block_offset block_flag block_size */
    int idx = 0, offset = 0, flag = 0x10000000, size = 1024;

    block_offset[idx] = offset;
    offset += 1024;
    block_flag[idx] = flag;
    flag = flag >> 1;
    block_size[idx++] = size;
    size = 512;

    block_offset[idx] = offset;
    offset += 512;
    block_flag[idx] = flag;
    flag = flag >> 1;
    block_size[idx++] = size;
    size = 256;

    int k;
    for (k = 0; k < 3; ++k){
        block_offset[idx] = offset;
        offset += 256;
        block_flag[idx] = flag;
        flag = flag >> 1;
        block_size[idx++] = size;
        size = 256;
    }

    size = 128;

    for (k = 0; k < 8; ++k){
        block_offset[idx] = offset;
        offset += 128;
        block_flag[idx] = flag;
        flag = flag >> 1;
        block_size[idx++] = size;
        size = 128;
    }

    size = 64;

    for (k = 0; k < 8; ++k){
        block_offset[idx] = offset;
        offset += 64;
        block_flag[idx] = flag;
        flag = flag >> 1;
        block_size[idx++] = size;
        size = 64;
    }

    size = 32;

    for (k = 0; k < 8; ++k){
        block_offset[idx] = offset;
        offset += 32;
        block_flag[idx] = flag;
        flag = flag >> 1;
        block_size[idx++] = size;
        size = 32;
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

uint32_t get_pid_from_pte(pte_t pte){
    // 根据 PTE 获得 pid
    return pte & 0x0f;
}

pte_t *get_pte_by_page_addr(uint32_t page_addr){
    // 根据页的虚拟地址获得pte
    page_addr &= PAGE_MASK;
    int vpn = get_vpn_from_page_addr(page_addr);
    int cnt = 0;
    for (pte_p = PAGE_TABLE_P; pte_p < PAGE_TABLE_P + PAGE_TABLE_SIZE && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_vpn_from_pte(*pte_p) == vpn){
            return pte_p;
        }
    }
    return NULL;
}

uint32_t get_vpn_from_page_addr(uint32_t page_addr){
    // 根据虚拟地址获得虚拟页号
    return (page_addr & PAGE_MASK) >> 12;
}

uint32_t get_ppn_by_vpn(uint32_t vpn){
    // 根据虚拟页号获得物理页号
    int cnt = 0;
    for (pte_p = PAGE_TABLE_P; pte_p < PAGE_TABLE_P + PAGE_TABLE_SIZE && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_vpn_from_pte(*pte_p) == vpn){
            return get_ppn_from_pte(*pte_p);
        }
    }
    return 0;
}

uint32_t get_phy_addr_by_vir_addr(uint32_t vir_addr){
    // 根据虚拟地址获得物理地址
    uint32_t vpn = get_vpn_from_page_addr(vir_addr);
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
    for (pte_p = PAGE_TABLE_P; pte_p < PAGE_TABLE_P + 0x1000 && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            int mask = 0xffffffcf;
            status = status << 4;
            *pte_p = (*(pte_p) & mask) | status;
            break;
        }
    }
}

bool judge_is_split_block(uint32_t pte_block_flag){
    // 判断是否以block为粒度来分配
     if(pte_block_flag & 0x80000000 == 0)
         return false;
     return true;
}

int get_suitable_block_from_pte(pte_t pte, size_t size){
    // 从 pte 中获得满足 size 大小的合适的 block
    int idx = BLOCK_NUM_PER_PAGE - 1;
    uint32_t pte_block_flag = (uint32_t)(pte >> 32);
    // 如果该页不支持拆分 则查找失败
    if(pte_block_flag & 0x80000000 == 0)
        return -1;
    // 大小不满足条件，或者是满足大小的block已分配的情况下 继续寻找
    while(block_size[idx] < size || (pte_block_flag & block_flag[idx]) != 0){
        --idx;
        if(idx == -1)
            return -1;
    }
    return idx;
}

size_t up_round(size_t size){
    /**
     * 对size向上取已有的block大小整
     * 15取到32 65取到128
     * 最大取到1024，即block最大为1K
     */
    if(size <= 32)
        return 32;
    else if(size <= 64)
        return 64;
    else if(size <= 128)
        return 128;
    else if(size <= 256)
        return 256;
    else if(size <= 512)
        return 512;
    return 1024;
}

void alloc_block(uint32_t block_addr){
    uint32_t offset = block_addr & (~PAGE_MASK);
    int idx = 0;
    for (idx = 0; idx < BLOCK_NUM_PER_PAGE; ++idx){
        if(block_offset[idx] == offset)
            break;
    }
    *pte_p |= ((uint64_t)block_flag[idx]) << 32;
}

void free_block(uint32_t block_addr){
    uint32_t page_addr = block_addr & PAGE_MASK;
    uint32_t offset = block_addr & (~PAGE_MASK);
    int idx = 0;
    for (idx = 0; idx < BLOCK_NUM_PER_PAGE; ++idx){
        if(block_offset[idx] == offset)
            break;
    }
    pte_p = get_pte_by_page_addr(page_addr);
    *pte_p &= ~(((uint64_t)block_flag[idx]) << 32);
}

uint32_t find_block(pid_t pid, size_t size){
    /**
     * 为进程pid所需要的空间size寻找合适的block
     */
    size_t size_up_round = up_round(size);
    int cnt = 0;
    for (pte_p = PAGE_TABLE_P; pte_p < PAGE_TABLE_P + PAGE_TABLE_SIZE && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_pid_from_pte(*pte_p) == pid){
            int block_idx = get_suitable_block_from_pte(*pte_p, size);
            if(block_idx == -1)
                continue;
            uint32_t block_addr = get_vpn_from_pte(*pte_p) << 12 + block_offset[block_idx];
            return block_addr;
        }
    }
    return NULL;
}

uint32_t vmm_alloc_page(uint32_t page_addr, pid_t pid, bool is_split_block)
{
    uint32_t ret_addr = vmm_page_addr;
    uint32_t ppn = get_ppn_from_page(page_addr);
    uint32_t vpn = vmm_page_addr >> 12;
    int cnt = 0;
    for (pte_p = PAGE_TABLE_P; pte_p < PAGE_TABLE_P + PAGE_TABLE_SIZE && cnt != PTE_COUNT; pte_p++, cnt++)
    {
        if(get_ppn_from_pte(*pte_p) == ppn){
            *pte_p = 0;
            *pte_p |= (ppn << 26);
            *pte_p |= (vpn << 6);
            *pte_p |= (0x01 << 4);
            *pte_p |= (pid & 0x0f);
            if(is_split_block == true)
                *pte_p |= 0x8000000000000000;
            break;
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