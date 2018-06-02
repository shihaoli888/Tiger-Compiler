.data
.align 2
L35:
.word 1
.ascii " "
.align 2
L34:
.word 1
.ascii "\n"
.align 2
L19:
.word 1
.ascii "0"
.align 2
L10:
.word 1
.ascii "\n"
.align 2
L9:
.word 1
.ascii " "
.align 2
L2:
.word 1
.ascii "9"
.align 2
L1:
.word 1
.ascii "0"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 52
addi $sp,$sp,-52

L40:
sw $ra, -8+tigerMain_FRAMESIZE($sp)
sw $s7, -12+tigerMain_FRAMESIZE($sp)
sw $s6, -16+tigerMain_FRAMESIZE($sp)
sw $s5, -20+tigerMain_FRAMESIZE($sp)
sw $s4, -24+tigerMain_FRAMESIZE($sp)
sw $s3, -28+tigerMain_FRAMESIZE($sp)
sw $s2, -32+tigerMain_FRAMESIZE($sp)
sw $s1, -36+tigerMain_FRAMESIZE($sp)
sw $s0, -40+tigerMain_FRAMESIZE($sp)
addi $s7, $fp, -4
jal tigerGetchar
nop
move $s6, $v0
sw $s6, 0($s7)
addi $a0, $sp, tigerMain_FRAMESIZE
jal readlist
nop
move $s6, $v0
addi $s7, $fp, -4
jal tigerGetchar
nop
move $s5, $v0
sw $s5, 0($s7)
addi $a0, $sp, tigerMain_FRAMESIZE
jal readlist
nop
move $s5, $v0
move $s7, $fp
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $s6
move $a2, $s5
jal merge
nop
move $s6, $v0
move $a0, $s7
move $a1, $s6
jal printlist
nop
move $v0, $v0
lw $s7, -12+tigerMain_FRAMESIZE($sp)
lw $s6, -16+tigerMain_FRAMESIZE($sp)
lw $s5, -20+tigerMain_FRAMESIZE($sp)
lw $s4, -24+tigerMain_FRAMESIZE($sp)
lw $s3, -28+tigerMain_FRAMESIZE($sp)
lw $s2, -32+tigerMain_FRAMESIZE($sp)
lw $s1, -36+tigerMain_FRAMESIZE($sp)
lw $s0, -40+tigerMain_FRAMESIZE($sp)
lw $ra, -8+tigerMain_FRAMESIZE($sp)
j L39
nop

L39:
nop

addi $sp,$sp,52
jr $ra




.text
.align 2
.globl printlist
printlist:
printlist_FRAMESIZE = 44
addi $sp,$sp,-44

L42:
sw $ra, -4+printlist_FRAMESIZE($sp)
sw $s7, -8+printlist_FRAMESIZE($sp)
sw $s6, -12+printlist_FRAMESIZE($sp)
sw $s5, -16+printlist_FRAMESIZE($sp)
sw $s4, -20+printlist_FRAMESIZE($sp)
sw $s3, -24+printlist_FRAMESIZE($sp)
sw $s2, -28+printlist_FRAMESIZE($sp)
sw $s1, -32+printlist_FRAMESIZE($sp)
sw $s0, -36+printlist_FRAMESIZE($sp)
sw $a0, 0+printlist_FRAMESIZE($sp)
move $s7, $a1
beq $s7, $zero, L36
nop

L37:
li $s6, 4
mul $s6, $zero, $s6
add $s6, $s7, $s6
lw $s6, 0($s6)
move $a0, $s6
jal printInt
nop
la $s6, L35
move $a0, $s6
jal printStr
nop
lw $s4, 0+printlist_FRAMESIZE($sp)
li $s6, 4
li $s5, 1
mul $s6, $s5, $s6
add $s7, $s7, $s6
lw $s7, 0($s7)
move $a0, $s4
move $a1, $s7
jal printlist
nop
move $s7, $v0

L38:
move $v0, $s7
lw $s7, -8+printlist_FRAMESIZE($sp)
lw $s6, -12+printlist_FRAMESIZE($sp)
lw $s5, -16+printlist_FRAMESIZE($sp)
lw $s4, -20+printlist_FRAMESIZE($sp)
lw $s3, -24+printlist_FRAMESIZE($sp)
lw $s2, -28+printlist_FRAMESIZE($sp)
lw $s1, -32+printlist_FRAMESIZE($sp)
lw $s0, -36+printlist_FRAMESIZE($sp)
lw $ra, -4+printlist_FRAMESIZE($sp)
j L41
nop

