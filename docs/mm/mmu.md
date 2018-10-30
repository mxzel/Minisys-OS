# 内存管理

内存管理的硬件部分已经写好了，我们只需要实现软件部分。  
硬件部分的功能有：TLB、虚拟地址到物理地址的映射。  
通过 CP0 寄存器来控制内核态/用户态，也可以进行其他操作。具体参考《MicroAptiv UP Software User's Manual MD00942》

boot 中的 Makefile 指明，启动代码和用户代码被放到了内存中的两个不同的位置，有很大迹象表明内存空间可以自行分配。
```makefile
# Place the boot code (physical address). The virtual address for
# boot code entry point is hard-wired to 0x9fc00000.
LDFLAGS += -Wl,--defsym,__flash_start=0xbfc00000
# Place the application code (physical address)
LDFLAGS += -Wl,--defsym,__flash_app_start=0x80000000
```

内存空间应使用页式管理，通过查询资料得到，首先需要[探测系统物理内存布局](https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2/lab2_3_3_2_search_phymem_layout.html)，其次才是[以页为单位管理物理内存](https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2/lab2_3_3_3_phymem_pagelevel.html)，其中需要定义 Page 数据结构、维护空闲空间链表，提供初始化、分配内存与释放内存的接口。

## 物理内存探测

> 实验教程

RAM0 中存放的是引导代码（虚拟地址 0xbfc00000-0xbfc1fffc = 物理地址 0x1fc00000 - 0x1fc1fffc），RAM1 中存放的是用户代码（虚拟地址 0x80000000 - 0x8003fffc = 物理地址 0x00000000 - 0x0003fffc）。

> 《JamesM's kernel development tutorials》 第九章  

要实现内存的管理，首先要解决以下三个问题：

1. 如何获取可用物理内存的大小和地址？
2. 采用什么样的数据结构来描述物理内存？
3. 申请和释放物理内存的算法如何实现？

## 用户堆和栈

> 《MIPS 体系结构与编程》 刘佩林 P174  
> [MIPS 在linux中的内存映射](http://www.voidcn.com/article/p-fpioowtl-tp.html)  
> 《MIPS 体系结构透视》 P263/331

MIPS 硬件不直接支持堆栈结构，但是 C 语言语法却使用了堆栈，所以需要弄明白 MIPS 是如何利用处理器和存储器资源来实现堆栈的。

用户堆和栈：应用程序的栈初始设置到用户可以访问的空间（约2G虚拟空间）的顶部而且向下增长。操作系统检测到对已分配的最低栈空间附近未映射的存储器访问时，会自动映射更多的页已满足栈的增长。

## 用户态与内核态

> [mips的内存管理-kseg0,kseg1虚拟和物理地址映射理解](http://blog.chinaunix.net/uid-20564848-id-74683.html)  
> [MIPS 在linux中的内存映射](http://www.voidcn.com/article/p-fpioowtl-tp.html)  
> [MIPS Address Space](http://www.johnloomis.org/microchip/pic32/memory/memory.html)  

1. MIPS 复位和中断发生的时候会自动进入内核态  
2. 在用户态下，向虚拟地址 0x80000000 ~ 0xffffffff 写入数据会抛出异常  
3. unmapped 存储器段在虚拟地址到物理地址转换时不会用到 TLB  
4. 在复位以后，拥有 unmapped 存储器段是非常重要的，因为此时 TLB 还未编程使用  
5. unmapped 存储器段有一种非常简单的方式可以实现虚拟地址到物理地址的转换  
6. mapped 存储器段在进行虚拟地址到物理地址转换时会用到 TLB
7. 没有实模式，这是 MIPS CPU 的一个很重要的特点


<!-- ![内存布局](fig/内存布局.png) -->
<img src="fig/内存布局.png" width = "230" div align=center />

8. 在加电时，只有 kseg0 和 kseg1 是可以存取的。MMU 和 TLB 初始化以后可以存取剩余部分。
9. MIPS 的 CPU 有三个态：用户态、内核态和调试态。在用户态下，CPU 只能访问到 kuseg 段的内存。在访问其他段时，CPU 必须处于内核态或调试态下。
10. 应用程序的主程序构建时自接近0的地址开始运行。不会真为零——从虚拟0地址开始的一两页不做地址映射，这样企图使用空指针就会被当作内存管理错误捕获。

## 分页系统

### 页表

页表就是一个__页表条目__（Page Table Entry，PTE）的数组，每个 PTE 是由一个有效位和一个 n 位地址字段组成的。有效位表明了该虚拟页当前是否被缓存在DRAM中。如果设置了有效位，那么地址字段就表示 DRAM 中相应的物理页的起始位置，这个物理页中缓存了该虚拟页。如果没有设置有效位，那么一个空地址表示这个虚拟页还未被分配。否则，这个地址就指向该虚拟页在磁盘上的起始位置。

DRAM 缓存是全相联的，任意物理页都可以包含任意虚拟页，页面可以随机地分散在物理内存中。

### questions

如何区分内核/用户虚拟空间？非映射部分是否需要建立页表？
页表是根据什么建立的？物理内存及外存？还是虚拟内存？
物理内存如何探测？如何确定某一块物理内存为内核所用？
堆栈需要设置吗？
需要使用段式管理吗？
已有的 MMU 是如何做地址映射的？没有分页啊？

### TODO

CPU 中含有一个页表基址寄存器（Page Table Base Register，PTBR）指向当前页表


### 页表初始化

> [linux 内存管理---分页系统之页表初始化（四）](https://blog.csdn.net/whuzm08/article/details/80184175)  
> 《ORANGE’S：一个操作系统的实现》

内核页表和用户页表可以放在一起。最近有[报告](https://linux.cn/article-9201-1.html)展示现在有将内核页表隔离出去的工作，表明之前大多数系统时将用户页表和内核页表放在一起的。

pipeline: 


```
%include	"pm.inc"	; 常量, 宏, 以及一些说明

PageDirBase		equ	200000h	; 页目录开始地址: 2M
PageTblBase		equ	201000h	; 页表开始地址: 2M+4K

LABEL_DESC_PAGE_DIR: Descriptor PageDirBase, 4095, DA_DRW;Page Directory
LABEL_DESC_PAGE_TBL: Descriptor PageTblBase, 1023, DA_DRW|DA_LIMIT_4K;Page Tables

```

## 参考资料

1. [物理内存管理](https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2.html)
2. [Mips Address Space](http://www.johnloomis.org/microchip/pic32/memory/memory.html)
3. [MIPS 存储管理](http://imgtec.eetrend.com/d6-imgtec/article/2014-02/1291.html)
4. 实验教程
5. 《MIPS 体系结构与编程》 刘佩林 P174
6. [MIPS 在linux中的内存映射](http://www.voidcn.com/article/p-fpioowtl-tp.html)
7. 《MIPS 体系结构透视》 P263/331
8. [mips的内存管理-kseg0,kseg1虚拟和物理地址映射理解](http://blog.chinaunix.net/uid-20564848-id-74683.html)
9. [MIPS 在linux中的内存映射](http://www.voidcn.com/article/p-fpioowtl-tp.html)
10. [linux 内存管理---分页系统之页表初始化（四）](https://blog.csdn.net/whuzm08/article/details/80184175)
11. 《ORANGE’S：一个操作系统的实现》