#include<mips/asm.h>
    .align	5
/*TODO:偏移量还得考虑一哈
 * void switch_to(struct context *from, struct context *to);                     
 */
 LEAF(switch_to)
    sw $16,($4)
    sw $17,4($4)
    sw $18,8($4)
    sw $19,12($4)
    sw $20,16($4)
    sw $21,20($4)
    sw $22,24($4)
    sw $23,28($4)
    sw $29,32($4)
    sw $30,36($4)
    sw $31,40($4)

    lw $16,($4)
    lw $17,4($4)
    lw $18,8($4)
    lw $19,12($4)
    lw $20,16($4)
    lw $21,20($4)
    lw $22,24($4)
    lw $23,28($4)
    lw $29,32($4)
    lw $30,36($4)
    lw $31,40($4)
    jr	$31
END(switch_to)