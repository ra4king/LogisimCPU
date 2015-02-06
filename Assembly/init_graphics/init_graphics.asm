! Roi Atalla
! 5 February, 2015

main:		la $s0, gmem
			lw $s0, 0x0($s0)
			
			la $s1, gclear
			lw $s1, 0x0($s1)
			
			la $s2, gsize
			lw $s2, 0x0($s2)

start:		sw $zero, 0x0($s1)

			la $t0, data1
			lw $t0, 0x0($t0)
			
			add $t1, $zero, $zero
			
loop1:		beq $t1, $s2, finish1
			add $t2, $s0, $t1
			sw $t0, 0x0($t2)
			addi $t1, $t1, 1
			beq $zero, $zero, loop1
			
finish1:	la $t0, data2
			lw $t0, 0x0($t0)
			
			add $t1, $zero, $zero
			
loop2:		beq $t1, $s2, finish2
			add $t2, $s0, $t1
			sw $t0, 0x0($t2)
			addi $t1, $t1, 1
			beq $zero, $zero, loop2
			
finish2:	la $t0, start
			jalr $t0, $zero


gmem:		.word 0xFFC0
gclear:		.word 0xFFBF
gsize:		.word 0x40
data1:		.word 0xAAAA
data2:		.word 0x5555
