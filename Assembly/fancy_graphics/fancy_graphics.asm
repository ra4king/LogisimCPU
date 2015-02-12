! Roi Atalla
! February 6, 2015

main:		la $sp, stack
			lw $sp, 0x0($sp)

			la $s0, gmem
			lw $s0, 0x0($s0)
			
			la $s1, square1
			lw $s1, 0x0($s1)
			
			la $s2, square2
			lw $s2, 0x0($s2)
			
			addi $a1, $zero, 2
			
			add $t2, $zero, $zero
			
start:		la $t0, gclear
			lw $t0, 0x0($t0)
			sw $zero, 0x0($t0)
			
			la $t0, squarepos
			lw $t0, 0x0($t0)
			add $t0, $t0, $t2
			
			la $t1, squareend
			lw $t1, 0x0($t1)
			add $t1, $t1, $t2
			
			la $a0, gsize
			lw $a0, 0x0($a0)
			
			beq $t1, $a0, changeDir1
			beq $t0, $zero, changeDir2
			beq $zero, $zero, draw
			
changeDir1:	addi $a1, $zero, -2
			beq $zero, $zero, draw
			
changeDir2: addi $a1, $zero, 2
			
draw:		add $t0, $t0, $s0
			add $t1, $t1, $s0
			
loop:		beq $t0, $t1, finish
			sw $s1, 0x0($t0)
			sw $s2, 0x1($t0)
			addi $t0, $t0, 2
			beq $zero, $zero, loop
			
finish:		add $t2, $t2, $a1

			addi $sp, $sp, -1
			sw $t2, 0x0($sp)
			
			la $at, rightShift
			add $a0, $zero, $s1
			jalr $at, $ra
			add $s1, $zero, $v0
			
			add $a0, $zero, $s2
			jalr $at, $ra
			add $s2, $zero, $v0
			
			lw $t0, 0x0($sp)
			addi $sp, $sp, 1
			add $s1, $s1, $t0
			
			lw $t0, 0x0($sp)
			addi $sp, $sp, 1
			add $s2, $s2, $t0
			
			lw $t2, 0x0($sp)
			addi $sp, $sp, 1
			
			la $t0, gflip
			lw $t0, 0x0($t0)
			sw $zero, 0x0($t0)
			
			la $at, start
			jalr $at, $zero
			
rightShift:	la $t0, x1
			lw $t1, 0x0($t0)
			
			addi $sp, $sp, -1
			
			nand $t2, $a0, $t1
			nand $t2, $t2, $t2
			beq $t2, $t1, rsOverflow
			
			sw $zero, 0x0($sp)
			beq $zero, $zero, rsStart
			
rsOverflow:	la $t0, x8000
			lw $t1, 0x0($t0)
			sw $t1, 0x0($sp)
			
rsStart:	la $t0, x2
			lw $t1, 0x0($t0)
			add $v0, $zero, $zero
			
rsLoop:		nand $t2, $a0, $t1
			nand $t2, $t2, $t2
			beq $t2, $t1, addRight
			
rsContinue:	addi $t0, $t0, 1
			lw $t1, 0x0($t0)
			beq $t1, $zero, rsDone
			beq $zero, $zero, rsLoop
			
addRight:	addi $t0, $t0, -1
			lw $t1, 0x0($t0)
			add $v0, $v0, $t1
			addi $t0, $t0, 1
			beq $zero, $zero, rsContinue
			
rsDone:		jalr $ra, $zero
			
done:		halt
			
gclear:		.word 0xFFBE
gflip:		.word 0xFFBF
gmem:		.word 0xFFC0
gmemlast:	.word 0xFFFD
gsize:		.word 0x40
square1:	.word 0x000F
square2:	.word 0xF000
squarepos:	.word 0x18
squareend:	.word 0x28

stack:		.word 0x4000

x1:			.word 0x1
x2:			.word 0x2
			.word 0x4
			.word 0x8
			.word 0x10
			.word 0x20
			.word 0x40
			.word 0x80
			.word 0x100
			.word 0x200
			.word 0x400
			.word 0x800
			.word 0x1000
			.word 0x2000
			.word 0x4000
x8000:		.word 0x8000
			.word 0x0000
