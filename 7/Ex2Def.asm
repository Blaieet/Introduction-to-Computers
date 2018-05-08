.org 300
	LXI H, E000h ;pantalla
	JMP loop
loop:
	JMP loop

.org 24h ;interrupcio. Agafo el valor que l'ha provocat
	IN 00h
	MOV M, A
	INX H
	CPI 3Dh ;Miro si el numero introduit es un igual
	JZ numerus ;Si es aixi, gestiona els valors
	RET
.org 400
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
	JMP resta
.org 500
resta:
	MOV A, D ;Moc el segons numero al acumulador
	SUB E ;El resto, es guarda a acumulador
	JM negatiu
	ADI 30h ;no ha donat negatiu, el mostro per pantalla
	MOV M,A
	INX H
	HLT
negatiu:
	MOV D, A ;moc el resultat negatiu a D
	MVI A, 0h ;poso un zero a acumulador per fer l'inversio
	SUB D ;Resta correcte
	ADI 30h ;Ara passo a mostrarlo
	MVI M, 2Dh ;numero corresponen al signe menys en ASCII
	INX H
	MOV M, A
	INX H
	HLT
