.EQU I = 0x9A
.EQU O = 0x42

.CSEG
.ORG 0x10

main:
	IN R0,I			;input
	
	;ref loop numbers
	;initial offset = 5
	;per loop:
	;	loop I = 191 loops		3 cmds
	;	loop J = 78 loops		3 cmds
	;	loop K = 209 loops		4 cmds

	
;start of 1/2 s delay
	MOV R1,0xBF		;counter for loop I
	MOV R2,0x4E		;counter for loop J
	MOV R3,0xD1		;counter for loop K
	MOV R3,0xD1		;offset
	MOV R3,0xD1		;offset

;inner loop
LoopK:
	ADD R4,0x00		;offset
	ADD R4,0x00		;offset
	SUB R3,0x01		;subtract from counter K
	BRNE LoopK		;check if counter K == 0

;middle loop
LoopJ:
	MOV R3,0xD1		;reset counter K
	SUB R2,0x01		;subtract from counter J
	BRNE LoopK		;check if counter J == 0

;top loop
LoopI:
	MOV R2,0x4E		;reset counter J
	SUB R1,0x01		;subtract from counter I
	BRNE LoopK		;check if counter I == 0

;output
output:
	OUT R0,O		;output after 0.5s
