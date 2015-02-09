main:		la $a0, value
			lw $a0, 0x0($a0)
			
			la $at, rightShift
			jalr $at, $ra
			
			halt

rightShift:	la $t0, x2
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

value:		.word 0xFF00

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
			.word 0x8000
			.word 0x0000
