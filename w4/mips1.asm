.text
#addi $s1, $s1, 2000000000000000000000000000000 	# 0x80000000
#addi $s2, $s2, 1000000000000000000000000000000 	# 0x7fffffff
addi $s1, $s1, 2000000000 	# 0x80000000
addi $s2, $s2, -1000000000  	# 0x7fffffff
start:
	li $t0, 0
	addu $s3, $s1, $s2
	xor $t1, $s1, $s2
	
	bltz $t1, exit
	slt $t2, $s3, $s1
	bltz $s1, negative
	beq $t2, $zero, exit
	j overlow
negative:
	bne $t2, $zero, exit
overlow:
	li $t0, 1
exit:
