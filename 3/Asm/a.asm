contador: .dW 5
valor1: .dW 6
resultat: .rW 1
.begin inici
inici:
	ADD R0,R0,R1
	SUB R0,R0,R2
	LOAD contador(R0), R3
	LOAD valor1(R1), R2
loop:
	ADD R1, R2,R1
	SUBI R3, #1,R3
	BG loop
	STORE R1, resultat(R0)
.end