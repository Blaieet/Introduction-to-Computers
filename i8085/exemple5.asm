.define
	contador 8
	cero 0
.data 50h
	Eldato: db 55h
	LaMascara: db 01h
.org 100h
	mvi b, cero
	mvi h, 0h
	mvi l, 50h
	mvi e, contador; aquí tindrem el contador del programa
	mov c, M	; guardo el valor de Eldato en C
	inx h
	mov d, M ; guardo la mascara en D
Inici:	mov a, d; Carrego la máscara en l’Acc
	ana c; Fem una AND entre l’Acc i C, 
	jz kk ; si es 0 no caldrà fer cap mena de suma
	mov a, b
	adi 1

	mov b, a ; guardo el resultat de la suma en b
kk:
	mov a, d
	add d
	mov d, a
	dcr e; decremento el contador
	jnz Inici
	hlt

