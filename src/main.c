#include <mm/mm.h>
#include <debug.h>
#include <mm/mm_test.h>
#include <mips/hal.h>
#include <mips/m32tlb.h>
#include <task/proc.h>
#include <mips/cpu.h>
#include <mips/m32c0.h>
#include <fs/fs.h>
/**
 * 
 *  cd "c:\Comprehensive\OSX\src\" ; if ($?) { gcc main.c -o main -I ./include -I ./lib -I ./include/lib } ; if ($?) { .\main }
 * 
 */

int main(){
    mm_init();
    // test_alloc_free();

    test_alloc_page_block();
    writeValTo7SegsHex(((uint32_t)0));
    test_alloc_block();
    writeValTo7SegsHex(((uint32_t)0));
    test_rw_block();

    // proc_init();
    // fs_init();
    // test_rw_memory();

    // cpu_idle();



    while(1)writeValTo7SegsHex(0x66666666);
    return 0;
}

__attribute__ ((nomips16)) void _mips_handle_exception (struct gpctx *ctx, int exception)
{
   // writeValTo7SegsHex(0xffffffff);
    switch(exception){
        case EXC_SYS://system call
           // writeValTo7SegsHex(0x11111111);
            if(ctx->r[1]==1){
                // current->context.args = ctx->
                current->context.reg16 = ctx->r[15];
                current->context.reg17 = ctx->r[16];
                current->context.reg18 = ctx->r[17];
                current->context.reg19 = ctx->r[18];
                current->context.reg20 = ctx->r[19];
                current->context.reg21 = ctx->r[20];
                current->context.reg22 = ctx->r[21];
                current->context.reg23 = ctx->r[22];
                current->context.reg29 = ctx->r[28];
                current->context.reg30 = ctx->r[29];
                current->context.reg31 = ctx->r[30];
                current->context.pc = ctx->epc;

                struct task_struct * next_task=schedule();
                
                ctx->r[3]=next_task->context.args;
                ctx->r[15]=next_task->context.reg16;
                ctx->r[16]=next_task->context.reg17;
                ctx->r[17]=next_task->context.reg18;
                ctx->r[18]=next_task->context.reg19;
                ctx->r[19]=next_task->context.reg20;
                ctx->r[20]=next_task->context.reg21;
                ctx->r[21]=next_task->context.reg22;
                ctx->r[22]=next_task->context.reg23;

                //ctx->r[28]=next_task->context.reg29;
                
                ctx->r[29]=next_task->context.reg30;
                ctx->r[30]=next_task->context.reg31;
                ctx->epc=next_task->context.pc+4;

                set_current(next_task);

            }else if(ctx->r[1]==2){
                writeValTo7SegsHex(0x02020202);
                pid_t p=create_proc(ctx->r[3],ctx->r[4],ctx->r[5]);
                writeValTo7SegsDec(p);

                ctx->epc=ctx->epc+4;
            }
            break;
        case EXC_MOD:
            writeValTo7SegsHex(0x02020202);
            break;
        case EXC_ADEL:
        case EXC_ADES:
            writeValTo7SegsHex(0x04040404);
            break;
        case EXC_TLBL://load tlb miss
            // writeValTo7SegsHex(0x03030303);
            // break;
        case EXC_TLBS://store tld miss
            //writeValTo7SegsHex(0x01010101);

            // TLB size 为 16
            // PageMask
            mips32_set_c0(C0_PAGEMASK, 0x0fff);

            // badvaddr
            uint32_t badvaddr = ctx->badvaddr;
            uint32_t vpn = badvaddr >> 12;
            //writeValTo7SegsHex(badvaddr);

            // EntryLo0 和 EntryLo1
            uint32_t ppn;
            if(vpn % 2 == 0){
                ppn = get_ppn_by_vpn(vpn);
                mips32_set_c0(C0_ENTRYLO0, 7 | (ppn << 6));
                ppn = get_ppn_by_vpn(vpn + 1);
                mips32_set_c0(C0_ENTRYLO1, 5 | (ppn << 6));

            }else{
                ppn = get_ppn_by_vpn(vpn - 1);
                mips32_set_c0(C0_ENTRYLO0, 5 | (ppn << 6));
                ppn = get_ppn_by_vpn(vpn);
                mips32_set_c0(C0_ENTRYLO1, 7 | (ppn << 6));
            }
            //writeValTo7SegsHex(get_ppn_by_vpn(vpn)<<12);

            // EntryHI
            mips32_set_c0(C0_ENTRYHI, vpn << 12);

            // TLBW
            /**
             * 这里使用固定 index 写入，而非 random 寄存器
             * 因为每次 TLB 写入都是写入相邻的两个虚拟页，随着页框的分配，TLB 中的条目更新不及时，很有可能出现下面的情况：
             * 其中一个 entry 说2号页可用，3号页不可用，然后另一个 entry 说3号页可用，这时访问 TLB 会出现系统调用的异常
             * 固定 index 写入可以保证 TLB 中只有一个 entry 中的一个页映射是可用的
             */
            mips_tlbwi2(
                mips32_get_c0(C0_ENTRYHI),
                mips32_get_c0(C0_ENTRYLO0),
                mips32_get_c0(C0_ENTRYLO1),
                mips32_get_c0(C0_PAGEMASK),
                1
            );

            // TLBR
            // 用来验证 TLB 写入是否成功
            // uint32_t hi, lo0, lo1, msk;
            // mips_tlbri2(&hi, &lo0, &lo1, &msk, 1);

            // writeValTo7SegsHex(hi);
            // writeValTo7SegsHex(lo0);
            // writeValTo7SegsHex(lo1);
            // writeValTo7SegsHex(msk);

            break;
        default:
            __exception_handle(ctx, exception);
    }
      
}