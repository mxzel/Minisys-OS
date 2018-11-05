/*
 * main.S for microAptiv_UP MIPS core running on Minisys board
 *
 * Description:
 * Writes increasing values to the eight 7-segment display on
 * the Minisys board. 
 */

.globl main
  

main:
  addiu $9, $0, 0         
  lui   $8, 0xbf80
  addi  $10, $0, 0x0 
  sw    $10, 0x10($8)# enable 7seg
L1:    
  sw    $9, 0x14($8)# write to 7seg0 
  addiu $9, $9, 1      
  sw    $9, 0x18($8)# write to 7seg1 
  addiu $9, $9, 1      
  sw    $9, 0x1c($8)# write to 7seg2 
  addiu $9, $9, 1      
  sw    $9, 0x20($8)# write to 7seg3 
  addiu $9, $9, 1      
  sw    $9, 0x24($8)# write to 7seg4 
  addiu $9, $9, 1      
  sw    $9, 0x28($8)# write to 7seg5 
  addiu $9, $9, 1      
  sw    $9, 0x2c($8)# write to 7seg6 
  addiu $9, $9, 1      
  sw    $9, 0x30($8)# write to 7seg7 
  addiu $9, $9, 1      

delay: 
  lui   $5, 0x126
  ori   $5, $5, 0x25a0 
  add   $6, $0, $0
L2:
  sub   $7, $5, $6
  addi  $6, $6, 1
  bgtz  $7, L2        
  nop
  beq   $0, $0, L1
  nop


