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

RAM0 中存放的是引导代码（虚拟地址 0xbfc00000-0xbfc1fffc = 物理地址 0x1fc00000 - 0x1fc1fffc），RAM1 中存放的是用户代码（虚拟地址 0x80000000 - 0x8003fffc = 物理地址 0x00000000 - 0x0003fffc）。


## 参考资料

1. [物理内存管理](https://chyyuu.gitbooks.io/ucore_os_docs/content/lab2.html)