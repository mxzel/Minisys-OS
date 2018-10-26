- [实验二分析](#实验二分析)
    - [gdb](#gdb)
    - [Makefile 生成的文件](#makefile-生成的文件)
    - [Makefile 的使用](#makefile-的使用)
    - [MIPSFPGA 板上各模块的物理地址](#mipsfpga-板上各模块的物理地址)
    - [程序目录下文件分析](#程序目录下文件分析)
- [以下为网上搜索到的资料](#以下为网上搜索到的资料)
    - [BootLoader 的两段式启动](#bootloader-的两段式启动)
    - [参考资料](#参考资料)

## 实验二分析

### gdb

gdb 中的 c 命令（continue 的简写）是让处理器继续运行，这个命令会停在第一个断点，在这里会让 main 程序开始执行（指令地址 0x800007b4）。

### Makefile 生成的文件

**FPGA_Ram.elf** 是编译生成的主要文件，ELF（executable and linkable format，可执行和可链接格式）文件用来**把程序下载到 MIPSFpga 核的内存上**。  
**FPGA_Ram_dasm.txt** 是一个反汇编版的可执行（ELF）文件。它也是一个可阅读版的 ELF 文件，里面展示了指令的地址和指令对应的代码在高级语言（会变或者是 C）文件中的行号。  
**FPGA_Ram_modelsim.txt** 是另外一个可读版的 ELF 文件，但文件里面没有插入任何源代码的信息。文件主要展示了内存地址和与之相对应的指令或者数据，包含那些需要被初始化为 0 的内存地址。我们使用 Modelsim 来仿真编译好的程序时需要用到这个文件来生成内存定义文件。  
**main.o** 时可执行和可链接版的 main.c  

用文本编辑器打开 FPGA_Ram_dasm.txt 文件，可以看到引导代码和用户代码会被放在内存中的哪个未知。文件开始部分说明了引导代码从 0x9fc00000 开始，这里的地址是虚拟地址，转换成物理地址就是 0x1fc00000，重启 MIPSfpga 核之后就是从这里开始取值运行的。  
靠近文件尾部可以看到用户 main.c 代码被放在 0x8000075c 地址开始的地方，映射到物理地址就是 0x0000075c。

### Makefile 的使用

如果要添加其他需要编译的 C 语言文件，需要在 "CSOURCES=" 后面添加需要编译的 C 文件。
```makefile
CSOURES= \
main.c
```

### MIPSFPGA 板上各模块的物理地址

| 虚拟地址        | 物理地址        | 高地址         | 信号名          | Minisys                   |
|:-------------:|:-------------:|:-------------:|:--------------:|:---------------------------:|
| 0xbf80 0000 | 0x1f80 0000 |             | IO_LEDR      | LEDS                      |
| 0xbf80 0008 | 0x1f80 0008 |             | IO_SW        | switches                  |
| 0xbf80 000c | 0x1f80 000c |             | IO_PB        | pushbuttons               |
| 0xbf80 0010 | 0x1f80 0010 |             | SEGEN_N[7:0] | A [7:0]                   |
| 0xbf80 0014 | 0x1f80 0014 |             | SEG0_N[7:0]  | Digit 0 value             |
| 0xbf80 0018 | 0x1f80 0018 |             | SEG1_N[7:0]  | Digit 1 value             |
| 0xbf80 001c | 0x1f80 001c |             | SEG2_N[7:0]  | Digit 2 value             |
| 0xbf80 0020 | 0x1f80 0020 |             | SEG3_N[7:0]  | Digit 3 value             |
| 0xbf80 0024 | 0x1f80 0024 |             | SEG4_N[7:0]  | Digit 4 value             |
| 0xbf80 0028 | 0x1f80 0028 |             | SEG5_N[7:0]  | Digit 5 value             |
| 0xbf80 002c | 0x1f80 002c |             | SEG6_N[7:0]  | Digit 6 value             |
| 0xbf80 0030 | 0x1f80 0030 |             | SEG7_N[7:0]  | Digit 7 value             |
|             | 0x1fc0 0000 | 0x1fc0 1fff |              | RAM0                      |
|             | 0x1000 0000 | 0x1000 1fff |              | RAM1                      |

### 程序目录下文件分析

Fibonacci  
    ├─ boot.h 未知  
    ├─ boot.S 引导程序代码（汇编格式）
    ├─ fpga.h 定义了板子上各种模块的地址  
    ├─ init_caches.S init_cp0.S init_gpr.S init_tlb.S 应该是初始化的代码  
    ├─ main.c 主程序？  
    └─ Makefile

## 以下为网上搜索到的资料

BootLoader 存放于 ROM 中，程序启动及初始化完成后加载存储设备中的其他程序到 RAM 中，然后跳转到相应的地址执行对应的程序。

### BootLoader 的两段式启动

> 参考：[u-boot/mips移植分析][1]

[1]: https://blog.xuite.net/tzeng015/twblog/113272444-u-boot%2Fmips%E7%A7%BB%E6%A4%8D%E5%88%86%E6%9E%90        "u-boot/mips移植分析"

由于 BootLoader 的实现依赖于 CPU 的体系结构，因此大多数 BootLoader 都分为 stage1 和 stage2 两大部分。依赖于CPU体系结构的代码，比如设备初始化代码等，通常都放在 stage1 中，而且通常都用汇编语言来实现，以达到短小精悍的目的。而 stage2 则通常用 C 语言来实现，这样可以实现给复杂的功能，而且代码会具有更好的可读性和可移植性。

BootLoader 的 stage1 通常包括以下步骤（以执行的先后顺序）：

1. 硬件设备初始化。
2. 为加载 BootLoader 的 stage2 准备 RAM 空间。
3. 拷贝 BootLoader 的 stage2 到 RAM 空间中。
4. 设置好堆栈。
5. 跳转到 stage2 的 C 入口点。

BootLoader 的 stage2 通常包括以下步骤（以执行的先后顺序）：

1. 初始化本阶段要使用到的硬件设备。
2. 检测系统内存映射（memory map）。
3. 将 kernel 映像和根文件系统映像从 flash 上读到 RAM 空间中。
4. 为内核设置启动参数。
5. 调用内核。

### 参考资料

1. [u-boot/mips移植分析](https://blog.xuite.net/tzeng015/twblog/113272444-u-boot%2Fmips%E7%A7%BB%E6%A4%8D%E5%88%86%E6%9E%90)