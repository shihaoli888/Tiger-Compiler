.data
.align 2
L1:
.word 2
.ascii "\n"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 8
addi $sp,$sp,-8

L3:
move $t9, $ra
sw $t9, -364+tigerMain_FRAMESIZE($sp)
move $s7, $s7
sw $s7, -332+tigerMain_FRAMESIZE($sp)
move $s7, $s6
sw $s7, -336+tigerMain_FRAMESIZE($sp)
move $s7, $s5
sw $s7, -340+tigerMain_FRAMESIZE($sp)
move $s7, $s4
sw $s7, -344+tigerMain_FRAMESIZE($sp)
move $s7, $s3
sw $s7, -348+tigerMain_FRAMESIZE($sp)
move $s7, $s2
sw $s7, -352+tigerMain_FRAMESIZE($sp)
move $s7, $s1
sw $s7, -356+tigerMain_FRAMESIZE($sp)
move $s7, $s0
sw $s7, -360+tigerMain_FRAMESIZE($sp)
li $s7, 0
li $t4, 1
li $t3, 2
li $t5, 3
li $t6, 4
li $t7, 5
li $t8, 6
li $t9, 7
li $s0, 8
li $s1, 9
li $s2, 10
li $s3, 11
li $s4, 12
li $s5, 13
li $s6, 14
li $s7, 15
li $t1, 16
li $t0, 17
li $t2, 18
sw $t2, -368+tigerMain_FRAMESIZE($sp)
li $t2, 19
sw $t2, -4+tigerMain_FRAMESIZE($sp)
li $t2, 20
sw $t2, -8+tigerMain_FRAMESIZE($sp)
li $t2, 21
sw $t2, -12+tigerMain_FRAMESIZE($sp)
li $t2, 22
sw $t2, -16+tigerMain_FRAMESIZE($sp)
li $t2, 23
sw $t2, -20+tigerMain_FRAMESIZE($sp)
li $t2, 24
sw $t2, -24+tigerMain_FRAMESIZE($sp)
li $t2, 25
sw $t2, -28+tigerMain_FRAMESIZE($sp)
li $t2, 26
sw $t2, -32+tigerMain_FRAMESIZE($sp)
li $t2, 27
sw $t2, -36+tigerMain_FRAMESIZE($sp)
li $t2, 28
sw $t2, -40+tigerMain_FRAMESIZE($sp)
li $t2, 29
sw $t2, -44+tigerMain_FRAMESIZE($sp)
li $t2, 30
sw $t2, -48+tigerMain_FRAMESIZE($sp)
li $t2, 31
sw $t2, -52+tigerMain_FRAMESIZE($sp)
li $t2, 32
sw $t2, -56+tigerMain_FRAMESIZE($sp)
li $t2, 33
sw $t2, -60+tigerMain_FRAMESIZE($sp)
li $t2, 34
sw $t2, -64+tigerMain_FRAMESIZE($sp)
li $t2, 35
sw $t2, -68+tigerMain_FRAMESIZE($sp)
li $t2, 36
sw $t2, -72+tigerMain_FRAMESIZE($sp)
li $t2, 37
sw $t2, -76+tigerMain_FRAMESIZE($sp)
li $t2, 38
sw $t2, -80+tigerMain_FRAMESIZE($sp)
li $t2, 39
sw $t2, -84+tigerMain_FRAMESIZE($sp)
li $t2, 40
sw $t2, -88+tigerMain_FRAMESIZE($sp)
li $t2, 41
sw $t2, -92+tigerMain_FRAMESIZE($sp)
li $t2, 42
sw $t2, -96+tigerMain_FRAMESIZE($sp)
li $t2, 43
sw $t2, -100+tigerMain_FRAMESIZE($sp)
li $t2, 44
sw $t2, -104+tigerMain_FRAMESIZE($sp)
li $t2, 45
sw $t2, -108+tigerMain_FRAMESIZE($sp)
li $t2, 46
sw $t2, -112+tigerMain_FRAMESIZE($sp)
li $t2, 47
sw $t2, -116+tigerMain_FRAMESIZE($sp)
li $t2, 48
sw $t2, -120+tigerMain_FRAMESIZE($sp)
li $t2, 49
sw $t2, -124+tigerMain_FRAMESIZE($sp)
li $t2, 50
sw $t2, -128+tigerMain_FRAMESIZE($sp)
li $t2, 51
sw $t2, -132+tigerMain_FRAMESIZE($sp)
li $t2, 52
sw $t2, -136+tigerMain_FRAMESIZE($sp)
li $t2, 53
sw $t2, -140+tigerMain_FRAMESIZE($sp)
li $t2, 54
sw $t2, -144+tigerMain_FRAMESIZE($sp)
li $t2, 55
sw $t2, -148+tigerMain_FRAMESIZE($sp)
li $t2, 56
sw $t2, -152+tigerMain_FRAMESIZE($sp)
li $t2, 57
sw $t2, -156+tigerMain_FRAMESIZE($sp)
li $t2, 58
sw $t2, -160+tigerMain_FRAMESIZE($sp)
li $t2, 59
sw $t2, -164+tigerMain_FRAMESIZE($sp)
li $t2, 60
sw $t2, -168+tigerMain_FRAMESIZE($sp)
li $t2, 61
sw $t2, -172+tigerMain_FRAMESIZE($sp)
li $t2, 62
sw $t2, -176+tigerMain_FRAMESIZE($sp)
li $t2, 63
sw $t2, -180+tigerMain_FRAMESIZE($sp)
li $t2, 64
sw $t2, -184+tigerMain_FRAMESIZE($sp)
li $t2, 65
sw $t2, -188+tigerMain_FRAMESIZE($sp)
li $t2, 66
sw $t2, -192+tigerMain_FRAMESIZE($sp)
li $t2, 67
sw $t2, -196+tigerMain_FRAMESIZE($sp)
li $t2, 68
sw $t2, -200+tigerMain_FRAMESIZE($sp)
li $t2, 69
sw $t2, -204+tigerMain_FRAMESIZE($sp)
li $t2, 70
sw $t2, -208+tigerMain_FRAMESIZE($sp)
li $t2, 71
sw $t2, -212+tigerMain_FRAMESIZE($sp)
li $t2, 72
sw $t2, -216+tigerMain_FRAMESIZE($sp)
li $t2, 73
sw $t2, -220+tigerMain_FRAMESIZE($sp)
li $t2, 74
sw $t2, -224+tigerMain_FRAMESIZE($sp)
li $t2, 75
sw $t2, -228+tigerMain_FRAMESIZE($sp)
li $t2, 76
sw $t2, -232+tigerMain_FRAMESIZE($sp)
li $t2, 77
sw $t2, -236+tigerMain_FRAMESIZE($sp)
li $t2, 78
sw $t2, -240+tigerMain_FRAMESIZE($sp)
li $t2, 79
sw $t2, -244+tigerMain_FRAMESIZE($sp)
li $t2, 80
sw $t2, -248+tigerMain_FRAMESIZE($sp)
li $t2, 81
sw $t2, -252+tigerMain_FRAMESIZE($sp)
li $t2, 82
sw $t2, -256+tigerMain_FRAMESIZE($sp)
li $t2, 83
sw $t2, -260+tigerMain_FRAMESIZE($sp)
li $t2, 84
sw $t2, -264+tigerMain_FRAMESIZE($sp)
li $t2, 85
sw $t2, -268+tigerMain_FRAMESIZE($sp)
li $t2, 86
sw $t2, -272+tigerMain_FRAMESIZE($sp)
li $t2, 87
sw $t2, -276+tigerMain_FRAMESIZE($sp)
li $t2, 88
sw $t2, -280+tigerMain_FRAMESIZE($sp)
li $t2, 89
sw $t2, -284+tigerMain_FRAMESIZE($sp)
li $t2, 90
sw $t2, -288+tigerMain_FRAMESIZE($sp)
li $t2, 91
sw $t2, -292+tigerMain_FRAMESIZE($sp)
li $t2, 92
sw $t2, -296+tigerMain_FRAMESIZE($sp)
li $t2, 93
sw $t2, -300+tigerMain_FRAMESIZE($sp)
li $t2, 94
sw $t2, -304+tigerMain_FRAMESIZE($sp)
li $t2, 95
sw $t2, -308+tigerMain_FRAMESIZE($sp)
li $t2, 96
sw $t2, -312+tigerMain_FRAMESIZE($sp)
li $t2, 97
sw $t2, -316+tigerMain_FRAMESIZE($sp)
li $t2, 98
sw $t2, -320+tigerMain_FRAMESIZE($sp)
li $t2, 99
sw $t2, -324+tigerMain_FRAMESIZE($sp)
li $t2, 100
sw $t2, -328+tigerMain_FRAMESIZE($sp)
add $t4, $t4, $t3
add $t5, $t4, $t5
add $t6, $t5, $t6
add $t7, $t6, $t7
add $t8, $t7, $t8
add $t9, $t8, $t9
add $s0, $t9, $s0
add $s1, $s0, $s1
add $s2, $s1, $s2
add $s3, $s2, $s3
add $s4, $s3, $s4
add $s5, $s4, $s5
add $s6, $s5, $s6
add $s7, $s6, $s7
add $s7, $s7, $t1
add $s6, $s7, $t0
lw $s7, -368+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -4+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -8+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -12+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -16+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -20+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -24+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -28+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -32+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -36+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -40+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -44+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -48+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -52+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -56+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -60+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -64+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -68+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -72+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -76+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -80+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -84+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -88+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -92+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -96+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -100+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -104+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -108+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -112+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -116+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -120+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -124+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -128+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -132+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -136+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -140+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -144+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -148+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -152+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -156+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -160+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -164+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -168+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -172+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -176+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -180+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -184+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -188+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -192+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -196+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -200+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -204+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -208+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -212+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -216+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -220+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -224+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -228+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -232+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -236+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -240+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -244+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -248+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -252+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -256+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -260+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -264+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -268+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -272+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -276+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -280+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -284+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -288+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -292+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -296+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -300+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -304+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -308+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -312+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -316+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -320+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -324+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -328+tigerMain_FRAMESIZE($sp)
add $s7, $s6, $s7
move $s7, $s7
move $a0, $s7
jal printInt
nop
la $s7, L1
move $a0, $s7
jal printStr
nop
li $v0, 0
lw $s7, -332+tigerMain_FRAMESIZE($sp)
move $s7, $s7
lw $s6, -336+tigerMain_FRAMESIZE($sp)
move $s6, $s6
lw $s5, -340+tigerMain_FRAMESIZE($sp)
move $s5, $s5
lw $s4, -344+tigerMain_FRAMESIZE($sp)
move $s4, $s4
lw $s3, -348+tigerMain_FRAMESIZE($sp)
move $s3, $s3
lw $s2, -352+tigerMain_FRAMESIZE($sp)
move $s2, $s2
lw $s1, -356+tigerMain_FRAMESIZE($sp)
move $s1, $s1
lw $s0, -360+tigerMain_FRAMESIZE($sp)
move $s0, $s0
lw $t9, -364+tigerMain_FRAMESIZE($sp)
move $ra, $t9
j L2
nop

L2:
nop

addi $sp,$sp,8
jr $ra




