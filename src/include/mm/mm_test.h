
#include <mm/mm.h>

#ifndef INCLUDE_MM_MM_TEST_H_
#define INCLUDE_MM_MM_TEST_H_

#define TEST_COUNT 10

extern pid_t pid;
extern int alloc_size[TEST_COUNT];

int test_alloc_memory();

int test_rw_memory();

int test_free_memory();

void test_global_variable();

#endif // INCLUDE_MM_MM_TEST_H_