# 综合课程设计 课题二 - 操作系统的实现

## Contents

- [综合课程设计 课题二 - 操作系统的实现](#综合课程设计-课题二---操作系统的实现)
    - [Contents](#contents)
    - [可能需要学的知识](#可能需要学的知识)
    - [需要的教程](#需要的教程)
        - [Git](#git)
                - [GitHub 配置](#github-配置)
        - [开发平台](#开发平台)
    - [注意事项](#注意事项)
    - [参考资料](#参考资料)


## 可能需要学的知识

makefile  
markdown  
C 语言（asmlinkage，asm，volatile 等等）

## 需要的教程

### Git

Git 是一个分布式版本控制的软件，
GitHub 是通过 Git 进行版本控制的软件源代码托管服务。
简而言之，使用 GitHub 进行多人合作会非常方便。

##### GitHub 配置

暂略，网上有很多教程可以参考

### 开发平台

* 版本控制 - Git  
* 代码编辑 - VSCode（不是记事本就可以，但是要确保代码文件文本编码为 UTF-8，否则跨平台会出现各种问题）  
* 终端 - PowerShell（Win10。Ubuntu 和 Mac 用默认的就可以）

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
