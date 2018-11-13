// struct page{
//     unsigned long flags;

//     atomic_t count; // 计数器，统计一个页使用或引用的次数
//     struct list_head list; // 
//     struct 
// };


// #include "lib/list.h"

#ifndef _MM_H
#define _MM_H

struct Page {
    int ref;        // 物理引用计数
    uint8_t flags; // 描述该物理页的状态（未分配、已分配、保留）
    // unsigned int property;  // 地址连续的空闲页的个数。在不同的页分配算法中，property 有不同的含义
    // list_entry_t page_link; // 连续内存空间块利用该链表来链接内存块（双向链表）
};

// FIXME: 修改基地址
#define PAGE_TABLE_BASE_ADDR 0x80000010
#define PAGE_SIZE 0x00001000 // 12KB

#define UNALLOCATED 0x00
#define ALLOCATED 0x01
#define RESERVED 0x02

bool isPageReserved(struct Page *page){
    return page -> flags == RESERVED;
}
bool isPageAllocated(struct Page *page){
    return page -> flags == ALLOCATED;
}
bool isPageUnallocated(struct Page *page){
    return page -> flags == UNALLOCATED;
}

// 空闲空间链表
typedef struct {
    list_entry_t free_list; // the list header
    unsigned int nr_free;   // of free pages in this free list
} free_area_t;

#endif