.data
string:		.space  50
Message1:		.asciiz "Nhap xau: "
Message2: 	.asciiz "Do dai cua xau la: "
.text
main:
get_string:	
	li $v0, 54
	la $a0, Message1
	la $a1, string
	la $a2, 50
	syscall
get_length: 
	la $a0, string # $a0 = dia chi cua string[0]
	add $t0, $zero, $zero # i= 0, va se luu tru do dai cua xau
check_char: 
	add $t1, $a0, $t0 # $t1 = $a0 + $t0 = dia chi string[i]
	lb $t2, 0($t1) # $t2 = gia tri cua string[i]
	beq $t2, $zero, end_of_str
	addi $t0, $t0, 1
	j check_char
end_of_str:
end_of_get_length:
print_length: 
	li $v0, 56
	la $a0, Message2
	add $t0, $t0, -1 # vi con ki tu ket thuc xau o cuoi nen ta phai tru di 1
	move $a1, $t0 
	syscall 
	
	    
