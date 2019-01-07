#ifndef _ASM_CURRENT_H
#define _ASM_CURRENT_H

#include<task/proc.h>

static inline struct task_struct* get_current(){
    return current_task();
}



#define current get_current()




#endif /* _ASM_CURRENT_H */