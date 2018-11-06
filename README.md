# 综合课程设计 课题二 - 操作系统的实现

## 可能需要学的知识

markdown  
bash 常用命令  
C 语言特性（asmlinkage，asm，volatile 等等）  

## 需要的教程

### Git

Git 是一个分布式版本控制的软件，
GitHub 是通过 Git 进行版本控制的软件源代码托管服务。
简而言之，使用 GitHub 进行多人合作会非常方便。

##### GitHub 配置

暂略，网上有很多教程可以参考
<!-- 
### Makefile

我们使用 Makefile 的规则是：

1. 如果这个工程没有编译过，那么我们的所有c文件都要编译并被链接。
2. 如果这个工程的某几个c文件被修改，那么我们只编译被修改的c文件，并链接目标程序。
3. 如果这个工程的头文件被改变了，那么我们需要编译引用了这几个头文件的c文件，并链接目标程序。

make 命令会自动智能地根据当前的文件修改的情况来确定哪些文件需要重编译，从而自己编译所需要的文件和链接目标程序。 -->

<!-- ### [gdb](https://chyyuu.gitbooks.io/ucore_os_docs/content/lab0/lab0_2_3_3_gdb.html) -->

### shell

- grep 命令

    正则表达式匹配文件内容，在某路径下查找所有文本文件中某个关键词时会非常方便  

    ```bash
    # 在当前目录及子目录下的所有文本文件中搜索 "page" 关键字
    grep -r "page" .
    ```

- find 命令 - 查找文件，可以根据文件名来查找某个文件

    ```bash
    # 在当前目录及子目录下寻找 txt 文件
    find . -name "*.txt"
    # 找出不是以 txt 结尾的文件
    find . ! -name "*.txt"
    # 删除所有 txt 文件的文件
    find . -name "*.txt" -delete
    ```

- ctrl + U - 清空当前行
- ctrl + R - 搜索历史命令
- vimdiff - 比较两份文件的不同

    ```bash
    vimdiff -O a.txt b.txt
    ```



### 开发规范

- 版本控制 - Git

    在完成了某个小的功能，或者是想实施新的想法的时候，可以把已有的代码推送到 github 上面，然后大胆地去实施新的想法。推送的时候多附带注释，代码回滚会非常方便。
- 代码编辑 - VSCode

    不是记事本就可以，但是要确保代码文件文本编码为 UTF-8，否则跨平台会出现各种问题。

- 终端 - PowerShell

    针对 WIN10，主要是方便在 Windows 中使用 shell 中的命令。WIN10 商店中有提供 Ubuntu 的下载，可以说是 Windows 原生支持的了，使用这个 Ubuntu 也是可以的。Linux 和 Mac 用默认的就可以。

- 函数跳转（参考[1]）

    在分析源代码上，可以采用 Scitools 提供的 understand 软件（跨平台），windows 环境上的 source insight 软件，或者基于 emacs+ctags，vim+ctags 等，都可以比较方便在在一堆文件中查找变量、函数定义、调用/访问关系等。
- 比较两份文本文件的不同

    可以使用 meld、kdiff3、UltraCompare 等软件，也可以使用 vimdiff 命令。

- 调试（debug）实验有助于发现设计中的错误，可采用 gdb（配合 qemu）等调试工具软件。

### 开发流程

1. 启动操作系统的 bootloader，用于了解操作系统启动前的状态和要做的准备工作，了解运行操作系统的硬件支持，操作系统如何加载到内存中，理解两类中断--“外设中断”，“陷阱中断”等；
2. 物理内存管理子系统，用于理解x86分段/分页模式，了解操作系统如何管理物理内存；
3. 虚拟内存管理子系统，通过页表机制和换入换出（swap）机制，以及中断-“故障中断”、缺页故障处理等，实现基于页的内存替换算法；
4. 内核线程子系统，用于了解如何创建相对与用户进程更加简单的内核态线程，如果对内核线程进行动态管理等；
用户进程管理子系统，用于了解用户态进程创建、执行、切换和结束的动态管理过程，了解在用户态通过系统调用得到内核态的内核服务的过程；
5. 处理器调度子系统，用于理解操作系统的调度过程和调度算法；
同步互斥与进程间通信子系统，了解进程间如何进行信息交换和共享，并了解同步互斥的具体实现以及对系统性能的影响，研究死锁产生的原因，以及如何避免死锁；
6. 文件系统，了解文件系统的具体实现，与进程管理等的关系，了解缓存对操作系统IO访问的性能改进，了解虚拟文件系统（VFS）、buffer cache和disk driver之间的关系。

## 注意事项

1. 在某文件夹下打开 PowerShell 的方法：按住 `shift+鼠标右键`，点击在此处打开 PowerShell。  
2. 文档中如果包含有代码片段，请使用 Markdown，例如：  
    ```C++
    #include <iostream>
    using namespace std;
    int main(){
        cout << "hello world" << endl;
        return 0;
    }
    ```
    不要在 Word 文档里面插入代码。

## 参考资料
1. [ucore_os_lab](https://github.com/chyyuu/ucore_os_lab) [gitbook](https://chyyuu.gitbooks.io/ucore_os_docs/content/)  
os kernel labs for operating systems course in Tsinghua University.
2. [xv6 中文文档](https://th0ar.gitbooks.io/xv6-chinese/content/)
3. [How to Make a Computer Operating System](https://samypesse.gitbooks.io/how-to-create-an-operating-system/content/)
