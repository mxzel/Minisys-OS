.align	5
/*TODO:偏移量还得考虑一哈
 * void switch_to(struct context *from, struct context *to);                     
 */

    sw $16,(a0)
    sw $17,4(a0)
    sw $18,8(a0)
    sw $19,12(a0)
    sw $20,16(a0)
    sw $21,20(a0)
    sw $22,24(a0)
    sw $23,28(a0)
    sw $29,32(a0)
    sw $30,36(a0)
    sw $31,40(a0)

    lw $16,(a0)
    lw $17,4(a0)
    lw $18,8(a0)
    lw $19,12(a0)
    lw $20,16(a0)
    lw $21,20(a0)
    lw $22,24(a0)
    lw $23,28(a0)
    lw $29,32(a0)
    lw $30,36(a0)
    lw $31,40(a0)