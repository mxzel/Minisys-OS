/*
 * 模仿 Linux 内核的 list.h
 * https://www.ibm.com/developerworks/cn/linux/kernel/l-chain/index.html
 * list_head 在 types.h 中定义
 */

#ifndef _INCLUDE_LIB_LIST_H
#define _INCLUDE_LIB_LIST_H

#include <types.h>

#define list_entry(ptr,type,member) (type *)((char *)ptr - __offsetof(type,member))

#define __offsetof(TYPE, MEMBER) ((unsigned int) &((TYPE *)0)->MEMBER)

#define LIST_HEAD_INIT(name) { &(name), &(name) }

#define LIST_HEAD(name) \
        struct list_head name = LIST_HEAD_INIT(name)

#define INIT_LIST_HEAD(ptr) do {                \
    (ptr)->next = (ptr); (ptr)->prev = (ptr);   \
  } while (0)


static inline void init_list_head (struct list_head *list) {
        list->next = list;
        list->prev = list;
}

static inline void __list_add(struct list_head *new_node,
                struct list_head *prev, struct list_head *next)
{
        next->prev = new_node;
        new_node->next = next;
        new_node->prev = prev;
        prev->next = new_node;
}

static inline void list_add(struct list_head *new_node, struct list_head *head)
{
        __list_add(new_node, head, head->next);
}

static inline void list_add_before(struct list_head *new_node, struct list_head *head)
{
        __list_add(new_node, head->prev, head);
}

static inline void list_add_tail(struct list_head *new_node, struct list_head *head)
{
        __list_add(new_node, head->prev, head);
}

static inline void __list_del(struct list_head * prev, struct list_head * next)
{
        next->prev = prev;
        prev->next = next;
}

static inline void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
}

static inline void list_replace(struct list_head *old,
                struct list_head *new_node)
{
        new_node->next = old->next;
        new_node->next->prev = new_node;
        new_node->prev = old->prev;
        new_node->prev->next = new_node;
}

static inline void list_replace_init(struct list_head *old,
                struct list_head *new_node)
{
        list_replace(old, new_node);
        INIT_LIST_HEAD(old);
}

static inline void list_del_init(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        INIT_LIST_HEAD(entry);
}

static inline void list_move(struct list_head *list, struct list_head *head)
{
        __list_del(list->prev, list->next);
        list_add(list, head);
}

static inline void list_move_tail(struct list_head *list,
                struct list_head *head)
{
        __list_del(list->prev, list->next);
        list_add_tail(list, head);
}

static inline int list_is_last(const struct list_head *list,
                const struct list_head *head)
{
        return list->next == head;
}

static inline int list_empty(const struct list_head *head)
{
        return head->next == head;
}

static inline int list_empty_careful(const struct list_head *head)
{
        struct list_head *next = head->next;
        return (next == head) && (next == head->prev);
}

static inline int list_is_singular(const struct list_head *head)
{
        return !list_empty(head) && (head->next == head->prev);
}

static inline void __list_cut_position(struct list_head *list,
                struct list_head *head, struct list_head *entry)
{
        struct list_head *new_first = entry->next;
        list->next = head->next;
        list->next->prev = list;
        list->prev = entry;
        entry->next = list;
        head->next = new_first;
        new_first->prev = head;
}

static inline void list_cut_position(struct list_head *list,
                struct list_head *head, struct list_head *entry)
{
        if (list_empty(head))
                return;
        if (list_is_singular(head) &&
                        (head->next != entry && head != entry))
                return;
        if (entry == head)
          INIT_LIST_HEAD(list);
        if (entry != head)
                __list_cut_position(list, head, entry);
}

static inline void __list_splice(const struct list_head *list,
                struct list_head *prev, struct list_head *next)
{
        struct list_head *first = list->next;
        struct list_head *last = list->prev;

        first->prev = prev;
        prev->next = first;

        last->next = next;
        next->prev = last;
}

static inline void list_splice(const struct list_head *list,
                struct list_head *head)
{
        if (!list_empty(list))
                __list_splice(list, head, head->next);
}

static inline void list_splice_tail(struct list_head *list,
                struct list_head *head)
{
        if (!list_empty(list))
                __list_splice(list, head->prev, head);
}

static inline void list_splice_init(struct list_head *list,
                struct list_head *head)
{
        if (!list_empty(list)) {
                __list_splice(list, head, head->next);
                INIT_LIST_HEAD(list);
        }
}

static inline void list_splice_tail_init(struct list_head *list,
                struct list_head *head)
{
        if (!list_empty(list)) {
                __list_splice(list, head->prev, head);
                INIT_LIST_HEAD(list);
        }
}

#define list_first_entry(ptr, type, member)                         \
    list_entry((ptr)->next, type, member)

#define list_for_each(pos, head)                                    \
    for (pos = (head)->next; pos != (head); pos = pos->next)

#define list_for_each_prev(pos, head)                               \
    for (pos = (head)->prev; pos != (head); pos = pos->prev)

#define list_for_each_safe(pos, n, head)                            \
    for (pos = (head)->next, n = pos->next; pos != (head);          \
            pos = n, n = pos->next)

#define list_for_each_prev_safe(pos, n, head)                       \
    for (pos = (head)->prev, n = pos->prev;                         \
            pos != (head);                                          \
            pos = n, n = pos->prev)

#define list_for_each_entry(pos, head, member)                          \
    for (pos = list_entry((head)->next, typeof(*pos), member);          \
            &pos->member != (head);                                     \
            pos = list_entry(pos->member.next, typeof(*pos), member))

#define list_for_each_entry_reverse(pos, head, member)                  \
    for (pos = list_entry((head)->prev, typeof(*pos), member);          \
            pos->member != (head);                                      \
            pos = list_entry(pos->member.prev, typeof(*pos), member))

#define list_for_each_entry_safe(pos, n, head, member)                  \
    for (pos = list_entry((head)->next, typeof(*pos), member),          \
            n = list_entry(pos->member.next, typeof(*pos), member);     \
            &pos->member != (head);                                     \
            pos = n, n = list_entry(n->member.next, typeof(*n), member))

#define list_for_each_entry_reverse_safe(pos, n, head, member)          \
    for (pos = list_entry((head)->prev, typeof(*pos), member),          \
            n = list_entry(pos->member.next, typeof(*pos), member);     \
            &pos->member != (head);                                     \
            pos = n, n = list_entry(n->member.prev, typeof(*n), member))

#endif  // _INCLUDE_LIB_LIST_H