L36:
la $s7, L34
move $a0, $s7
jal printStr
nop
move $s7, $v0
j L38
nop

L41:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl merge
merge:
merge_FRAMESIZE = 48
addi $sp,$sp,-48

L44:
sw $ra, -4+merge_FRAMESIZE($sp)
sw $s7, -8+merge_FRAMESIZE($sp)
sw $s6, -12+merge_FRAMESIZE($sp)
sw $s5, -16+merge_FRAMESIZE($sp)
sw $s4, -20+merge_FRAMESIZE($sp)
sw $s3, -24+merge_FRAMESIZE($sp)
sw $s2, -28+merge_FRAMESIZE($sp)
sw $s1, -32+merge_FRAMESIZE($sp)
sw $s0, -36+merge_FRAMESIZE($sp)
sw $a0, 0+merge_FRAMESIZE($sp)
move $s5, $a1
move $s4, $a2
beq $s5, $zero, L31
nop

L32:
beq $s4, $zero, L28
nop

L29:
li $s7, 4
mul $s7, $zero, $s7
add $s7, $s5, $s7
lw $s6, 0($s7)
li $s7, 4
mul $s7, $zero, $s7
add $s7, $s4, $s7
lw $s7, 0($s7)
blt $s6, $s7, L25
nop

L26:
li $s7, 8
move $a0, $s7
jal allocRecord
nop
move $s6, $v0
li $s7, 4
mul $s7, $zero, $s7
add $s7, $s4, $s7
lw $s7, 0($s7)
sw $s7, 0($s6)
addi $s7, $s6, 4
lw $s1, 0+merge_FRAMESIZE($sp)
li $s3, 4
li $s2, 1
mul $s3, $s2, $s3
add $s4, $s4, $s3
lw $s4, 0($s4)
move $a0, $s1
move $a1, $s5
move $a2, $s4
jal merge
nop
move $s5, $v0
sw $s5, 0($s7)
move $s7, $s6

L27:
move $s7, $s7

L30:
move $s7, $s7

L33:
move $v0, $s7
lw $s7, -8+merge_FRAMESIZE($sp)
lw $s6, -12+merge_FRAMESIZE($sp)
lw $s5, -16+merge_FRAMESIZE($sp)
lw $s4, -20+merge_FRAMESIZE($sp)
lw $s3, -24+merge_FRAMESIZE($sp)
lw $s2, -28+merge_FRAMESIZE($sp)
lw $s1, -32+merge_FRAMESIZE($sp)
lw $s0, -36+merge_FRAMESIZE($sp)
lw $ra, -4+merge_FRAMESIZE($sp)
j L43
nop

L31:
move $s7, $s4
j L33
nop

L28:
move $s7, $s5
j L30
nop

L25:
li $s7, 8
move $a0, $s7
jal allocRecord
nop
move $s6, $v0
li $s7, 4
mul $s7, $zero, $s7
add $s7, $s5, $s7
lw $s7, 0($s7)
sw $s7, 0($s6)
addi $s7, $s6, 4
lw $s1, 0+merge_FRAMESIZE($sp)
li $s3, 4
li $s2, 1
mul $s3, $s2, $s3
add $s5, $s5, $s3
lw $s5, 0($s5)
move $a0, $s1
move $a1, $s5
move $a2, $s4
jal merge
nop
move $s5, $v0
sw $s5, 0($s7)
move $s7, $s6
j L27
nop

L43:
nop

addi $sp,$sp,48
jr $ra




.text
.align 2
.globl readlist
readlist:
readlist_FRAMESIZE = 44
addi $sp,$sp,-44

L46:
sw $ra, -4+readlist_FRAMESIZE($sp)
sw $s7, -8+readlist_FRAMESIZE($sp)
sw $s6, -12+readlist_FRAMESIZE($sp)
sw $s5, -16+readlist_FRAMESIZE($sp)
sw $s4, -20+readlist_FRAMESIZE($sp)
sw $s3, -24+readlist_FRAMESIZE($sp)
sw $s2, -28+readlist_FRAMESIZE($sp)
sw $s1, -32+readlist_FRAMESIZE($sp)
sw $s0, -36+readlist_FRAMESIZE($sp)
sw $a0, 0+readlist_FRAMESIZE($sp)
li $s7, 4
move $a0, $s7
jal allocRecord
nop
move $s7, $v0
sw $zero, 0($s7)
move $s6, $s7
lw $s7, 0+readlist_FRAMESIZE($sp)
move $a0, $s7
move $a1, $s6
jal readint
nop
move $s7, $v0
li $s5, 4
mul $s5, $zero, $s5
add $s6, $s6, $s5
lw $s6, 0($s6)
bne $zero, $s6, L22
nop

