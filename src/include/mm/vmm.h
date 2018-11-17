
/*
 * 虚拟内存管理
 * 主要为初始化页表
 */

#include <types.h>

#ifndef _INCLUDE_MM_VMM_H
#define _INCLUDE_MM_VMM_H

// 映射 256K 内存所需要的页表条目数
#define PTE_COUNT 64

static pte_t pte_kern[PTE_COUNT];

// for (i = 1; i < PTE_COUNT * PTE_SIZE; i++) {
// 		pte[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;
// 	}

// pte_kern[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;

#endif // !_INCLUDE_MM_VMM_H