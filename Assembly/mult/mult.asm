main:		la $sp, stack
			lw $sp, 0x0($sp)
			
			addi $a0, $zero, 12
			addi $a1, $zero, 15
			la $at, mult
			jalr $at, $ra
			
			halt
			
mult:		add $v0, $zero, $zero
			add $t0, $zero, $a0
			
loop:		beq	$a1, $zero, done
			add $v0, $v0, $t0
			addi $a1, $a1, -1
			beq $zero, $zero, loop

done:		jalr $ra, $zero

stack:	    .word 0x4000
