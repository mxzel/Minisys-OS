#include <mm_test.h>

pid_t pid = 0;
int alloc_size[TEST_COUNT] = {32, 64, 128, 256, 512, 1024, 2048, 4096, 6144, 32, 33};

bool test_alloc_memory(){
    int *addr_alloc[TEST_COUNT] = {NULL};
    int *addr_true[TEST_COUNT] = {NULL};
    int i;
    for (i = 0; i < TEST_COUNT; ++i){
        addr_alloc[i] = (int *)kmalloc(pid, alloc_size[i]);
        if(addr_alloc[i] != addr_true[i])
            return false;
    }
    return true;
}

bool test_rw_memory(){
    return true;
}

bool test_free_memory(){
    return true;
}