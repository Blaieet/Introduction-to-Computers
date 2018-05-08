valor1: .dW A
resultat: .rW 1
.begin inici
inici:
	ADD R0,R0,R1
	LOAD valor1(R1), R2
	BL fi
	SUB R0, R2,R2
	SUBI R2, #1,R2
	STORE R2, resultat(R0)
fi:
	.end