!============================================================
! CS-2200 Homework 1
! 
! Roi Atalla
! CS 2200 - Spring 2015
! Jay Summet
! 26 January, 2015
!
! Please do not change main's functionality, 
! except to change the argument for factorial or to meet your 
! calling convention
!============================================================

main:       la $sp, stack				! load address of stack label into $sp
            lw $sp, 0($sp)

            la $at, factorial	        ! load address of factorial label into $at
            addi $a0, $zero, 6 	        ! $a0 = 5, the number to factorialize
            jalr $at, $ra				! jump to factorial, set $ra to return addr
            halt						! when we return, just halt

factorial:  addi $sp, $sp, -1
			sw $ra, 0($sp)				! store the return address on the stack

			beq $a0, $zero, argZero		! If the argument is 0, we're done

			addi $a0, $a0, -1
			addi $sp, $sp, -1
			sw $a0, 0($sp)				! subtract 1 from the argument and store it on the stack
			
			la $at, factorial
			jalr $at, $ra				! call factorial with the new argument

			lw $t0, 0($sp)				! load the saved argument from the top of the stack to $t0
			add $t1, $v0, $zero			! copy the return value into $t1
			beq $zero, $zero, mult
			
argZero: 	addi $v0, $zero, 1			! Return 1
			beq $zero, $zero, return

mult:		beq $t0, $zero, multDone	! keep looping around until $t0 equals zero
			add $v0, $v0, $t1			! if $t0 isn't zero, add $t1 to the return value.	
			addi $t0, $t0, -1			! decrement $t0
			beq $zero, $zero, mult

multDone:	addi $sp, $sp, 1			! increment the stack to 'deallocate' the 1 local variable used

return:		lw $ra, 0($sp)
			addi $sp, $sp, 1			! load $ra and 'deallocate' it from the stack
			jalr $ra, $zero

stack:	    .word 0x4000
