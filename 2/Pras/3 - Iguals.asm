Dades: .DW 4,4
.begin inici
inici:
	LOAD 0(R0), R1
	LOAD 1(R0), R2
	SUB R1,R2,R3
	BL guarda
	SUB R1,R2,R3
	BEQ fi
	ADD R1,R2,R3
	BR guarda
guarda:
	STORE R3, 34(R0)
fi:
	.end