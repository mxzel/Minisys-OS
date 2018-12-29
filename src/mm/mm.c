
#include <mm/mm.h>

uint32_t page_alloc_addrs[64];
uint8_t page_alloc_counts[64];
int idx;

// 地址转换为指针
void *addr_to_ptr(uint32_t addr){
    return (void *)addr;
}

void mm_init(void)
{
    for (idx = 0; idx < 64; ++idx){
        page_alloc_addrs[idx] = NULL;
        page_alloc_counts[idx] = 0;
    }
    idx = 0;

    // pmm_init();
    // vmm_init();
}

void *kmalloc(pid_t pid, size_t size){
    /**
     * 单次最大可分配1K内存（针对block）
     * 若大于1K，则以页为粒度来分配
     * 
     * 根据进程pid号和大小来判断已有的页框中是否已经有合适的block
     * 如果已经有了 分配block
     * 如果没有 分配新的页给该进程，然后分配block
     * 
     * 判断的方法为：遍历页表，对属于该进程的页框，判断其PTE中的标志位
     * 
     * 由此可见 分配block的参数为：页的地址 size
     * 
     * 分配block的方法为：
     * 对size向上取已有的block大小整 比如 15取到32 65取到128
     * 然后查看是否有满足条件的block（能容得下即为满足，按size从小到大查找）
     * 如果有 分配block
     * 如果没有 分配新的页给该进程 然后再进行上述操作
     */
    if(size <= 1024){
        // 以block为粒度来分配
        uint32_t new_block_addr = find_block(pid, size);
        if(new_block_addr == NULL){
            // 分配新的页，更新 block_addr
            if(free_pages_count() < 1){
                // 没有空闲页
                return NULL;
            }
                
            uint32_t phy_page_addr = pmm_alloc_page();
            vmm_alloc_page(phy_page_addr, pid, true);
            new_block_addr = find_block(pid, size);
            if(new_block_addr == NULL){
                // find_block 内部出现错误
                return NULL;
            }
        }

        return addr_to_ptr(new_block_addr);
    }else{
        // 以页为粒度来分配
        int count = 0;
        while(size > 0){
            ++count;
            size -= 4096;
        }
        // 首先分配一个页，根据这个页可以获得分配的所有空间的首地址（虚拟地址），即 ret_addr
        uint32_t phy_page_addr = pmm_alloc_page();
        uint32_t vir_page_addr = vmm_alloc_page(phy_page_addr, pid, false);

        // 然后在虚拟内存上连续分配页，这些页在物理内存上可能是不连续的
        int i;
        for (i = 1; i < count; ++i){
            phy_page_addr = pmm_alloc_page();
            vmm_alloc_page(phy_page_addr, pid, false);
        }

        page_alloc_addrs[idx] = vir_page_addr;
        page_alloc_counts[idx++] = count;

        return addr_to_ptr(vir_page_addr);
    }
    
}

void kfree(void *ptr){
    uint32_t ptr_block_addr = (uint32_t)ptr;
    uint32_t page_addr = ptr_block_addr & PAGE_MASK;

    // 判断释放的block是否以页为粒度
    int i;
    for (i = 0; i < idx; ++i){
        if(page_alloc_addrs[i] == (uint32_t)ptr){
            // 释放页
            uint32_t phy_addr, vir_addr;
            vir_addr = (uint32_t)ptr;
            int count = page_alloc_counts[i];
            int j;
            for (j = 0; j < count; ++j)
            {
                phy_addr = get_phy_addr_by_vir_addr(vir_addr);
                pmm_free_page(phy_addr);
                vmm_free_page(phy_addr);
                vir_addr += 0x1000;
            }

            j = i + 1;
            while(j < idx){
                page_alloc_addrs[i] = page_alloc_addrs[j];
                page_alloc_counts[i] = page_alloc_counts[j];
                ++i;
                ++j;
            }
            --idx;

            return;
        }
    }

    // 释放block
    free_block(ptr_block_addr);
}
