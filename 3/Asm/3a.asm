valor1: .dW A
contador: .dW B
resultat: .rW 1
.begin inici
inici:
	ADD R0,R0,R1
	SUB R0,R0,R2
	ADD R0,R0,R4
	LOAD valor1(R1), R2
	BL part2
	LOAD contador(R0), R3
	BL loop2
loop:
	ADD R1, R2,R1
	BL fi
	SUBI R3, #1,R3
	BG loop
	STORE R1, resultat(R0)
	BR fi
loop2:
	SUB R1, R2,R1
	BG fi
	ADDI R3, #1,R3
	BL loop2
	STORE R1, resultat(R0)
	BR fi
part2:
	LOAD contador(R0), R3
	BL loop4
loop3:
	ADD R1, R2,R1
	BG fi
	SUBI R3, #1,R3
	BG loop3
	STORE R1, resultat(R0)
	BR fi
loop4:
	SUB R1, R2,R1
	BL fi	
	ADDI R3, #1,R3
	BL loop4
	STORE R1, resultat(R0)
	BR fi
fi:
	.end