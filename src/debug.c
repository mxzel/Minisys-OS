#include <debug.h>

int value_global = 0;

void writeValTo7SegsDec(unsigned int val) {
    volatile int *IO_7SEGEN = (int *)0xbf800010;
    volatile int *IO_7SEG0 = (int *)0xbf800014;

    volatile int digit, i = 0, en = 0, enBit;
    volatile int *addr_7SEG = IO_7SEG0;

    do
    {
        digit = val % 10;
        *addr_7SEG = digit; // write digit to 7-segment display
        val = val / 10;
        enBit = 1 << i;
        en = en | enBit;
        addr_7SEG += 1;
        i++;
    } while ((val > 0) && (i < 8));

    *IO_7SEGEN = ~en; // enable 7-segment displays

    delay();
    return;
}

void writeValTo7SegsHex(unsigned int val){
    volatile int *IO_7SEGEN = (int *)0xbf800010;
    volatile int *IO_7SEG0 = (int *)0xbf800014;
    volatile int *IO_7SEG1 = (int *)0xbf800018;
    volatile int *IO_7SEG2 = (int *)0xbf80001c;
    volatile int *IO_7SEG3 = (int *)0xbf800020;
    volatile int *IO_7SEG4 = (int *)0xbf800024;
    volatile int *IO_7SEG5 = (int *)0xbf800028;
    volatile int *IO_7SEG6 = (int *)0xbf80002c;
    volatile int *IO_7SEG7 = (int *)0xbf800030;

    volatile unsigned int switches;

    *IO_7SEGEN = 0x00; // enable 4 right-most 7-segment displays

    switches = val;

    *IO_7SEG0 = switches;     // write lowest hex digit to 7SEG0
    switches = switches >> 4; // shift off lowest hex digit
    *IO_7SEG1 = switches;     // write next hex digit to 7SEG1
    switches = switches >> 4; // shift off next hex digit
    *IO_7SEG2 = switches;     // write next hex digit to 7SEG2
    switches = switches >> 4; // shift off next hex digit
    *IO_7SEG3 = switches;     // write next hex digit to 7SEG3
    switches = switches >> 4; // shift off next hex digit
    *IO_7SEG4 = switches;     // write lowest hex digit to 7SEG0
    switches = switches >> 4; // shift off lowest hex digit
    *IO_7SEG5 = switches;     // write next hex digit to 7SEG1
    switches = switches >> 4; // shift off next hex digit
    *IO_7SEG6 = switches;     // write next hex digit to 7SEG2
    switches = switches >> 4; // shift off next hex digit
    *IO_7SEG7 = switches;     // write next hex digit to 7SEG3
    switches = switches >> 4; // shift off next hex digit

    delay();
}

void writeValTo7SegsHex1(unsigned int high, unsigned int low){
    writeValTo7SegsHex((high << 16) + low);
}

void led_red(int value){
    volatile int *IO_LEDR = (int*)0xbf800000;
    *IO_LEDR = value;
    delay();
}

void delay() {
    volatile unsigned int j;
    for (j = 0; j < (7000000); j++) ;	// delay
}


int keyboard_input(){
volatile int *IO_KEYBOARD = (int*)0xbf80000c;
volatile unsigned int keyboard;
int i =0;
  while (1) {
    // led_red(i);
    // i=!i;    
    keyboard = *IO_KEYBOARD;
	if(keyboard & 0x00000010){
       // writeValTo7SegsHex(keyboard & 0x0000000F);
		return keyboard & 0x0000000F;
	}
  }
}
int keyboard_value()
{
  writeValTo7SegsHex(0);
unsigned value=0;
unsigned input=0;
int hasChanged=0;
while(input=keyboard_input(),1)
{
    if(hasChanged==0&&input==0xF)
    {
        continue;
    }
    if(input!=0xF&&input<0xA){
        value=value*10+input;
        writeValTo7SegsDec(value);
        hasChanged=1;
    }
    else return value;
}
}
void led_no_delay(int value){
    volatile int *IO_LEDR = (int*)0xbf800000;
    *IO_LEDR = value;
}