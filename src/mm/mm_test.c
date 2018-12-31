#include <mm/mm_test.h>

pid_t pid = 0;
int alloc_size[TEST_COUNT] = {32, 64, 128, 256, 512, 1024, 2048, 4096, 6144, 32, 33};
// 0x80022000


int test_alloc_memory(){
    int *addr_alloc[TEST_COUNT] = {NULL};
    int addr_true_int[TEST_COUNT] = {0x80022fe0, 0x80022ec0, 0x80022c80, 0x80022800, 0x80022400, 0x80022000, 0x80023000, 0x80024000, 0x80025000, 0x80027fe0, 0x80027ec0};
    int *addr_true[TEST_COUNT];
    
    int i;
    for(i = 0; i < TEST_COUNT; ++i)
        addr_true[i] = (int *)addr_true_int[i];
    for (i = 0; i < TEST_COUNT; ++i){
        addr_alloc[i] = (int *)kmalloc(pid, alloc_size[i]);
        if(get_page_status((uint32_t)addr_alloc[i]) != 1){
            // 错误类型一
            // 页面在分配之后未修改标志位
            return 1000;
        }

        if(addr_alloc[i] != addr_true[i]){
            // 错误类型二
            // 页面分配得到的地址不正确
            if(addr_alloc[i] == NULL)
                return 2200;
            return (int)addr_alloc[i];
            return 2000 + i;
        }
            
    }
    return 3000;
}

int test_rw_memory(){
    return 1;
}

int test_free_memory(){
    return 1;
}