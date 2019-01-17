
#ifndef _INCLUDE_DEBUG_H
#define _INCLUDE_DEBUG_H

/**
 * 
 * 
 */

extern int value_global;

void writeValTo7SegsDec(unsigned int val);

void writeValTo7SegsHex(unsigned int val);

void writeValTo7SegsHex1(unsigned int high, unsigned int low);

void led_red(int value);

void delay();

int keyboard_input();
int keyboard_value();

void led_no_delay(int value);

#endif