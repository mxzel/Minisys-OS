
#include <mm/mm.h>

#ifndef INCLUDE_MM_MM_TEST_H_
#define INCLUDE_MM_MM_TEST_H_

#define TEST_COUNT 10

extern pid_t pid;
extern int alloc_size[TEST_COUNT];

int test_alloc_memory();

int test_rw_memory();

int test_free_memory();

bool test_alloc_free();

bool test_alloc_page_block();

bool test_alloc_block();

bool test_rw_block();

#endif // INCLUDE_MM_MM_TEST_H_