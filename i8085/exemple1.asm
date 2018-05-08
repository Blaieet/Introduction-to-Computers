.data 50h

	dada1: db 56h
	dada2: db 45h

.org 200h
	mvi c, dada1
	mvi a, dada2
	add c
	HLT