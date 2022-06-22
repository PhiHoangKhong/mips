.data
	x: .space 32 
	y: .asciiz "Hello"
.text
la $a0, x
la $a1, y
strcpy:
	add $s0, $zero, $zero	# i = 0
l1:
	add $t1, $s0, $a1		# y[i] no jyusho = i + y[0]
	lb $t2, 0($t1)		# t2 = giá trị tại t1 = y[i]
	add $t3, $a0, $s0		# x[i] no jyusho = i + x[0]
	sb $t2, 0($t3)		# x[i] = y[i]
	beq $t2, $zero, exit	# nếu y[i] == 0 thì exit
	nop
	addi $s0, $s0, 1 		# i+= 1
	j l1
	nop
exit:
	