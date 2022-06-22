lui $s0, 0x1234
ori $s0, 0x5678
andi $t0, $s0, 0xff000000
ori $t1, $s0, 0x00000080 # 7 = 0111 -> chuyển số 0 thành 1 sẽ là or với 1000 = 8
andi $t2, $s0, 0x00000000