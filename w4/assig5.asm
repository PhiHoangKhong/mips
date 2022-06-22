addi $s0, $s0, 2	# i = 2
addi $s1, $s1, 16	# n = 16
addi $s2, $s2, 1	# tích = 1
nhan:
slt $t0, $s1, $s0
beq $t0, 1, exit	# khi n >= i thì thực hiện nhân
	mul $s2, $s2, $s0	# s2 *= s0
	sll $s0, $s0, 1	# s0 *= 2
	j nhan
exit: