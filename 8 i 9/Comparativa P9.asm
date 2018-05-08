.org 100h
	LXI H, E000h
	JMP loop ;loop mentre em va introduint coses
loop:
	JMP loop

.org 3Ch ;interrupció. Mostro valor que l'ha provocat
	IN 00h
	MOV M, A
	INX H
	CPI 3Dh ;Miro si el numero introduit es un igual, per acabar el programa dalguna forma
	JZ fi ;si es així, acaba el programa
	RET

.org 2Ch ;interrupcio 5.5. Associo el led en el port Ah perque sactivi
	MVI A, 1h ;Moc un 1
	OUT Ah ; i el mostro
	RET


.org 200
fi:
	HLT