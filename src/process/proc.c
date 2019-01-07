
#include <mm/mm.h>
#include <string.h>
#include <assert.h>
#include <task/proc.h>
#include <debug.h>


struct list_head proc_list;

struct task_struct *idleproc = NULL;
struct task_struct *current = NULL;

static int nr_process = 0; //进程数
void wakeup_proc(struct task_struct *proc);
int tno=0; 


static struct task_struct * alloc_proc(pid_t pid){
    struct task_struct *proc =kmalloc(pid, sizeof(struct task_struct));
    //writeValTo7SegsHex(proc);
    //writeValTo7SegsHex(0x02166666);
    if(proc != NULL){
        proc->state = -1;
        //proc->need_resched = 0;
        proc->kstack = 0;
        proc->parent = NULL;
        // writeValTo7SegsHex(0x02766666);
        memset(&(proc->context),0,sizeof(struct context));
        // writeValTo7SegsHex(0x02866666);
        memset(proc->name, 0, PROC_NAME_LEN);
        // writeValTo7SegsHex(0x03066666);
    }
    //writeValTo7SegsHex(0x03266666);
    return proc;

}



// set_proc_name - set the name of proc
void *set_proc_name(struct task_struct *proc, const char *name) {
    memset(proc->name, 0, sizeof(proc->name));
    memcpy(proc->name, name, PROC_NAME_LEN);
}


//将当前运行的进程的task_Struct的地址存入$28号寄存器，给刘狗用
void set_current(struct task_struct * proc){
    current = proc;//idleproc 进程创建完毕
    // asm volatile(
    //        "move $28, %0"
    //        :
    //        :"r"(proc)
    //  );
}


// proc_run - make process "proc" running on cpu
// NOTE: before call switch_to, should load  base addr of "proc"'s new PDT

// void proc_run(struct task_struct *proc) {
    
//     if (proc != current) {
//         struct task_struct *prev = current, *next = proc;
//         set_current(proc);
//         //writeValTo7SegsHex(proc->context.reg31);
        
//         writeValTo7SegsHex(0x50000000);
         
    
//         //writeValTo7SegsHex();

//         switch_to(&(prev->context), &(next->context));
        

//        writeValTo7SegsHex(0x60000000);

//        //switch_to(&(next->context), &(prev->context));
//        set_current(prev);

//     }
// }

// 给内核栈分配PAGE_SIZE大小的页，kstack指向栈最大处
static int setup_kstack(struct task_struct *proc) {
    proc->kstack = (uint32_t) kmalloc(proc->pid,PAGE_SIZE);
}
static inline void sys_create_proc(void (*fn)(void *), void *arg, uint32_t priority){
    asm ( "li $2,0x2");
    asm ( "syscall");
    writeValTo7SegsHex(0x33333333);
}

unsigned int catOutput(unsigned int pid,unsigned int priority)
{
    return pid*10000+priority;
   
}

static void test2(void *arg){
    //亮灯TODO:
   
    writeValTo7SegsDec(catOutput(current->pid,current->priority));
}
static void test3(void *arg){
    //亮灯TODO:
    writeValTo7SegsDec(catOutput(current->pid,current->priority));
}
static void test4(void *arg){
    //亮灯TODO:
   writeValTo7SegsDec(catOutput(current->pid,current->priority));
}

int keyboard_input(){
    static int i=5;
    return i++;
}

//init进程，用于接受用户输入并创建相应进程
static void init_main(void *arg){
    //调用creat_pro创建进程TODO:
    // *(int *)arg=10;
   /* writeValTo7SegsHex(0x44444444);
    pid_t p=create_proc(test_main,NULL,5);
    writeValTo7SegsDec(p);
    p=create_proc(test_main2,NULL,7);
    writeValTo7SegsDec(p);
    */
   int i=0;
   int inputValue[3]={};
   int outputValue[3]={};
   while(i<3)
   {
    inputValue[i]=keyboard_input();
    i++;
   }
    unsigned p=create_proc(test2,NULL,inputValue[0]); 
    outputValue[0]=catOutput(p,inputValue[0]);

    p=create_proc(test3,NULL,inputValue[1]); 
    outputValue[1]=catOutput(p,inputValue[1]);

    p=create_proc(test4,NULL,inputValue[2]);
    outputValue[2]=catOutput(p,inputValue[2]);


    i=0;
    while(i<3)
    {
        writeValTo7SegsDec(outputValue[i]);
        i++;
    }

    


}




static inline void sys_schedule(){
    asm ( "li $2,0x1");
    asm ( "syscall");
    writeValTo7SegsHex(0x33333333);
}

static inline void do_exit(){
    writeValTo7SegsHex(0x66666666);
    current->state=1;
    sys_schedule();
}


//根据fn、优先级创建进程
/*
*/
pid_t create_proc(void (*fn)(void *), void *arg, uint32_t priority){

    struct task_struct *proc;
    pid_t ret;
    // writeValTo7SegsHex(0x09466666);
    pid_t porc_id = tno++;
    //writeValTo7SegsHex(0x12866666);
    if(nr_process>MAX_PROCESS){
        goto fork_out;
    }
    proc = alloc_proc(porc_id);
    //writeValTo7SegsHex(0x13366666);
    if(proc== NULL){
        goto fork_out;
    }

    proc->parent = current;
    proc->priority = priority;

    proc->pid = porc_id;
    setup_kstack(proc);
   //writeValTo7SegsHex(0x14366666);
    proc->context.pc=((uint32_t)fn)-4;
    proc->context.args=(uint32_t)arg;
    proc->context.reg31 = (uint32_t)do_exit;
    proc->context.reg29 = proc->kstack + PAGE_SIZE; //堆栈指针指向栈底


    list_add(&(proc->list_link),&proc_list);
    
    //writeValTo7SegsHex(proc->context.reg29);
    nr_process ++;
    wakeup_proc(proc);
    //writeValTo7SegsHex(0x15066666);
    ret = proc->pid;
    fork_out:
    return ret;
}


void proc_init(void){
    //int i;

    init_list_head(&proc_list);

    pid_t idle_pid = tno++;
    if((idleproc = alloc_proc(idle_pid)) == NULL){
        //panic("cannot alloc idleproc.\n");
    }
    idleproc->pid = idle_pid;
    idleproc->state = 0;
    idleproc->priority=0;
    //setup_kstack(idleproc); //0号进程就用内核栈，没毛病弟弟
    set_proc_name(idleproc, "idle");
    nr_process++;
    set_current(idleproc);

    pid_t pid = create_proc(init_main,NULL,1);//创建init进程


}


void cpu_idle(void) {
    
    while (1) {
        sys_schedule();
        writeValTo7SegsHex(0x55550000);
    }
}
