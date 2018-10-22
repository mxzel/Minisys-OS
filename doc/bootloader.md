# BootLoader

BootLoader 存放于 ROM 中，程序启动及初始化完成后加载存储设备中的其他程序到 RAM 中，然后跳转到相应的地址执行对应的程序。

## BootLoader 的两段式启动

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

## 参考资料



1. [u-boot/mips移植分析](https://blog.xuite.net/tzeng015/twblog/113272444-u-boot%2Fmips%E7%A7%BB%E6%A4%8D%E5%88%86%E6%9E%90)