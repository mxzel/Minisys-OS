/*
 * main.c for the MIPSfpga core running on Minisys board.
 *
 * This program demonstrates exception handling.
 */

int main() {
  volatile int *test_error = (int*)0x0;

  *test_error = 56;   // write to address 0 will cause an exception
  
  return 0;
}

void _mips_handle_exception(void* ctx, int reason) {
  volatile int *IO_LEDR = (int*)0xbf800000;

  *IO_LEDR = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}


