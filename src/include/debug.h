
#ifndef _INCLUDE_DEBUG_H
#define _INCLUDE_DEBUG_H

/**
 * 
 * 
 */
// 测试值
extern int value_global;

// 将数据以十进制方式写入数码管
void writeValTo7SegsDec(unsigned int val);

// 将数据以十六进制方式写入数码管
void writeValTo7SegsHex(unsigned int val);

// 将数据以十六进制方式写入数码管，分低八位与高八位
void writeValTo7SegsHex1(unsigned int high, unsigned int low);

// 将数据写入 LED
void led_red(int value);

// 延时
void delay();

int keyboard_input();
int keyboard_value();

void led_no_delay(int value);

#endif