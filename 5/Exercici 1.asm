.data 00h
 	mat1: db 1,2,3,4,5
 	mat2: db 6,7,8,9,0
 	mat3: db 0,0,0,0,0
.org 100h
 	LXI D,mat1 ;carrego el primer valor de mat1 al registre D
 	LXI H,mat2 ;carrego el primer valor de mat2 al registre H
 	LXI B,mat3 ;carrego el primer valor de mat3 al registre B
 loop:
  	LDAX D ;Guardo en acumulador el contingut del registre D
  	ADD M ;Sumes l'acumulador amb el que hi ha a B i ho guardes a l'acumulador 
  	STAX B ;instrucció que guarda en l’acumulador la posició de memòria direccionada pel parell de registres BC
  	INX D ;incrementa D
  	INX H ;incrementa H
  	INX B ;incrementa B
  	MVI A,mat2 ;Carrego mat2 a l’acumulador
  	CMP E ;Comparo l’acumulador amb el contingut d’E
  	JNZ loop ;salta si no es zero
 HLT ;acaba
