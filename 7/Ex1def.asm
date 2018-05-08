.org 100h
	LXI H, E000h
	JMP loop ;loop mentre no m'introdueixi els números
loop:
	JMP loop
.org 24h ;interrupció. Agafo el valor que l'ha provocat
	IN 00h
	MOV M, A
	INX H
	CPI 3Dh ;Miro si el numero introduit es un igual 
	JZ numerus ;si es així, gestiona els valor
	RET

.org 500h
numerus:
	MOV B, H
	MOV C, L
	DCX B ;decremento el registre dos cops per obtenir el segon nombre introduit
	DCX B 
	LDAX B ;carrego al acumulador aquest segon numero
	SUI 30h ;miro quin numero es en ASCII
	MOV E, A ;moc el numero al registre E
	DCX B ;Decremento de nou per obtenir el primer numero
	LDAX B ;El carrego del acumulador a B
	SUI 30h ;Miro quin numero es en ASCII
	MOV D, A ;El moc al registre D
	JMP suma
.org 600h
suma:
	MOV A, D ;Moc un dels dos números al acumulador
	ADD E ;I el sumo amb el que tinc a E
	SUI Ah ;Miro si tinc carry
	JP carry ;numero positiu o zero, anem a carry
	ADI 3Ah ;si estic aquí no hi ha carry, el mostro
	MOV M,A ;el moc a memòria
	INX H 
	HLT
.org 700
carry:
	MVI M, 31h
	INX H
	ADI 30h ;El paso a ASCII
	MOV M, A
	INX H
	HLT