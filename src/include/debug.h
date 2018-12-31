
#ifndef _INCLUDE_DEBUG_H
#define _INCLUDE_DEBUG_H

/**
 * 开始时一共有28个空闲物理页
 * 
 */

extern int value_global;

void writeValTo7SegsDec(unsigned int val);

void writeValTo7SegsHex(unsigned int val);

void led_red(int value);

void delay();

#endif