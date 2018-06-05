
L3:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
li $s7, 0
li $s6, 1
li $s7, 2
li $s5, 3
li $s4, 4
li $s3, 5
li $s2, 6
li $s1, 7
li $s0, 8
li $t9, 9
li $t8, 10
li $t7, 11
li $t6, 12
li $t5, 13
li $t4, 14
li $t3, 15
li $t2, 16
li $t1, 17
li $t0, 18
li r120, 19
sw r120, -40+tigerMain_FRAMESIZE($sp)
li r121, 20
sw r121, -44+tigerMain_FRAMESIZE($sp)
li r122, 21
sw r122, -48+tigerMain_FRAMESIZE($sp)
li r123, 22
sw r123, -52+tigerMain_FRAMESIZE($sp)
li r124, 23
sw r124, -56+tigerMain_FRAMESIZE($sp)
li r125, 24
sw r125, -60+tigerMain_FRAMESIZE($sp)
li r126, 25
sw r126, -64+tigerMain_FRAMESIZE($sp)
li r127, 26
sw r127, -68+tigerMain_FRAMESIZE($sp)
li r128, 27
sw r128, -72+tigerMain_FRAMESIZE($sp)
li r129, 28
sw r129, -76+tigerMain_FRAMESIZE($sp)
li r130, 29
sw r130, -80+tigerMain_FRAMESIZE($sp)
li r131, 30
sw r131, -84+tigerMain_FRAMESIZE($sp)
li r132, 31
sw r132, -88+tigerMain_FRAMESIZE($sp)
li r133, 32
sw r133, -92+tigerMain_FRAMESIZE($sp)
li r134, 33
sw r134, -96+tigerMain_FRAMESIZE($sp)
li r135, 34
sw r135, -100+tigerMain_FRAMESIZE($sp)
li r136, 35
sw r136, -104+tigerMain_FRAMESIZE($sp)
li r137, 36
sw r137, -108+tigerMain_FRAMESIZE($sp)
li r138, 37
sw r138, -112+tigerMain_FRAMESIZE($sp)
li r139, 38
sw r139, -116+tigerMain_FRAMESIZE($sp)
li r140, 39
sw r140, -120+tigerMain_FRAMESIZE($sp)
li r141, 40
sw r141, -124+tigerMain_FRAMESIZE($sp)
li r142, 41
sw r142, -128+tigerMain_FRAMESIZE($sp)
li r143, 42
sw r143, -132+tigerMain_FRAMESIZE($sp)
li r144, 43
sw r144, -136+tigerMain_FRAMESIZE($sp)
li r145, 44
sw r145, -140+tigerMain_FRAMESIZE($sp)
li r146, 45
sw r146, -144+tigerMain_FRAMESIZE($sp)
li r147, 46
sw r147, -148+tigerMain_FRAMESIZE($sp)
li r148, 47
sw r148, -152+tigerMain_FRAMESIZE($sp)
li r149, 48
sw r149, -156+tigerMain_FRAMESIZE($sp)
li r150, 49
sw r150, -160+tigerMain_FRAMESIZE($sp)
li r151, 50
sw r151, -164+tigerMain_FRAMESIZE($sp)
li r152, 51
sw r152, -168+tigerMain_FRAMESIZE($sp)
li r153, 52
sw r153, -172+tigerMain_FRAMESIZE($sp)
li r154, 53
sw r154, -176+tigerMain_FRAMESIZE($sp)
li r155, 54
sw r155, -180+tigerMain_FRAMESIZE($sp)
li r156, 55
sw r156, -184+tigerMain_FRAMESIZE($sp)
li r157, 56
sw r157, -188+tigerMain_FRAMESIZE($sp)
li r158, 57
sw r158, -192+tigerMain_FRAMESIZE($sp)
li r159, 58
sw r159, -196+tigerMain_FRAMESIZE($sp)
li r160, 59
sw r160, -200+tigerMain_FRAMESIZE($sp)
li r161, 60
sw r161, -204+tigerMain_FRAMESIZE($sp)
li r162, 61
sw r162, -208+tigerMain_FRAMESIZE($sp)
li r163, 62
sw r163, -212+tigerMain_FRAMESIZE($sp)
li r164, 63
sw r164, -216+tigerMain_FRAMESIZE($sp)
li r165, 64
sw r165, -220+tigerMain_FRAMESIZE($sp)
li r166, 65
sw r166, -224+tigerMain_FRAMESIZE($sp)
li r167, 66
sw r167, -228+tigerMain_FRAMESIZE($sp)
li r168, 67
sw r168, -232+tigerMain_FRAMESIZE($sp)
li r169, 68
sw r169, -236+tigerMain_FRAMESIZE($sp)
li r170, 69
sw r170, -240+tigerMain_FRAMESIZE($sp)
li r171, 70
sw r171, -244+tigerMain_FRAMESIZE($sp)
li r172, 71
sw r172, -248+tigerMain_FRAMESIZE($sp)
li r173, 72
sw r173, -252+tigerMain_FRAMESIZE($sp)
li r174, 73
sw r174, -256+tigerMain_FRAMESIZE($sp)
li r175, 74
sw r175, -260+tigerMain_FRAMESIZE($sp)
li r176, 75
sw r176, -264+tigerMain_FRAMESIZE($sp)
li r177, 76
sw r177, -268+tigerMain_FRAMESIZE($sp)
li r178, 77
sw r178, -272+tigerMain_FRAMESIZE($sp)
li r179, 78
sw r179, -276+tigerMain_FRAMESIZE($sp)
li r180, 79
sw r180, -280+tigerMain_FRAMESIZE($sp)
li r181, 80
sw r181, -284+tigerMain_FRAMESIZE($sp)
li r182, 81
sw r182, -288+tigerMain_FRAMESIZE($sp)
li r183, 82
sw r183, -292+tigerMain_FRAMESIZE($sp)
li r184, 83
sw r184, -296+tigerMain_FRAMESIZE($sp)
li r185, 84
sw r185, -300+tigerMain_FRAMESIZE($sp)
li r186, 85
sw r186, -304+tigerMain_FRAMESIZE($sp)
li r187, 86
sw r187, -308+tigerMain_FRAMESIZE($sp)
li r188, 87
sw r188, -312+tigerMain_FRAMESIZE($sp)
li r189, 88
sw r189, -316+tigerMain_FRAMESIZE($sp)
li r190, 89
sw r190, -320+tigerMain_FRAMESIZE($sp)
li r191, 90
sw r191, -324+tigerMain_FRAMESIZE($sp)
li r192, 91
sw r192, -328+tigerMain_FRAMESIZE($sp)
li r193, 92
sw r193, -332+tigerMain_FRAMESIZE($sp)
li r194, 93
sw r194, -336+tigerMain_FRAMESIZE($sp)
li r195, 94
sw r195, -340+tigerMain_FRAMESIZE($sp)
li r196, 95
sw r196, -344+tigerMain_FRAMESIZE($sp)
li r197, 96
sw r197, -348+tigerMain_FRAMESIZE($sp)
li r198, 97
sw r198, -352+tigerMain_FRAMESIZE($sp)
li r199, 98
sw r199, -356+tigerMain_FRAMESIZE($sp)
li r200, 99
sw r200, -360+tigerMain_FRAMESIZE($sp)
li r201, 100
sw r201, -364+tigerMain_FRAMESIZE($sp)
add $s7, $s6, $s7
add $s7, $s7, $s5
add $s7, $s7, $s4
add $s7, $s7, $s3
add $s7, $s7, $s2
add $s7, $s7, $s1
add $s7, $s7, $s0
add $s7, $s7, $t9
add $s7, $s7, $t8
add $s7, $s7, $t7
add $s7, $s7, $t6
add $s7, $s7, $t5
add $s7, $s7, $t4
add $s7, $s7, $t3
add $s7, $s7, $t2
add $s7, $s7, $t1
add $s7, $s7, $t0
lw r328, -40+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r328
lw r329, -44+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r329
lw r330, -48+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r330
lw r331, -52+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r331
lw r332, -56+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r332
lw r333, -60+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r333
lw r334, -64+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r334
lw r335, -68+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r335
lw r336, -72+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r336
lw r337, -76+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r337
lw r338, -80+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r338
lw r339, -84+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r339
lw r340, -88+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r340
lw r341, -92+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r341
lw r342, -96+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r342
lw r343, -100+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r343
lw r344, -104+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r344
lw r345, -108+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r345
lw r346, -112+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r346
lw r347, -116+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r347
lw r348, -120+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r348
lw r349, -124+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r349
lw r350, -128+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r350
lw r351, -132+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r351
lw r352, -136+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r352
lw r353, -140+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r353
lw r354, -144+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r354
lw r355, -148+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r355
lw r356, -152+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r356
lw r357, -156+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r357
lw r358, -160+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r358
lw r359, -164+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r359
lw r360, -168+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r360
lw r361, -172+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r361
lw r362, -176+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r362
lw r363, -180+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r363
lw r364, -184+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r364
lw r365, -188+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r365
lw r366, -192+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r366
lw r367, -196+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r367
lw r368, -200+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r368
lw r369, -204+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r369
lw r370, -208+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r370
lw r371, -212+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r371
lw r372, -216+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r372
lw r373, -220+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r373
lw r374, -224+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r374
lw r375, -228+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r375
lw r376, -232+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r376
lw r377, -236+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r377
lw r378, -240+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r378
lw r379, -244+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r379
lw r380, -248+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r380
lw r381, -252+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r381
lw r382, -256+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r382
lw r383, -260+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r383
lw r384, -264+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r384
lw r385, -268+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r385
lw r386, -272+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r386
lw r387, -276+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r387
lw r388, -280+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r388
lw r389, -284+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r389
lw r390, -288+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r390
lw r391, -292+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r391
lw r392, -296+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r392
lw r393, -300+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r393
lw r394, -304+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r394
lw r395, -308+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r395
lw r396, -312+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r396
lw r397, -316+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r397
lw r398, -320+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r398
lw r399, -324+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r399
lw r400, -328+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r400
lw r401, -332+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r401
lw r402, -336+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r402
lw r403, -340+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r403
lw r404, -344+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r404
lw r405, -348+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r405
lw r406, -352+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r406
lw r407, -356+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r407
lw r408, -360+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r408
lw r409, -364+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r409
move $s7, $s7
move $a0, $s7
jal printInt
nop
la $s7, L1
move $a0, $s7
jal printStr
nop
move $v0, $v0
lw $s7, -8+tigerMain_FRAMESIZE($sp)
lw $s6, -12+tigerMain_FRAMESIZE($sp)
lw $s5, -16+tigerMain_FRAMESIZE($sp)
lw $s4, -20+tigerMain_FRAMESIZE($sp)
lw $s3, -24+tigerMain_FRAMESIZE($sp)
lw $s2, -28+tigerMain_FRAMESIZE($sp)
lw $s1, -32+tigerMain_FRAMESIZE($sp)
lw $s0, -36+tigerMain_FRAMESIZE($sp)
lw $ra, -4+tigerMain_FRAMESIZE($sp)
j L2
nop

