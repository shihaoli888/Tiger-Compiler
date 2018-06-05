
L37:
sw $ra, -4+printboard_FRAMESIZE($sp)
sw $s7, -8+printboard_FRAMESIZE($sp)
sw $s6, -12+printboard_FRAMESIZE($sp)
sw $s5, -16+printboard_FRAMESIZE($sp)
sw $s4, -20+printboard_FRAMESIZE($sp)
sw $s3, -24+printboard_FRAMESIZE($sp)
sw $s2, -28+printboard_FRAMESIZE($sp)
sw $s1, -32+printboard_FRAMESIZE($sp)
sw $s0, -36+printboard_FRAMESIZE($sp)
sw $a0, 0+printboard_FRAMESIZE($sp)
li r106, 0
lw r236, 0+printboard_FRAMESIZE($sp)
lw r235, -4(r236)
addi r110, r235, -1
ble r106, r110, L11
nop

L1:
la r237, L13
move $a0, r237
jal printStr
nop
move $v0, $v0
lw $s7, -8+printboard_FRAMESIZE($sp)
lw $s6, -12+printboard_FRAMESIZE($sp)
lw $s5, -16+printboard_FRAMESIZE($sp)
lw $s4, -20+printboard_FRAMESIZE($sp)
lw $s3, -24+printboard_FRAMESIZE($sp)
lw $s2, -28+printboard_FRAMESIZE($sp)
lw $s1, -32+printboard_FRAMESIZE($sp)
lw $s0, -36+printboard_FRAMESIZE($sp)
lw $ra, -4+printboard_FRAMESIZE($sp)
j L36
nop

L11:
li r107, 0
lw r239, 0+printboard_FRAMESIZE($sp)
lw r238, -4(r239)
addi r109, r238, -1
ble r107, r109, L8
nop

L2:
la r240, L10
move $a0, r240
jal printStr
nop
bge r106, r110, L1
nop

L12:
addi r106, r106, 1
j L11
nop

L8:
lw r244, 0+printboard_FRAMESIZE($sp)
lw r243, -12(r244)
li r246, 4
mul r245, r106, r246
add r242, r243, r245
lw r241, 0(r242)
beq r241, r107, L5
nop

L6:
la r247, L4
move r108, r247

L7:
move $a0, r108
jal printStr
nop
bge r107, r109, L2
nop

L9:
addi r107, r107, 1
j L8
nop

L5:
la r248, L3
move r108, r248
j L7
nop

L36:
nop


--------
