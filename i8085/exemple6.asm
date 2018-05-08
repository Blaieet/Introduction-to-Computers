.define
	INICI 100h
	TIMER 200h
	VALORFINAL 10B
	MASCARA_SERIE 80h
	
.data 50h
guardaDada: db 0h
valorTimer: db 0h
CONTADOR: DB 8h
.org INICI
;/* funcio main */
loop:
	NOP
	NOP
	NOP
	NOP
	NOP
		;//Això són 20 cicles de clk d'espera
	call TIMER
	LDA CONTADOR
	ADI 0h
	JNZ loop

HLT


.org TIMER
	PUSH PSW
	PUSH H
	PUSH B
	PUSH D
	LXI H, valorTimer
	MOV C,M
	INR C
	MOV M,C
	INX H
	MOV B,M	
	MVI A,VALORFINAL
	CMP C
	JZ adquisicio
	MOV A,C
	LDA valorTimer
	JMP FINAL
adquisicio:
	DCR B
	JZ FINAL
	RIM
	ANI MASCARA_SERIE
	MOV E,A
	LDA guardaDada
	RRC
	ORA E
	STA guardaDada
	MOV A,B
	STA CONTADOR
	MVI A,0
	LXI H,valorTimer
	MOV M, A
FINAL:

	POP D
	POP B
	POP H
	POP PSW
 	RET