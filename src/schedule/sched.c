

#include <task/sched.h>


void wakeup_proc(struct task_struct *proc) {
    if (proc->state != 1) {
        proc->state = 1;
    }
    else {
        warn("wakeup runnable process.\n");
    }

}
//TODO:优先级调度，遍历查找需要运行的进程中优先级最高的
void schedule(void) {
    bool intr_flag;
    struct list_head *le, *last;
    int32_t highest = 0;
    struct task_struct *next = NULL;
    struct task_struct *current_highest = NULL;
    
    current->need_resched = 0;
    last = (current == idleproc) ? &proc_list : &(current->list_link);
    le = last;
    do {
        if ((le = le->next) != &proc_list) {
            next = list_entry(le, struct task_struct,list_link);
            if (next->state == 0) {
                if(highest < next->priority){
                    highest = next->priority;
                    current_highest = next;
                }
            }
        }
    } while (le != last);
    if (current_highest == NULL || current_highest->state != 0) {
        current_highest = idleproc;
    }
    
    if (current_highest != current) {
        proc_run(current_highest);
    }

}
