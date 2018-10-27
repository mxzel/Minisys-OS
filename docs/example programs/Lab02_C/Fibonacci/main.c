/*
 * main.c for the MIPSfpga core running on Minisys board.
 *
 * This program demonstrates exception handling.
 */

volatile int fibonacci[20];

void delay();

int main() {
  // volatile int *test_error = (int*)0x0;

  // *test_error = 56;   // write to address 0 will cause an exception

  fibonacci[0] = 0;
  fibonacci[1] = 1;
  volatile int i;
  for(i = 2; i < 15; ++i){
    fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
  }

  volatile int *IO_LEDR = (int*)0xbf800000;
  while(1){
      i = 0;
      for(i = 0; i < 12; ++i){
        *IO_LEDR = fibonacci[i];
        delay();
      }
      *IO_LEDR = 0xffff;  // Display 0x8001 on LEDs to indicate error state
      delay();
  }
  
  return 0;
}
/*
void _mips_handle_exception(void* ctx, int reason) {
  fibonacci[0] = 0;
  fibonacci[1] = 1;
  volatile int i;
  for(i = 2; i < 15; ++i){
    fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
  }
  *(int*)IO_7SEGEN = 0xffff;
  *(int*)IO_7SEG0 = 0x00;
  *(int*)IO_7SEG1 = 0x00;
  *(int*)IO_7SEG2 = 0x00;
  *(int*)IO_7SEG3 = 0x00;

  volatile int *IO_LEDR = (int*)0xbf800000;

  *IO_LEDR = 0x8000;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
*/
void delay() {
  volatile unsigned int j;

  for (j = 0; j < (10000000); j++) ;	// delay
}


