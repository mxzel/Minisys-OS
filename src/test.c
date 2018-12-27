


// #include "include/include.h"
// #include <stdio.h>
// #include "lib/defs.h"
// #include "lib/list.h"
// #include "include/linux/mm.h"

/**
 * 请勿删除该注释！！！
 * 
 * 编译时添加 "-I ." 参数，会使 gcc 优先查找给定的目录
 * gcc test.c -o test -I ./include -I ./lib -I ./include/lib
 * cd "/Users/seapatrol/Desktop/Projects/OSX/src/" && gcc test.c -o test -I ./include -I ./lib -I ./include/lib && "/Users/seapatrol/Desktop/Projects/OSX/src/"test
 */

// #include <types.h>
// #include <list.h>
// #include <defs.h>
// #include <mm/pmm.h>

#include <stdio.h>

int main(int argc, char const *argv[]) {
    int a = 0x0000ffff;
    printf("%x\n", ~a);
    // int x = &a;
    // // int *p = (int *)123;
    // printf("%x\n", x);
    // int *c = x;
    // printf("%d\n", *c);
    return 0;
}

