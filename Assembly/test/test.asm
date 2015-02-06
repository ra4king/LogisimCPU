		addi $s0, $zero, 5
		add $s1, $zero, $zero
		
loop:	beq $s0, $zero, end
		
		addi $s0, $s0, -1
		addi $s1, $s1, 1
		
		beq $zero, $zero, loop
		
end:	halt
