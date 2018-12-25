
#include <vmm.h>
#include <string.h>
#include <assert.h>
#include <proc.h>

struct list_head proc_list;   

struct task_struct *idleproc = NULL;
struct task_struct *current = NULL;

static int nr_process = 0; //进程数

static struct task_struct * alloc_proc(void){
    struct task_struct *proc =kmalloc(sizeof(struct task_struct));
    if(proc != NULL){
        proc->state = -1;
        proc->need_resched = 0;
        proc->parent = NULL;
        memset($(proc->context),0,sizeof(struct context));
        memset(proc->name, 0, PROC_NAME_LEN);
       

    }
    return proc;

}



// set_proc_name - set the name of proc
void *set_proc_name(struct task_struct *proc, const char *name) {
    memset(proc->name, 0, sizeof(proc->name));
    memcpy(proc->name, name, PROC_NAME_LEN);
}

// get_pid - alloc a unique pid for process
static int get_pid(void) {
    struct task_struct *proc;
    struct list_head *list = &proc_list, *le;
    static int next_safe = MAX_PID, last_pid = MAX_PID;
    if (++ last_pid >= MAX_PID) {
        last_pid = 1;
        goto inside;
    }
    if (last_pid >= next_safe) {
    inside:
        next_safe = MAX_PID;
    repeat:
        le = list;
        while ((le = le->next) != list) {
            proc = list_entry(le, struct task_struct,list_link);
            if (proc->pid == last_pid) {
                if (++ last_pid >= next_safe) {
                    if (last_pid >= MAX_PID) {
                        last_pid = 1;
                    }
                    next_safe = MAX_PID;
                    goto repeat;
                }
            }
            else if (proc->pid > last_pid && next_safe > proc->pid) {
                next_safe = proc->pid;
            }
        }
    }
    return last_pid;
}

// proc_run - make process "proc" running on cpu
// NOTE: before call switch_to, should load  base addr of "proc"'s new PDT
void
proc_run(struct task_struct *proc) {
    if (proc != current) {
        bool intr_flag;
        struct task_struct *prev = current, *next = proc;
        current = proc;
        switch_to(&(prev->context), &(next->context));//TODO:转内嵌汇编
    }
}



//init进程，用于接受用户输入并创建相应进程
static void init_main(void *arg){
    //调用creat_pro创建进程TODO:
}

static void test_main(void *arg){
    //亮灯TODO:
}


//根据fn、优先级创建进程
int create_pro(int (*fn)(void *), void *arg, uint32_t priority){
    
    
    struct task_struct *proc;
    pid_t ret;

    if(nr_process>MAX_PROCESS){
        goto fork_out;
    }
    if((proc = alloc_proc() == NULL)){
        goto fork_out;
    }

    proc->parent = current;
    proc->priority = priority;
    //TODO: context中还有很多寄存器
    //proc->context.eip = (uintptr_t)fn;
    
    proc->pid = get_pid();
    list_add(&(proc->list_link),&proc_list);
    nr_process ++;
    wakeup_proc(proc);
    ret = proc->pid;

fork_out:
    return ret;
}


void proc_init(void){
    int i;
    
    LIST_HEAD(proc_list);
    
    if((idleproc = alloc_proc()) == NULL){
        panic("cannot alloc idleproc.\n");
    }

    idleproc->pid = 0;
    idleproc->state = 0;
    idleproc->need_resched = 1;
    set_proc_name(idleproc, "idle");

    nr_process++;

    current = idleproc;//idleproc 进程创建完毕

    int pid = create_pro(init_main,NULL,1);//创建init进程，TODO:

    if (pid <= 0) {
        panic("create user_main failed.\n");
    }

}


void cpu_idle(void) {
    while (1) {
        if (current->need_resched) {
            schedule();
        }
    }
}
