.define
	kk 0
	contador 4
.data 50h
	pila: db 1,2,3,4,5 	
	guarda: db 0,0,0,0 
.org 200h 
	mvi b, contador 	
	mvi h, kk		
	mvi l, 50h		
	mvi d, kk		
	mvi e, 55h		
bucle:
	mov A, M
	mov c,a
	add c	
	stax d			
	inx h		
	inx d			
	dcr b			
	jz final		
	jmp bucle		
final:
	HLT
