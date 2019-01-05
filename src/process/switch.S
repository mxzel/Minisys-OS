#include<mips/asm.h>
    .align	5
/*TODO:偏移量还得考虑一哈
 * void switch_to(struct context *from, struct context *to);                     
 */
 LEAF(switch_to)
   
   sw $16,0($4)
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

    lw $16,0($5)
    lw $17,4($5)
    lw $18,8($5)
    lw $19,12($5)
    lw $20,16($5)
    lw $21,20($5)
    lw $22,24($5)
    lw $23,28($5)
    lw $6,32($5)
    lw $30,36($5)
    
    sw $31,-4($6)  

    lw $8,40($5)

    jr	$8
END(switch_to)