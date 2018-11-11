#Main function
addi a0,x0,100 #store n=100 in a0(x10)
jal ra,SIGMA #call Sigma
beq x0,x0,END #loop to END


SIGMA:
	addi sp, sp, -8	#push 8 bytes of memory into stack
	sw, ra, 4(sp)		#store at an offset of four from the stack pointer
	sw, a0, 0(sp)		#store at an offset of zero from the stack pointer
	addi t0, a0, -1 #store n-1 into t0 so that bne operator can be used with x0.
	bne t0, x0, cond1	#checks if n-1 is not equal to zero(This is the same as saying n is not equal to 1)
	addi a0, x0, 1	#adds 1 to n when a is 0 to return the final value of 1 in the sum 
	addi sp, sp, 8	#pop 8 bytes into memory freeing it fromt he stack
	jalr x0, ra, 0	#return 0 to main
cond1:
	addi a0, a0, -1	#decremtns n by 1 to be used for next sum
	jal ra, SIGMA		#loops back to SIGMA and links the return address.
	addi t1,a0,0		#takes the previos values of Sigma and puts it into t1
	lw a0,0(sp)			#loads the new value from Sigma into registor
	lw ra,4(sp)			#loads the return address from stack into registor
	addi sp,sp,8		#pops stack
	add a0, a0, t1	#adds the previous returned sigma and the new one
	jalr x0 ra, 0		#return 0 to main
END:
 nop							#function end

