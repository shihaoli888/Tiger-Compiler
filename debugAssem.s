
L8:
move r107, $ra
sw r107, -8+nfactor_FRAMESIZE($sp)
move $s7, $s7
move r118, $s6
sw r118, -4+nfactor_FRAMESIZE($sp)
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
sw $a0, 0+nfactor_FRAMESIZE($sp)
move $s6, $a1
beq $s6, $zero, L1
nop

L2:
move $s6, $s6
lw $t9, 0+nfactor_FRAMESIZE($sp)
addi $t8, $s6, -1
move $a0, $t9
move $a1, $t8
jal nfactor
nop
move $t9, $v0
mul $s6, $s6, $t9
move $s6, $s6

L3:
move $v0, $s6
move $s7, $s7
lw r154, -4+nfactor_FRAMESIZE($sp)
move $s6, r154
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
lw r155, -8+nfactor_FRAMESIZE($sp)
move $ra, r155
j L7
nop

L1:
li $s6, 1
j L3
nop

L7:
nop


--------
