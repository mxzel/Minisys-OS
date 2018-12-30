
#include <mm/mm.h>

#ifndef INCLUDE_MM_MM_TEST_H_
#define INCLUDE_MM_MM_TEST_H_

#define TEST_COUNT 11

extern pid_t pid;
extern int alloc_size[TEST_COUNT];

bool test_alloc_memory();

bool test_rw_memory();

bool test_free_memory();

#endif // INCLUDE_MM_MM_TEST_H_