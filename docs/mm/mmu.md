# 内存管理

内存管理的硬件部分已经写好了，我们只需要实现软件部分。  
硬件部分的功能有：TLB、虚拟地址到物理地址的映射。  
通过 CP0 寄存器来控制内核态/用户态，也可以进行其他操作。具体参考《MicroAptiv UP Software User's Manual MD00942》

外设内存

## 《MicroAptiv UP Software User's Manual MD00942》


### 内存管理

#### TLB

在请求被送到 cache 控制器之前完成虚拟地址到物理地址的转换。MMU 提供两种转换机制 - TLB（Translation Lookaside Buffer）和 FMT（Fixed Mapping Translation），TLB 未映射的区域通过 FMT 来进行映射。  
JTLB ITLB DTLB

#### 运行模式

- 应用程序大多运行在用户态下
- 当 reset 或者是异常发生的时候会进入到内核态，在内核态下，软件可以访问到整个地址空间。

![虚拟地址空间](fig/虚拟地址空间.png)

非映射区段不使用 TLB，也不使用 FMT，用的是一种和 FMT 类似的方式来完成地址映射。  
映射区段使用 TLB 或 FMT 来完成地址映射，以页为基础。

- kseg0 虚拟地址空间为 0x8000_0000 - 0x9FFF_FFFF，减去 0x8000_0000 来完成地址映射。该区段虚拟空间大小为 512 MB。
- kseg1 虚拟地址空间为 0xA000_0000 - 0xBFFF_FFFF，减去 0xA000_0000 来完成地址映射。该区段虚拟空间大小为 512 MB。
- kseg2 虚拟地址空间为 0xC000_0000 - 0xDFFF_FFFF，通过 TLB 来完成地址映射
- kseg3 虚拟地址空间为 0xE000_0000 - 0xFFFF_FFFF，通过 TLB 来完成地址映射

#### TLB

- JTLB（joint TLB）同时完成指令和数据的地址转换
- JTLB 组织为页面对来最小化总的大小。每一个 tag 条目对应两个数据条目，一个奇数页条目和一个偶数页条目。
- JTLB 被组织为偶数和奇数条目对
- 虚拟地址的最高位不参与 tag 比较，只确定哪一个数据条目被使用。  
<!-- FIXME: 这里有冲突，在手册31页里面说是虚拟地址最高位不参与比较，在 See MIPS Run 里面说是最低位不参与比较，然后奇数和偶数那个是相邻的虚拟页映射到的不同的物理页，这样做可以节省空间 -->

- microAptiv UPc core 实现了一个随机替换算法，也就是随机选一个换出的页面。4.4.2.2 参照145页
- ASID 地址空间标识符 Address Space Identifier
- 为更新 JTLB，软件会执行 TLBWI 和 TLBWR 指令，在执行这些指令之前，一些 CP0 寄存器中的值需要被更新：
    1. PageMask
    2. EntryHi 寄存器中的 VPN2，VPN2X 和 ASID
    3. EntryLo0 中的 PFN0，C0，D0，V0 和 G 位
    4. EntryLo1 中的 PFN1，C1，D1，V1 和 G 位
    5. JTLB 中的 G 位是 EntryLo0 和 EntryLo1 中 G 位的与
- 虚拟地址高八位为 ASID，有时候不是（When the Status register’s ERL = 1, the user address region becomes a 229-byte unmapped and uncached address space. While in this setting, the kuseg virtual address maps directly to the same physical address and does not include the ASID field.）

### TLB 指令
4.4.3
TLBP TLB探测
TLBR 读TLB  
TLBWI 写Index处
TLBWR 随机写

