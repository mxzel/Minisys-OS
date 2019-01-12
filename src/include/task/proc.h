#ifndef __KERN_PROCESS_PROC_H__
#define __KERN_PROCESS_PROC_H__

#include <list.h>

// 上下文，需要保存的寄存器
struct context{
    uint32_t pc;
    uint32_t args;
    uint32_t reg16;
    uint32_t reg17, reg18, reg19, reg20, reg21, reg22, reg23;//16~23号寄存器为子程序寄存器变量
    uint32_t reg29, reg30, reg31;//29号寄存器：堆栈指针； 30号：帧指针；31号：子程序返回地址
};



extern void* switch_to(struct context *from, struct context *to);

#define PROC_NAME_LEN               15
#define MAX_PROCESS                 1024
#define MAX_PID                     (MAX_PROCESS * 2)

extern struct list_head proc_list;

struct task_struct
{
    pid_t pid;
    //uint32_t run_time;                        // 运行时间
    int32_t priority;                          // 进程优先级
    int32_t state;                              // -1 unrunable, 0 runnable, 1 stopped
    char name[PROC_NAME_LEN + 1];               // 进程名                 
    uint32_t kstack;                            // 内核栈
    // volatile bool need_resched;                 // 是否需要调度以释放CPU
    struct task_struct *parent;                 // 父进程
    struct context context;                     // 进程上下文
    //list_head children;                       // 链表的头部，链表的所有元素都是children的子进程
    struct list_head list_link;                      // 指向proc list
    struct file*  files[5];
};

/* Return the offset of 'member' relative to the beginning of a struct type */
#define offsetof(type, member)                                      \
    ((size_t)(&((type *)0)->member))

/* *
 * to_struct - get the struct from a ptr
 * @ptr:    a struct pointer of member
 * @type:   the type of the struct this is embedded in
 * @member: the name of the member within the struct
 * */
#define to_struct(ptr, type, member)                               \
    ((type *)((char *)(ptr) - offsetof(type, member)))
#define le2proc(le, member)         \
    to_struct((le), struct task_struct, member)

extern struct task_struct *idleproc, *initproc, *current;
void proc_init(void);
int create_pro(int (*fn)(void *), void *arg, uint32_t priority);
void *set_proc_name(struct task_struct *proc, const char *name);


#endif /* !__KERN_PROCESS_PROC_H__ */
