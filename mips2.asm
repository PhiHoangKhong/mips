.text 
	li $s0, 0x5036 # load giá trị cần kiểm tra
	andi $t0, $s0, 0xff  # trừ LSB của s0
	andi $t1, $s0, 0x0400  # trích xuất bit 10 của s0
	