#ifndef __KERN_SCHEDULE_SCHED_H__
#define __KERN_SCHEDULE_SCHED_H__

#include <task/proc.h>
#include <list.h>
struct task_struct* schedule(void);
void wakeup_proc(struct task_struct *proc);

#endif /* !__KERN_SCHEDULE_SCHED_H__ */
