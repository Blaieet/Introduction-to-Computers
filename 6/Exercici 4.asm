.data 08H
	pila: db 77h,44h,3Eh,6Eh,4Dh,6Bh; pila amb els nombres que equivalen del 0 al 5
.org 24h; en el primer cas o en cas d'interrupció
	in 00h; passes l'introduit en el port 00h a l'acumulador
	LXI D, pila; carregues la pila en D
	call visor; crides a la subrutina visor

.org 500H
visor:
	
	MOV B,A; copies l'acumulador a B
	
	
	MOV C,B; copies l'acumulador a C
	INR C; Incrementes C en 1
	call visualitzar; crides a visualitzar
	NOP
	HLT; Acabes

visualitzar:
	LDAX D; copies a l'acumulador en contingut de la posicio en D
	INX D; incrementes D
	DCR C; Decrementes C
	JNZ visualitzar; Si no es zero, segueixes fent el bucle
OUT 07h; mostres el que hi ha a l'acumulador pel port 07h
Ret