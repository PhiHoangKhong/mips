.data
	nhap: .asciiz "Nhap chuoi: "
	xuat: .asciiz "Chuoi nguoc: "
	chuoi: .space 20
	chuoiNguoc: .space 20
.text
get_string:
	li $v0, 4
	la $a0, nhap
	syscall
		
	li $v0, 8
	la $a0, chuoi
	la $a1, 20
	syscall
get_length: 
	la $a0, chuoi # $a0 = dia chi cua string[0]
	add $t0, $zero, $zero # i= 0, va se luu tru do dai cua xau
check_char: 
	add $t1, $a0, $t0 # $t1 = $a0 + $t0 = dia chi string[i]
	lb $t2, 0($t1) # $t2 = gia tri cua string[i]
	beq $t2, $zero, end_of_str
	addi $t0, $t0, 1
	j check_char
end_of_str:
end_of_get_length:

strcpy:
	la $a1, chuoi
	la $a0, chuoiNguoc
	add $t0, $t0, -1	# i = strlen - 1
	move $s0, $t0
	addi $s1, $s1, 0	# i = 0
l1:
	add $t1, $s0, $a1		# y[i] no jyusho = i + y[0]
	lb $t2, 0($t1)		# t2 = giá trị tại t1 = y[i]
	add $t3, $a0, $s1		# x[i] no jyusho = i + x[0]
	sb $t2, 0($t3)		# x[i] = y[i]
	add $s0, $s0, -1 		# i+= 1
	add $s1, $s1, 1 		# i+= 1
	beq $s0, -1, exit	# nếu y[i] == 0 thì exit
	j l1
exit:
	
print_chuoi_nguoc:
	li $v0, 4
	la $a0, xuat
	syscall
		
	li $v0, 4
	la $a0, chuoiNguoc
	syscall
		
	    