L2:
nop


--------

L3:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
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
li r119, 18
sw r119, -368+tigerMain_FRAMESIZE($sp)
li $t2, 19
sw $t2, -40+tigerMain_FRAMESIZE($sp)
li $t2, 20
sw $t2, -44+tigerMain_FRAMESIZE($sp)
li $t2, 21
sw $t2, -48+tigerMain_FRAMESIZE($sp)
li $t2, 22
sw $t2, -52+tigerMain_FRAMESIZE($sp)
li $t2, 23
sw $t2, -56+tigerMain_FRAMESIZE($sp)
li $t2, 24
sw $t2, -60+tigerMain_FRAMESIZE($sp)
li $t2, 25
sw $t2, -64+tigerMain_FRAMESIZE($sp)
li $t2, 26
sw $t2, -68+tigerMain_FRAMESIZE($sp)
li $t2, 27
sw $t2, -72+tigerMain_FRAMESIZE($sp)
li $t2, 28
sw $t2, -76+tigerMain_FRAMESIZE($sp)
li $t2, 29
sw $t2, -80+tigerMain_FRAMESIZE($sp)
li $t2, 30
sw $t2, -84+tigerMain_FRAMESIZE($sp)
li $t2, 31
sw $t2, -88+tigerMain_FRAMESIZE($sp)
li $t2, 32
sw $t2, -92+tigerMain_FRAMESIZE($sp)
li $t2, 33
sw $t2, -96+tigerMain_FRAMESIZE($sp)
li $t2, 34
sw $t2, -100+tigerMain_FRAMESIZE($sp)
li $t2, 35
sw $t2, -104+tigerMain_FRAMESIZE($sp)
li $t2, 36
sw $t2, -108+tigerMain_FRAMESIZE($sp)
li $t2, 37
sw $t2, -112+tigerMain_FRAMESIZE($sp)
li $t2, 38
sw $t2, -116+tigerMain_FRAMESIZE($sp)
li $t2, 39
sw $t2, -120+tigerMain_FRAMESIZE($sp)
li $t2, 40
sw $t2, -124+tigerMain_FRAMESIZE($sp)
li $t2, 41
sw $t2, -128+tigerMain_FRAMESIZE($sp)
li $t2, 42
sw $t2, -132+tigerMain_FRAMESIZE($sp)
li $t2, 43
sw $t2, -136+tigerMain_FRAMESIZE($sp)
li $t2, 44
sw $t2, -140+tigerMain_FRAMESIZE($sp)
li $t2, 45
sw $t2, -144+tigerMain_FRAMESIZE($sp)
li $t2, 46
sw $t2, -148+tigerMain_FRAMESIZE($sp)
li $t2, 47
sw $t2, -152+tigerMain_FRAMESIZE($sp)
li $t2, 48
sw $t2, -156+tigerMain_FRAMESIZE($sp)
li $t2, 49
sw $t2, -160+tigerMain_FRAMESIZE($sp)
li $t2, 50
sw $t2, -164+tigerMain_FRAMESIZE($sp)
li $t2, 51
sw $t2, -168+tigerMain_FRAMESIZE($sp)
li $t2, 52
sw $t2, -172+tigerMain_FRAMESIZE($sp)
li $t2, 53
sw $t2, -176+tigerMain_FRAMESIZE($sp)
li $t2, 54
sw $t2, -180+tigerMain_FRAMESIZE($sp)
li $t2, 55
sw $t2, -184+tigerMain_FRAMESIZE($sp)
li $t2, 56
sw $t2, -188+tigerMain_FRAMESIZE($sp)
li $t2, 57
sw $t2, -192+tigerMain_FRAMESIZE($sp)
li $t2, 58
sw $t2, -196+tigerMain_FRAMESIZE($sp)
li $t2, 59
sw $t2, -200+tigerMain_FRAMESIZE($sp)
li $t2, 60
sw $t2, -204+tigerMain_FRAMESIZE($sp)
li $t2, 61
sw $t2, -208+tigerMain_FRAMESIZE($sp)
li $t2, 62
sw $t2, -212+tigerMain_FRAMESIZE($sp)
li $t2, 63
sw $t2, -216+tigerMain_FRAMESIZE($sp)
li $t2, 64
sw $t2, -220+tigerMain_FRAMESIZE($sp)
li $t2, 65
sw $t2, -224+tigerMain_FRAMESIZE($sp)
li $t2, 66
sw $t2, -228+tigerMain_FRAMESIZE($sp)
li $t2, 67
sw $t2, -232+tigerMain_FRAMESIZE($sp)
li $t2, 68
sw $t2, -236+tigerMain_FRAMESIZE($sp)
li $t2, 69
sw $t2, -240+tigerMain_FRAMESIZE($sp)
li $t2, 70
sw $t2, -244+tigerMain_FRAMESIZE($sp)
li $t2, 71
sw $t2, -248+tigerMain_FRAMESIZE($sp)
li $t2, 72
sw $t2, -252+tigerMain_FRAMESIZE($sp)
li $t2, 73
sw $t2, -256+tigerMain_FRAMESIZE($sp)
li $t2, 74
sw $t2, -260+tigerMain_FRAMESIZE($sp)
li $t2, 75
sw $t2, -264+tigerMain_FRAMESIZE($sp)
li $t2, 76
sw $t2, -268+tigerMain_FRAMESIZE($sp)
li $t2, 77
sw $t2, -272+tigerMain_FRAMESIZE($sp)
li $t2, 78
sw $t2, -276+tigerMain_FRAMESIZE($sp)
li $t2, 79
sw $t2, -280+tigerMain_FRAMESIZE($sp)
li $t2, 80
sw $t2, -284+tigerMain_FRAMESIZE($sp)
li $t2, 81
sw $t2, -288+tigerMain_FRAMESIZE($sp)
li $t2, 82
sw $t2, -292+tigerMain_FRAMESIZE($sp)
li $t2, 83
sw $t2, -296+tigerMain_FRAMESIZE($sp)
li $t2, 84
sw $t2, -300+tigerMain_FRAMESIZE($sp)
li $t2, 85
sw $t2, -304+tigerMain_FRAMESIZE($sp)
li $t2, 86
sw $t2, -308+tigerMain_FRAMESIZE($sp)
li $t2, 87
sw $t2, -312+tigerMain_FRAMESIZE($sp)
li $t2, 88
sw $t2, -316+tigerMain_FRAMESIZE($sp)
li $t2, 89
sw $t2, -320+tigerMain_FRAMESIZE($sp)
li $t2, 90
sw $t2, -324+tigerMain_FRAMESIZE($sp)
li $t2, 91
sw $t2, -328+tigerMain_FRAMESIZE($sp)
li $t2, 92
sw $t2, -332+tigerMain_FRAMESIZE($sp)
li $t2, 93
sw $t2, -336+tigerMain_FRAMESIZE($sp)
li $t2, 94
sw $t2, -340+tigerMain_FRAMESIZE($sp)
li $t2, 95
sw $t2, -344+tigerMain_FRAMESIZE($sp)
li $t2, 96
sw $t2, -348+tigerMain_FRAMESIZE($sp)
li $t2, 97
sw $t2, -352+tigerMain_FRAMESIZE($sp)
li $t2, 98
sw $t2, -356+tigerMain_FRAMESIZE($sp)
li $t2, 99
sw $t2, -360+tigerMain_FRAMESIZE($sp)
li $t2, 100
sw $t2, -364+tigerMain_FRAMESIZE($sp)
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
add $s7, $s7, $t0
lw r410, -368+tigerMain_FRAMESIZE($sp)
add $s6, $s7, r410
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
add $s6, $s6, $s7
lw $s7, -332+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -336+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -340+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -344+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -348+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -352+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -356+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -360+tigerMain_FRAMESIZE($sp)
add $s6, $s6, $s7
lw $s7, -364+tigerMain_FRAMESIZE($sp)
add $s7, $s6, $s7
move $s7, $s7
move $a0, $s7
jal printInt
nop
la $s7, L1
move $a0, $s7
jal printStr
nop
move $v0, $v0
lw $s7, -8+tigerMain_FRAMESIZE($sp)
lw $s6, -12+tigerMain_FRAMESIZE($sp)
lw $s5, -16+tigerMain_FRAMESIZE($sp)
lw $s4, -20+tigerMain_FRAMESIZE($sp)
lw $s3, -24+tigerMain_FRAMESIZE($sp)
lw $s2, -28+tigerMain_FRAMESIZE($sp)
lw $s1, -32+tigerMain_FRAMESIZE($sp)
lw $s0, -36+tigerMain_FRAMESIZE($sp)
lw $ra, -4+tigerMain_FRAMESIZE($sp)
j L2
nop

L2:
nop


--------
