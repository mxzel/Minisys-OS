// #include "include/include.h"
// #include <stdio.h>
#include "lib/defs.h"
#include "lib/list.h"
#include "include/linux/mm.h"

// typedef char bool;
int main(int argc, char const *argv[]) {
    struct Page page;
    // bool x;
    bool x;
    x = true;
    printf("%d\n", PAGE_SIZE * 2 + PAGE_TABLE_BASE_ADDR);
    return 0;
}

