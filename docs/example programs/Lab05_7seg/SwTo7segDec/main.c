/*
 * main.c for the MIPSfpga system running on Minisys board.
 *
 * Lab 5: SwTo7segDec
 * This program displays the value of the switches in decimal on the 
 * 7-segment displays.
 */

void writeValTo7Segs(unsigned int val);

//------------------
// main()
//------------------
int main() {
  volatile int *IO_SWITCHES = (int*)0xbf800008;
  volatile unsigned int switches;
  int i;
  i = 0;
  while (i < 100000) {  
    switches = *IO_SWITCHES;
    writeValTo7Segs(switches);
    i += 1;
  }
  switches = 0;
  writeValTo7Segs(0);
  return 0;
}


void writeValTo7Segs(unsigned int val) {
  volatile int *IO_7SEGEN   = (int*)0xbf800010;
  volatile int *IO_7SEG0    = (int*)0xbf800014;

  volatile int digit, i=0, en=0, enBit;
  volatile int *addr_7SEG = IO_7SEG0;
  
  do {
    digit = val % 10; 
    *addr_7SEG = digit;  // write digit to 7-segment display
    val = val / 10;
    enBit = 1 << i;
    en = en | enBit;
    addr_7SEG += 1;
    i++;
  } while ( (val > 0) && (i < 8));

  *IO_7SEGEN = ~en; // enable 7-segment displays
  
  return;
}

void _mips_handle_exception(void* ctx, int reason) {
  volatile int *IO_LEDR = (int*)0xbf800000;

  *IO_LEDR = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
