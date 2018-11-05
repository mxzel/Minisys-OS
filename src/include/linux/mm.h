struct page{
    unsigned long flags;

    atomic_t count; // 计数器，统计一个页使用或引用的次数
    struct list_head list; // 
    struct 
};

struct Page {
    int ref;        // 物理引用计数
    uint32_t flags; // 描述该物理页的状态（未分配、已分配、保留）
    unsigned int property;  // 地址连续的空闲页的个数。在不同的页分配算法中，property 有不同的含义
    list_entry_t page_link; // 连续内存空间块利用该链表来链接内存块（双向链表）
};

// 空闲空间链表
typedef struct {
    list_entry_t free_list; // the list header
    unsigned int nr_free;   // of free pages in this free list
} free_area_t;