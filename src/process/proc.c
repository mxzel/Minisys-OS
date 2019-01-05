
#include <mm/mm.h>
#include <string.h>
#include <assert.h>
#include <task/proc.h>
#include <debug.h>


struct list_head proc_list;   

struct task_struct *idleproc = NULL;
struct task_struct *current = NULL;

static int nr_process = 0; //进程数




static struct task_struct * alloc_proc(pid_t pid){
    struct task_struct *proc =kmalloc(pid, sizeof(struct task_struct));
    writeValTo7SegsHex(0x02166666);
    if(proc != NULL){
        proc->state = -1;
        proc->need_resched = 0;
        proc->kstack = 0;
        proc->parent = NULL;
        writeValTo7SegsHex(0x02766666);
        memset(&(proc->context),0,sizeof(struct context));
        writeValTo7SegsHex(0x02866666);
        memset(proc->name, 0, PROC_NAME_LEN);
        writeValTo7SegsHex(0x03066666);
    }
    writeValTo7SegsHex(0x03266666);
    return proc;

}



// set_proc_name - set the name of proc
void *set_proc_name(struct task_struct *proc, const char *name) {
    memset(proc->name, 0, sizeof(proc->name));
    memcpy(proc->name, name, PROC_NAME_LEN);
}

// get_pid - alloc a unique pid for process
static uint32_t get_pid(void) {
    static uint32_t tno=0;
    // struct task_struct *proc;
    // struct list_head *list = &proc_list, *le;
    // static int next_safe = MAX_PID, last_pid = MAX_PID;
    // if (++ last_pid >= MAX_PID) {
    //     last_pid = 1;
    //     goto inside;
    // }
    // if (last_pid >= next_safe) {
    // inside:
    //     next_safe = MAX_PID;
    // repeat:
    //     le = list;
    //     while ((le = le->next) != list) {
    //         proc = list_entry(le, struct task_struct,list_link);
    //         if (proc->pid == last_pid) {
    //             if (++ last_pid >= next_safe) {
    //                 if (last_pid >= MAX_PID) {
    //                     last_pid = 1;
    //                 }
    //                 next_safe = MAX_PID;
    //                 goto repeat;
    //             }
    //         }
    //         else if (proc->pid > last_pid && next_safe > proc->pid) {
    //             next_safe = proc->pid;
    //         }
    //     }
    // }
    return tno++;
}

//将当前运行的进程的task_Struct的地址存入$28号寄存器，给刘狗用
void set_current(struct task_struct * proc){
    current = proc;//idleproc 进程创建完毕 
    asm volatile(     
           "move $28, %0"   
           :
           :"r"(proc)          
     );
}


// proc_run - make process "proc" running on cpu
// NOTE: before call switch_to, should load  base addr of "proc"'s new PDT
void proc_run(struct task_struct *proc) {
    if (proc != current) {
        bool intr_flag;
        struct task_struct *prev = current, *next = proc;
        set_current(proc);
        switch_to(&(prev->context), &(next->context));
    }
}

// 给内核栈分配PAGE_SIZE大小的页，kstack指向栈最大处
static int setup_kstack(struct task_struct *proc) {
    proc->kstack = (uint32_t) kmalloc(proc->pid,PAGE_SIZE);
}

//init进程，用于接受用户输入并创建相应进程
static void init_main(void *arg){
    //调用creat_pro创建进程TODO:
}

static void test_main(void *arg){
    //亮灯TODO:
}




//根据fn、优先级创建进程
/*

*/
pid_t create_proc(int (*fn)(void *), void *arg, uint32_t priority){
    
    struct task_struct *proc;
    pid_t ret;
    pid_t porc_id = get_pid();
    
    if(nr_process>MAX_PROCESS){
        goto fork_out;
    }
    proc = alloc_proc(porc_id);
    writeValTo7SegsHex(0x12866666);
    if(proc== NULL){
        goto fork_out;
    }

    proc->parent = current;
    proc->priority = priority;

    proc->pid = porc_id;
    setup_kstack(proc);
    writeValTo7SegsHex(0x13866666);
    proc->context.reg31 = (uint32_t)fn; 
    proc->context.reg29 = proc->kstack + PAGE_SIZE - 1; //堆栈指针指向栈底
    list_add(&(proc->list_link),&proc_list);
    writeValTo7SegsHex(0x14266666);
    nr_process ++;
    wakeup_proc(proc);
    writeValTo7SegsHex(0x14566666);
    ret = proc->pid;

fork_out:
    return ret;
}


void proc_init(void){
    //int i;
    
    init_list_head(&proc_list);
    
    pid_t idle_pid = get_pid();
    writeValTo7SegsHex(0x15366666);
    if((idleproc = alloc_proc(idle_pid)) == NULL){
        //panic("cannot alloc idleproc.\n");
    }
    writeValTo7SegsHex(0x15766666);
    idleproc->pid = idle_pid;
    idleproc->state = 0;

    idleproc->need_resched = 1;
    setup_kstack(idleproc); 
    writeValTo7SegsHex(0x16366666);
    set_proc_name(idleproc, "idle");
    writeValTo7SegsHex(0x16566666);
    nr_process++;
    set_current(idleproc);
    writeValTo7SegsHex(0x16866666);
    
    pid_t pid = create_proc(init_main,NULL,1);//创建init进程 
    writeValTo7SegsHex(0x17166666);
    if (pid <= 0) {
        //panic("create user_main failed.\n");
    }

}


void cpu_idle(void) {
    writeValTo7SegsHex(0x66888866);
    while (1) {
        if (current->need_resched) {
            schedule();
        }
    }
}
