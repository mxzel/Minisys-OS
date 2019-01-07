

#include <task/sched.h>


void wakeup_proc(struct task_struct *proc) {
    if (proc->state != 0) {
        proc->state = 0;
    }
    else {
        //warn("wakeup runnable process.\n");
    }

}
//优先级调度，遍历查找需要运行的进程中优先级最高的
struct task_struct* schedule(void) {
    bool intr_flag;
    struct list_head *le, *last;
    int32_t highest = 0;
    struct task_struct *next = NULL;
    struct task_struct *current_highest = NULL;
    last = &proc_list ;
    le = last;
    do {
        if ((le = le->next) != &proc_list) {//如果当前遍历的le不是最后一个，就进if
            next = list_entry(le, struct task_struct,list_link);

            if (next->state == 0)
            {
                if(highest < next->priority)
                {
                    highest = next->priority;
                    current_highest = next;

                }

            }

        }

    } while (le != last);

    
    if (current_highest == NULL || current_highest->state != 0) {
        current_highest = idleproc;
    }
    //writeValTo7SegsHex(current_highest->pid);
    return current_highest;
}
