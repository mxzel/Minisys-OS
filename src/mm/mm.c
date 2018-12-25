
#include <include/mm/mm.h>

void mm_init(void)
{
    pmm_init();
    vmm_init();
}

uint32_t alloc_page(pid_t pid, size_t size)
{
    /**
     * 为进程分配内存
     * pid      : 进程的 id 号
     * size     : 分配空间的大小
     */
    int count = 0;
    int n_bytes = size;
    while (n_bytes > 0)
    {
        count += 1;
        n_bytes -= 4096;
    }

    if(count > free_pages_count() || count == 0){
        // 物理内存不够用 或者是参数无效
        assert(false);
    }

    // 首先分配一个页，根据这个页可以获得分配的所有空间的首地址（虚拟地址），即 ret_addr
    uint32_t phy_page_addr;
    phy_page_addr = pmm_alloc_page();
    uint32_t ret_addr;
    ret_addr = vmm_alloc_page(phy_page_addr, pid);

    // 然后在虚拟内存上连续分配页，这些页在物理内存上可能是不连续的
    int i;
    for (i = 1; i < count; ++i){
        phy_page_addr = pmm_alloc_page();
        vmm_alloc_page(phy_page_addr, pid);
    }
    
    // 返回分配的内存空间的首地址（虚拟地址）
    return ret_addr;
}


void copy_page(uint32_t src, uint32_t dst, int count){
    // 将 src 开始的连续的几个页拷贝到 dst 中（虚拟地址）
    uint32_t *p_src = src;
    uint32_t *p_dst = dst;
    int index;
    for (index = 0; index < count; ++index){
        *(p_dst++) = *(p_src++);
    }
}

void free_page(uint32_t p, int count)
{
    /**
     * uint32_t p : 分配的内存首地址（虚拟地址）
     * int count  : 分配的页框数量
     */
    int i;
    uint32_t phy_addr, vir_addr;
    vir_addr = p;
    for (i = 0; i < count; ++i)
    {
        phy_addr = get_phy_addr_by_vir_addr(vir_addr);
        pmm_free_page(phy_addr);
        vmm_free_page(phy_addr);
        vir_addr += 0x1000;
    }
}