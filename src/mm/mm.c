#include "include/linux/mm.h"
/**
 * 初始化分页表
 * PAGE_TABLE_BASE_ADDR 中存放的是页表的基地址
 * PAGE_SIZE 为页面大小
 * 采用单级页表
 * 虚拟地址中高20位为虚拟页号，低12位为偏移量
 * 物理地址中高12位为物理页号，低12位为偏移量
 **/
void page_init(int* begin, int* end){
    /**
     * begin 为物理内存起始地址
     * end 为物理内存结束地址
     */ 

}

/**
 * TLB 中未找到对应的物理页引发的异常
 * 可以通过寄存器获得引发异常的虚拟页号，然后通过查询页表，返回物理页号即可
 **/
void page_fault(int vpn){

}