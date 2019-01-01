#include <mm/mm.h>
#include <debug.h>
#include <mm/mm_test.h>
#include <mips/hal.h>
#include <mips/m32tlb.h>
#include <stdio.h>
#include <mips/cpu.h>
#include <mips/m32c0.h>
/**
 * 
 *  cd "c:\Comprehensive\OSX\src\" ; if ($?) { gcc main.c -o main -I ./include -I ./lib -I ./include/lib } ; if ($?) { .\main }
 * 
 */
int index_;
void test_pmm(){
    /**
     * 开始时一共有28个空闲物理页
     * 第一次分配的物理页地址为 0x0003E000（物理地址）
     * 最后一次分配的物理页地址为 0x00022000（物理地址）
     */
    pmm_init();
    int i = 0;
    for (i = 0; i < 35; ++i){
        uint32_t phy_page_addr = pmm_alloc_page();
        writeValTo7SegsHex(phy_page_addr);
        delay();
    }
    // pmm_init();
    // uint32_t phy_page_addr = ?mm_alloc_page();
    // int32_t ret = get_pmm_stack_top();
    // writeValTo7SegsDec(phy_page_addr);
    // writeValTo7SegsHex(1);
}

void test_vmm(){
    /**
     * 第一次分配的虚拟页地址为 0x00022000（虚拟地址）
     * 
     */
    pmm_init();
    // uint32_t phy_page_addr = pmm_alloc_page();
    vmm_init();
    uint32_t vmm_page_addr = (uint32_t)kmalloc(0, 32);

    // pte_t *pte = get_pte_by_page_addr(vmm_page_addr);
    // if(pte != NULL){
    //     uint32_t high = (uint32_t)((*pte) >> 32);
    //     uint32_t low = (uint32_t)(*pte);
    //     writeValTo7SegsHex(high);
    //     delay();
    //     writeValTo7SegsHex(low);
    // }else{
    //     int vpn = get_vpn_from_page_addr(vmm_page_addr);
    //     writeValTo7SegsHex(0xffffffff);
    // }
    
}

int main(){
    mm_init();
    // test_alloc_memory();
    // writeValTo7SegsDec(0);
    test_rw_memory();
    writeValTo7SegsHex(0x66666666);
    while(1){}
    // test_vmm();
    return 0;
}


// TODO: Software User's Manual 文档216页指出了软件初始化需要做的一些事情
__attribute__ ((nomips16)) void _mips_handle_exception (struct gpctx *ctx, int exception)
{
    writeValTo7SegsHex(0xffffffff);
    switch(exception){
        case EXC_SYS://system call
            switch(ctx->r[1]){
            case 1:
                // sys_led(ctx->r[3]);
                break;
            }
            break;
        case EXC_MOD:
            writeValTo7SegsHex(0x02020202);
            break;
        case EXC_ADEL:
        case EXC_ADES:
            writeValTo7SegsHex(0x04040404);
            // for (index_ = 0; index_ < 31; ++index_){
            //     writeValTo7SegsHex(ctx->r[index_]);
            // }
            break;
        case EXC_TLBL://load tlb miss
            writeValTo7SegsHex(0x03030303);
            break;
        case EXC_TLBS://store tld miss
            writeValTo7SegsHex(0x01010101);

            // TLB size 为 16
            // PageMask
            mips32_set_c0(C0_PAGEMASK, 0x0fff);

            uint32_t badvaddr = ctx->r[3];
            uint32_t vpn = badvaddr >> 12;

            // EntryLo0 和 EntryLo1
            uint32_t ppn;
            if(vpn % 2 == 0){
                ppn = get_ppn_by_vpn(vpn);
                mips32_set_c0(C0_ENTRYLO0, 7 | (ppn << 6));
                mips32_set_c0(C0_ENTRYLO1, 1);

            }else{
                ppn = get_ppn_by_vpn(vpn);
                mips32_set_c0(C0_ENTRYLO0, 1);
                mips32_set_c0(C0_ENTRYLO1, 7 | (ppn << 6));
            }

            // EntryHI
            mips32_set_c0(C0_ENTRYHI, vpn << 12);

            // TLBWR
            mips_tlbwr2(
                mips32_get_c0(C0_ENTRYHI),
                mips32_get_c0(C0_ENTRYLO0),
                mips32_get_c0(C0_ENTRYLO1),
                mips32_get_c0(C0_PAGEMASK), 
            );

            // uint32_t hi, lo0, lo1, msk;
            // mips_tlbri2(&hi, &lo0, &lo1, &msk, 1);

            // asm("tlbwr\t\n");
            //  mips_tlbri2 (tlbhi_t *phi, tlblo_t *plo0, tlblo_t *plo1, unsigned int *pmsk, int index)

            // writeValTo7SegsHex(hi);
            // writeValTo7SegsHex(lo0);
            // writeValTo7SegsHex(lo1);
            // writeValTo7SegsHex(msk);

            break;
        default:
            __exception_handle(ctx, exception);
    }
      
}