/*
 * main.c for the MIPSfpga core running on a Nexys4 DDR FPGA board.
 * 
 * Writes a sequence of increasing numbers to the 8 7-segment displays.
 */
//------------------
// main()
//------------------

#include <mips/m32c0.h>
#include <mips/hal.h>

int main() {
  volatile int *i = (int*)0x555;

  *i=12345;
  return 0;
}


void __attribute__((nomips16))_mips_handle_exception(struct gpctx* ctx,int exception){
  volatile int j = mips32_get_c0(8);
}