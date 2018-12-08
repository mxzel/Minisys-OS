
/*
 * 虚拟内存管理
 * 主要为初始化页表
 */

// TODO: 12.08 vmm slob

#include <types.h>
#include <include/mm/pmm.h>

#ifndef INCLUDE_MM_VMM_H_
#define INCLUDE_MM_VMM_H_

// 映射 256K 内存所需要的页表条目数
#define PTE_COUNT PAGE_MAX_COUNT

static pte_t pte_kern[PTE_COUNT];

#define le_to_vma(le) list_entry(le, struct vma_struct, list)

// 虚拟内存管理初始化
void vmm_init(void);

// for (i = 1; i < PTE_COUNT * PTE_SIZE; i++) {
// 		pte[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;
// 	}

// pte_kern[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;

#endif // INCLUDE_MM_VMM_H_