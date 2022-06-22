.data
string: .space 20
restring: .space 20
message1: .asciiz "Nhap xau:\n"
message2: .asciiz "Xau nguoc:"

.text
get_string: li $v0, 4
	    la $a0, message1
	    syscall 

	    li $v0, 8
	    la $a0, string
	    li $a1, 20
	    syscall
get_length: la $s0, string # $s0 = dia chi cua string[0]
	    add $t0, $zero, $zero # i= 0, $t0 se luu do dai cua xau
check_char: add $t1, $s0, $t0 # $t1 = $s0 + $t0 = dia chi string[i]
	    lb $t2, 0($t1) # $t2 = gia tri cua string[i]
	    beq $t2, $zero, end_of_str
	    addi $t0, $t0, 1
	    j check_char
end_of_str:
end_of_get_length:

la $a0, restring
la $a1, string
reverse:
add $t0, $t0, -1
move $s0, $t0 # luu tru bien dem $s0 = chi so cua phan tu cuoi cung trong string
li $s1, 0 # i = 0, bien dem
L1:
add $t1, $s0, $a1 # t1 = dia chi cua string[n-1-i]
lb $t2, 0($t1) # t2 = gia tri cua string[n-1-i]
add $t3, $s1, $a0 # t3 = dia chi cua restring[i]
sb $t2, 0($t3) #  restring[i] = gia tri tai t2 = gia tri tai string[n-1-i]
# blt $s0, $zero, end_of_reverse
add $s0, $s0, -1
add $s1, $s1, 1
beq $s0, -1, end_of_reverse
j L1
end_of_reverse:

li $v0, 4
la $a0, message2
syscall 

li $v0, 4
la $a0, restring
syscall 