L23:
li $s7, 0

L24:
move $v0, $s7
lw $s7, -8+readlist_FRAMESIZE($sp)
lw $s6, -12+readlist_FRAMESIZE($sp)
lw $s5, -16+readlist_FRAMESIZE($sp)
lw $s4, -20+readlist_FRAMESIZE($sp)
lw $s3, -24+readlist_FRAMESIZE($sp)
lw $s2, -28+readlist_FRAMESIZE($sp)
lw $s1, -32+readlist_FRAMESIZE($sp)
lw $s0, -36+readlist_FRAMESIZE($sp)
lw $ra, -4+readlist_FRAMESIZE($sp)
j L45
nop

L22:
li $s6, 8
move $a0, $s6
jal allocRecord
nop
move $s6, $v0
sw $s7, 0($s6)
addi $s7, $s6, 4
lw $s5, 0+readlist_FRAMESIZE($sp)
move $a0, $s5
jal readlist
nop
move $s5, $v0
sw $s5, 0($s7)
move $s7, $s6
j L24
nop

L45:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl readint
readint:
readint_FRAMESIZE = 44
addi $sp,$sp,-44

L48:
sw $ra, -4+readint_FRAMESIZE($sp)
sw $s7, -8+readint_FRAMESIZE($sp)
sw $s6, -12+readint_FRAMESIZE($sp)
sw $s5, -16+readint_FRAMESIZE($sp)
sw $s4, -20+readint_FRAMESIZE($sp)
sw $s3, -24+readint_FRAMESIZE($sp)
sw $s2, -28+readint_FRAMESIZE($sp)
sw $s1, -32+readint_FRAMESIZE($sp)
sw $s0, -36+readint_FRAMESIZE($sp)
sw $a0, 0+readint_FRAMESIZE($sp)
move $s6, $a1
li $s7, 0
addi $a0, $sp, readint_FRAMESIZE
jal skipto
nop
li $s5, 4
mul $s5, $zero, $s5
add $s6, $s6, $s5
move $s6, $s6
lw $s5, 0+readint_FRAMESIZE($sp)
lw $s5, -4($s5)
addi $a0, $sp, readint_FRAMESIZE
move $a1, $s5
jal isdigit
nop
move $s5, $v0
sw $s5, 0($s6)

L20:
lw $s6, 0+readint_FRAMESIZE($sp)
lw $s6, -4($s6)
addi $a0, $sp, readint_FRAMESIZE
move $a1, $s6
jal isdigit
nop
move $s6, $v0
bne $zero, $s6, L21
nop

L18:
move $v0, $s7
lw $s7, -8+readint_FRAMESIZE($sp)
lw $s6, -12+readint_FRAMESIZE($sp)
lw $s5, -16+readint_FRAMESIZE($sp)
lw $s4, -20+readint_FRAMESIZE($sp)
lw $s3, -24+readint_FRAMESIZE($sp)
lw $s2, -28+readint_FRAMESIZE($sp)
lw $s1, -32+readint_FRAMESIZE($sp)
lw $s0, -36+readint_FRAMESIZE($sp)
lw $ra, -4+readint_FRAMESIZE($sp)
j L47
nop

L21:
li $s6, 10
mul $s7, $s7, $s6
move $s7, $s7
lw $s6, 0+readint_FRAMESIZE($sp)
lw $s6, -4($s6)
move $a0, $s6
jal ord
nop
move $s6, $v0
add $s7, $s7, $s6
move $s6, $s7
la $s7, L19
move $a0, $s7
jal ord
nop
move $s7, $v0
sub $s7, $s6, $s7
move $s7, $s7
lw $s6, 0+readint_FRAMESIZE($sp)
addi $s6, $s6, -4
jal tigerGetchar
nop
move $s5, $v0
sw $s5, 0($s6)
j L20
nop

L47:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl skipto
skipto:
skipto_FRAMESIZE = 40
addi $sp,$sp,-40

