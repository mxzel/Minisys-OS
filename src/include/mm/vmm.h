
/*
 * 虚拟内存管理
 * 主要为初始化页表
 */

#include <types.h>
#include <mm/pmm.h>

#ifndef INCLUDE_MM_VMM_H_
#define INCLUDE_MM_VMM_H_

// 映射剩余内存所需要的页表条目数
#define PTE_COUNT PAGE_MAX_COUNT
#define PAGE_TABLE_P ((pte_t*)PTE_ADDR)

pte_t *pte_p; // 游标

// 页面起始位置（虚拟地址）
extern uint32_t vmm_page_addr;
/**
 * 
 *     PTE
 * 
 *     页表条目为 8B
 * 
 *     | 63   60  59  58-56 | 55----48 | 47---40 | 39---32 | 31-26 | 25------6 | 5----4 | 3---0 |
 *     +--------------------+----------+---------+---------+-------+-----------+--------+-------+
 *     | split 1K 512B 256B |---128B---|---64B---|---32B---|--PPN--|----VPN----|-status-|--pid--|
 *     +--------------------+----------+---------+---------+-------+-----------+--------+-------+
 *     
 *     - 63位（最高位）表示该页是否拆分为block使用
 * 
 *     - 32-60位表示页内slob的分配情况，0表示未分配 1表示已分配（位向量）
 *     1K和512B分别由第60位和第59位来表示
 *     256B 由56-58位来表示
 *     128B 64B 32B分别由 48-55位、40-47位 和 32-39位 来表示
 * 
 *     - PPN为物理页号 VPN为虚拟页号
 *     - status表示该页框的分配情况，0表示未分配 1表示已分配 2表示保留 3为无效
 *     - pid表示持有该页的进程id号
 */

/**
 *     slob
 *     页面大小为4K，如果以页为单位分配内存，会产生大量的内部碎片
 *     故将页框分割为几个比较小的block，以block为单位分配内存
 *     
 *     4K = 1K + 512B + 256B * 3 + 128B * 8 + 64B * 8 + 32B * 8
 */

#define BLOCK_NUM_PER_PAGE 29

// 各 block 的偏移量（上式从左到右）
extern uint16_t block_offset[BLOCK_NUM_PER_PAGE];

// 各 block 的标志位
extern uint32_t block_flag[BLOCK_NUM_PER_PAGE];

// 各 block 的大小
extern uint16_t block_size[BLOCK_NUM_PER_PAGE];

// 虚拟内存管理初始化
void vmm_init(void);

// 根据物理地址获得物理页号
uint32_t get_ppn_from_page(uint32_t phy_page_addr);

// 根据 PTE 获得物理页号
uint32_t get_ppn_from_pte(pte_t pte);

// 根据 PTE 获得虚拟页号
uint32_t get_vpn_from_pte(pte_t pte);

// 根据 PTE 获得 pid
uint32_t get_pid_from_pte(pte_t pte);

// 根据页的虚拟地址获得pte
pte_t *get_pte_by_page_addr(uint32_t page_addr);

// 根据虚拟地址获得虚拟页号
uint32_t get_vpn_from_page_addr(uint32_t page_addr);

// 根据虚拟页号获得物理页号
uint32_t get_ppn_by_vpn(uint32_t vpn);

// 根据虚拟地址获得物理地址
uint32_t get_phy_addr_by_vir_addr(uint32_t vir_addr);

void set_page_unallocated(uint32_t ppn);
void set_page_allocated(uint32_t ppn);
void set_page_reserved(uint32_t ppn);
void set_page_status(uint32_t ppn, int status);

// 判断是否以block为粒度来分配
bool judge_is_split_block(uint32_t pte_block_flag);

// 从 pte 中获得满足 size 大小的合适的 block
int get_suitable_block_from_pte(pte_t pte, size_t size);

// 分配、释放页面
uint32_t vmm_alloc_page(uint32_t page_addr, pid_t pid, bool is_split_block);
void vmm_free_page(uint32_t page_addr);

// 对size向上取已有的block大小整
size_t up_round(size_t size);

void alloc_block(uint32_t block_addr);
void free_block(uint32_t block_addr);

// 为进程pid所需要的空间size寻找合适的block
uint32_t find_block(pid_t pid, size_t size);


#endif // INCLUDE_MM_VMM_H_
