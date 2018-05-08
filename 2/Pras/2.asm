Dades: .DW 3083,17
.begin inici
inici:
LOAD 0(R0), R1
LOAD 1(R0), R2
loop:
ADD R7, R1, R7
SUBI R2,#1, R2
BG loop
STORE R7, 0(R2)
.end