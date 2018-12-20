
/*
 * 虚拟内存管理
 * 主要为初始化页表
 */

// TODO: 12.08 vmm slob

#include <types.h>
#include <include/mm/pmm.h>

#ifndef INCLUDE_MM_VMM_H_
#define INCLUDE_MM_VMM_H_

// 映射剩余内存所需要的页表条目数
#define PTE_COUNT PAGE_MAX_COUNT

pte_t* page_table_p = (pte_t*)PTE_ADDR;

#define le_to_vma(le) list_entry(le, struct vma_struct, list)

// 页面起始位置（虚拟地址）
uint32_t vmm_page_addr = PTE_ADDR + 0x1000 - 0x80000000;

// 虚拟内存管理初始化
void vmm_init(void);

// 页表条目为4B，即32位
// PPN 为6位 26-31，VPN 为20位 6-25，status 为2位 4-5，pid 为4位 0-3

// status
// 0 - 未分配
// 1 - 已分配
// 2 - 保留
// 3 - 无效

// 根据物理地址获得物理页号
uint32_t get_ppn_from_page(uint32_t phy_page_addr);

// 根据 PTE 获得物理页号
uint32_t get_ppn_from_pte(pte_t pte);

// 根据 PTE 获得虚拟页号
uint32_t get_vpn_from_pte(pte_t pte);

// 根据虚拟地址获得虚拟页号
uint32_t get_vpn_from_page(uint32_t page_addr);

// 根据虚拟页号获得物理页号
uint32_t get_ppn_by_vpn(uint32_t vpn);

// 根据虚拟地址获得物理地址
uint32_t get_phy_addr_by_vir_addr(uint32_t vir_addr);

// 以下均为物理页号，参数为页框地址
void set_page_unallocated(uint32_t ppn);
void set_page_allocated(uint32_t ppn);
void set_page_reserved(uint32_t ppn);
void set_page_status(uint32_t ppn, int status);
int get_page_status(uint32_t ppn);
void set_page_pid(uint32_t ppn, pid_t pid);
pid_t get_page_pid(uint32_t ppn);


uint32_t vmm_alloc_page(uint32_t page_addr, pid_t pid);
void vmm_free_page(uint32_t page_addr);


#endif // INCLUDE_MM_VMM_H_