L50:
sw $ra, -4+skipto_FRAMESIZE($sp)
sw $s7, -8+skipto_FRAMESIZE($sp)
sw $s6, -12+skipto_FRAMESIZE($sp)
sw $s5, -16+skipto_FRAMESIZE($sp)
sw $s4, -20+skipto_FRAMESIZE($sp)
sw $s3, -24+skipto_FRAMESIZE($sp)
sw $s2, -28+skipto_FRAMESIZE($sp)
sw $s1, -32+skipto_FRAMESIZE($sp)
sw $s0, -36+skipto_FRAMESIZE($sp)
sw $a0, 0+skipto_FRAMESIZE($sp)

L16:
lw $s7, 0+skipto_FRAMESIZE($sp)
lw $s7, 0($s7)
lw $s6, -4($s7)
la $s7, L9
beq $s6, $s7, L11
nop

L12:
li $s5, 1
lw $s7, 0+skipto_FRAMESIZE($sp)
lw $s7, 0($s7)
lw $s6, -4($s7)
la $s7, L10
beq $s6, $s7, L14
nop

L15:
li $s5, 0

L14:
move $s7, $s5

L13:
bne $zero, $s7, L17
nop

L8:
li $v0, 0
lw $s7, -8+skipto_FRAMESIZE($sp)
lw $s6, -12+skipto_FRAMESIZE($sp)
lw $s5, -16+skipto_FRAMESIZE($sp)
lw $s4, -20+skipto_FRAMESIZE($sp)
lw $s3, -24+skipto_FRAMESIZE($sp)
lw $s2, -28+skipto_FRAMESIZE($sp)
lw $s1, -32+skipto_FRAMESIZE($sp)
lw $s0, -36+skipto_FRAMESIZE($sp)
lw $ra, -4+skipto_FRAMESIZE($sp)
j L49
nop

L11:
li $s7, 1
j L13
nop

L17:
lw $s7, 0+skipto_FRAMESIZE($sp)
lw $s7, 0($s7)
addi $s7, $s7, -4
jal tigerGetchar
nop
move $s6, $v0
sw $s6, 0($s7)
j L16
nop

L49:
nop

addi $sp,$sp,40
jr $ra




.text
.align 2
.globl isdigit
isdigit:
isdigit_FRAMESIZE = 44
addi $sp,$sp,-44

L52:
sw $ra, -4+isdigit_FRAMESIZE($sp)
sw $s7, -8+isdigit_FRAMESIZE($sp)
sw $s6, -12+isdigit_FRAMESIZE($sp)
sw $s5, -16+isdigit_FRAMESIZE($sp)
sw $s4, -20+isdigit_FRAMESIZE($sp)
sw $s3, -24+isdigit_FRAMESIZE($sp)
sw $s2, -28+isdigit_FRAMESIZE($sp)
sw $s1, -32+isdigit_FRAMESIZE($sp)
sw $s0, -36+isdigit_FRAMESIZE($sp)
sw $a0, 0+isdigit_FRAMESIZE($sp)
move $s7, $a1
lw $s7, 0+isdigit_FRAMESIZE($sp)
lw $s7, 0($s7)
lw $s7, -4($s7)
move $a0, $s7
jal ord
nop
move $s7, $v0
move $s6, $s7
la $s7, L1
move $a0, $s7
jal ord
nop
move $s7, $v0
bge $s6, $s7, L3
nop

L4:
li $s7, 0

L5:
move $v0, $s7
lw $s7, -8+isdigit_FRAMESIZE($sp)
lw $s6, -12+isdigit_FRAMESIZE($sp)
lw $s5, -16+isdigit_FRAMESIZE($sp)
lw $s4, -20+isdigit_FRAMESIZE($sp)
lw $s3, -24+isdigit_FRAMESIZE($sp)
lw $s2, -28+isdigit_FRAMESIZE($sp)
lw $s1, -32+isdigit_FRAMESIZE($sp)
lw $s0, -36+isdigit_FRAMESIZE($sp)
lw $ra, -4+isdigit_FRAMESIZE($sp)
j L51
nop

L3:
li $s6, 1
lw $s7, 0+isdigit_FRAMESIZE($sp)
lw $s7, 0($s7)
lw $s7, -4($s7)
move $a0, $s7
jal ord
nop
move $s7, $v0
move $s7, $s7
la $s5, L2
move $a0, $s5
jal ord
nop
move $s5, $v0
ble $s7, $s5, L6
nop

L7:
li $s6, 0

L6:
move $s7, $s6
j L5
nop

L51:
nop

addi $sp,$sp,44
jr $ra




