addi $s0, $s0, 2000000000
addi $s1, $s1, -1000000000

check_cung_dau:
	addu $s2, $s0, $s1	# s2 = S0 + s1
	xor $t0, $s0, $s1
	bltz $t0, exit	# nếu s0, s1 không cùng dấu thì exit 
	xor $t1, $s0, $s2
	bltz $t1, exit	# # nếu s0, s3 không cùng dấu thì exit 
exit: 