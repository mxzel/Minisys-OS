#include <mm/mm.h>

/**
 * 
 *  cd "c:\Comprehensive\OSX\src\" ; if ($?) { gcc main.c -o main -I ./include -I ./lib -I ./include/lib } ; if ($?) { .\main }
 * 
 */

int main(){
    mm_init();
    return 0;
}