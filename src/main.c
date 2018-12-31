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
    // test_vmm();
    return 0;
}


// TODO: Software User's Manual 文档216页指出了软件初始化需要做的一些事情
__attribute__ ((nomips16)) void _mips_handle_exception (struct gpctx *ctx, int exception)
{
    switch(exception){
    case EXC_SYS://system call
        switch(ctx->r[1]){
        case 1:
            // sys_led(ctx->r[3]);
            break;
        }
        break;
    case EXC_TLBL://load tlb miss
    case EXC_TLBS://store tld miss
        // writeValTo7SegsHex(ctx->context);
        // sys_led(90);
        // uint32_t pagenumber;
        // pagenumber = ((uint32_t)mips32_get_c0(C0_BADVADDR)) >> 12;
        writeValTo7SegsHex(((uint32_t)mips32_get_c0(C0_BADVADDR)));
        // if(pagenumber>=0xc0000){
        //     int framenumber=pagenumber-0xc0000;
        //     int odd = pagenumber%2;
        //     pagenumber=pagenumber>>1;
        //     pagenumber=pagenumber<<13;
        //     framenumber<<6;
        //     if (odd ==1){
        //         mips_tiber2 (pagenumber,framenumber+0x16,0x00000002,0x1ffff800);
        //     }else{
        
        //     }
        // }
        // void mips_tlbwr2(tlbhi_t hi, tlblo_t lo0, tlblo_t lo1, unsigned int pmsk);
        break;
    default:
        __exception_handle(ctx, exception);
  }
      
}