### 页面重填异常
重填异常发生时，未能转换的地址已存储在 BadAddr 当中了。
ASID (地址空间标识符）：正常情况下，这部分留下来保存操作系统当前 地址空间的标识。异常不会影响该域，所以重填异常之后，该域对目前运行的进程来说仍然是正确的。

<!-- TODO: 内置的页面重填异常处理程序是在哪里？处理程序中如何获得物理地址的？系统是否已经自己分号了页？ -->
<!-- TODO: 如果重填异常处理程序没有内部实现，如何对物理内存分页？pgd 是什么？ -->

## CP0 寄存器

每个 CP0 寄存器是通过寄存器号来区分的，从 0 到 31。
0 1 2 3 4 5 6 10 15

R/W 硬件/软件可读可写，一方对其更新后另一方可以访问到  
R 启动时初始化为全0或者为预设值，或者硬件在满足某些条件的情况下更新它的值，软件只可读  
W 软件可写，但是软件不可读。如果软件读寄存器的值，会返回未定义的值  
0 设为全0

### Index 寄存器
执行 TLBR 与 TLBW 指令时，Index 寄存器指向被访问的 TLB entry

### Random 寄存器
TLB 内部实现了一个随机替换算法，可能需要用到这个寄存器。在页面被替换时该寄存器负责随机选择一个被换出的页。

### EntryLo0 和 EntryLo1
偶数页和奇数页的入口
EntryLo0 为偶数虚拟页面的 TLB 条目的低位部分  
EntryLo1 为奇数虚拟页面的 TLB 条目的低位部分  
MIPS CPU 一次性映射两个连续的虚拟页到物理页，这两个物理页分别存放在 EntryLo0 和 EntryLo1 里面


## 其他

boot 中的 Makefile 指明，启动代码和用户代码被放到了内存中的两个不同的位置，有很大迹象表明内存空间可以自行分配。
```makefile
# Place the boot code (physical address). The virtual address for
# boot code entry point is hard-wired to 0x9fc00000.
LDFLAGS += -Wl,--defsym,__flash_start=0xbfc00000
# Place the application code (physical address)
LDFLAGS += -Wl,--defsym,__flash_app_start=0x80000000
```

内存空间应使用页式管理，通过查询资料得到，首先需要[探测系统物理内存布局][1]，其次才是[以页为单位管理物理内存][2]，其中需要定义 Page 数据结构、维护空闲空间链表，提供初始化、分配内存与释放内存的接口。

## 物理内存探测

> 实验教程

RAM0 中存放的是引导代码（虚拟地址 0xbfc00000 - 0xbfc1fffc = 物理地址 0x1fc00000 - 0x1fc1fffc），RAM1 中存放的是用户代码（虚拟地址 0x80000000 - 0x8003fffc = 物理地址 0x00000000 - 0x0003fffc）。

| 虚拟地址     | 物理地址      | 信号名        | Minisys                   |
|:-----------:|:-----------:|:------------:|:-------------------------:|
| 0xbfc0 0000 - 0xbfc1 fffc | 0x1fc0 0000 - 0x1fc1 fffc | | RAM0       |
| 0x8000 0000 - 0x8003 fffc | 0x0000 0000 - 0x0003 fffc | | RAM1       |

> 《JamesM's kernel development tutorials》 第九章  


要实现内存的管理，首先要解决以下三个问题：

1. 如何获取可用物理内存的大小和地址？
通过阅读硬件文档，得知 RAM0 和 RAM1 的物理地址和虚拟地址情况如上表，引导代码存放在 RAM0 中，用户代码存放在 RAM1 中，均存放在对应虚拟/物理地址的起始处。引导代码和用户代码所占空间需设为已使用
2. 采用什么样的数据结构来描述物理内存？
页表
3. 申请和释放物理内存的算法如何实现？



## 用户堆和栈

> 《MIPS 体系结构与编程》 刘佩林 P174  
> [MIPS 在linux中的内存映射][3]  
> 《MIPS 体系结构透视》 P263/331

MIPS 硬件不直接支持堆栈结构，但是 C 语言语法却使用了堆栈，所以需要弄明白 MIPS 是如何利用处理器和存储器资源来实现堆栈的。

用户堆和栈：应用程序的栈初始设置到用户可以访问的空间（约2G虚拟空间）的顶部而且向下增长。操作系统检测到对已分配的最低栈空间附近未映射的存储器访问时，会自动映射更多的页已满足栈的增长。

## 用户态与内核态

> [mips的内存管理-kseg0,kseg1虚拟和物理地址映射理解][4]  
> [MIPS 在linux中的内存映射][5]  
> [MIPS Address Space][6]  
> 
1. MIPS 复位和中断发生的时候会自动进入内核态  
2. 在用户态下，向虚拟地址 0x80000000 \~ 0xffffffff 写入数据会抛出异常  
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

页表就是一个\_\_页表条目\_\_（Page Table Entry，PTE）的数组，每个 PTE 是由一个有效位和一个 n 位地址字段组成的。有效位表明了该虚拟页当前是否被缓存在DRAM中。如果设置了有效位，那么地址字段就表示 DRAM 中相应的物理页的起始位置，这个物理页中缓存了该虚拟页。如果没有设置有效位，那么一个空地址表示这个虚拟页还未被分配。否则，这个地址就指向该虚拟页在磁盘上的起始位置。

DRAM 缓存是全相联的，任意物理页都可以包含任意虚拟页，页面可以随机地分散在物理内存中。

### questions

- 如何区分内核/用户虚拟空间？非映射部分是否需要建立页表？
PTE 附带有效位，可以在其基础上添加读写及访问权限控制位。非映射部分也需要建立页表，不允许用户来访问（在页表写好以后原有映射失效的情况下才成立的）。
- 页表是根据什么建立的？物理内存及外存？还是虚拟内存？
虚拟内存建立虚拟页，物理内存及外存建立物理业页，页表存放在虚拟内存中，页表基址及页表条目大小用 CP0 寄存器来设置。

- 物理内存如何探测？如何确定某一块物理内存为内核所用？

用户空间 如何映射
搞懂它们怎么映射
算出映射到的物理地址 然后
转换机制
tlb 源码
block ram是最简单的 不是ddr
ram1可用 直接用地址 当作用户ram
物理上留一块空间当作文件系统
make link了哪些东西 哪些作为核心 哪些给用户 用户库分离开
研究的过程记录起来
堆栈需要开辟
18周之前验收
地址转换机制 管理物理内存 语音备忘
地址映射应该可以控制

需要使用段式管理吗？堆栈需要设置吗？
已有的 MMU 是如何做地址映射的？没有分页啊？加入分页以后会覆盖掉 MMU 原有的行为吗？

多级页表中的每一级页表都是连续存放的吗？第二级页表的基址如何获得？

### TODO

<!-- CPU 中含有一个页表基址寄存器（Page Table Base Register，PTBR）指向当前页表 -->

### 页表初始化

> [linux 内存管理---分页系统之页表初始化（四）][7]  
> 《ORANGE’S：一个操作系统的实现》

内核页表和用户页表可以放在一起。最近有[报告][8]展示现在有将内核页表隔离出去的工作，表明之前大多数系统时将用户页表和内核页表放在一起的。

pipeline: 

```asm
%include    "pm.inc"    ; 常量, 宏, 以及一些说明

PageDirBase equ 200000h ; 页目录开始地址: 2M
PageTblBase equ 201000h ; 页表开始地址: 2M+4K

LABEL_DESC_PAGE_DIR: Descriptor PageDirBase, 4095, DA_DRW;Page Directory
LABEL_DESC_PAGE_TBL: Descriptor PageTblBase, 1023, DA_DRW|DA_LIMIT_4K;Page Tables

```

### 段页式管理

分段机制启动、分页机制未启动：逻辑地址--->段机制处理--->线性地址=物理地址  
分段机制和分页机制都启动：逻辑地址--->段机制处理--->线性地址--->页机制处理--->物理地址


## 参考资料

1. [物理内存管理][9]
2. [Mips Address Space][10]
3. [MIPS 存储管理][11]
4. 实验教程
5. 《MIPS 体系结构与编程》 刘佩林 P174
6. [MIPS 在linux中的内存映射][12]
7. 《MIPS 体系结构透视》 P263/331
8. [mips的内存管理-kseg0,kseg1虚拟和物理地址映射理解][13]
9. [MIPS 在linux中的内存映射][14]
10. [linux 内存管理---分页系统之页表初始化（四）][15]
11. 《ORANGE’S：一个操作系统的实现》

[1]:	https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2/lab2_3_3_2_search_phymem_layout.html
[2]:	https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2/lab2_3_3_3_phymem_pagelevel.html
[3]:	http://www.voidcn.com/article/p-fpioowtl-tp.html
[4]:	http://blog.chinaunix.net/uid-20564848-id-74683.html
[5]:	http://www.voidcn.com/article/p-fpioowtl-tp.html
[6]:	http://www.johnloomis.org/microchip/pic32/memory/memory.html
[7]:	https://blog.csdn.net/whuzm08/article/details/80184175
[8]:	https://linux.cn/article-9201-1.html
[9]:	https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2.html
[10]:	http://www.johnloomis.org/microchip/pic32/memory/memory.html
[11]:	http://imgtec.eetrend.com/d6-imgtec/article/2014-02/1291.html
[12]:	http://www.voidcn.com/article/p-fpioowtl-tp.html
[13]:	http://blog.chinaunix.net/uid-20564848-id-74683.html
[14]:	http://www.voidcn.com/article/p-fpioowtl-tp.html
[15]:	https://blog.csdn.net/whuzm08/article/details/80184175