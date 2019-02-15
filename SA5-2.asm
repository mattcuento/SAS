.EQU I = 0x9A
.EQU O = 0x42

.DSEG
.ORG 0x01
.byte 0x0A

.CSEG
.ORG 0x20

inInit:
	MOV R1,0x01
inLoop:
	IN R0,I
	ST R0,(R1)
	ADD R1,0x01
	CMP R1,0x0B
	BRCS inLoop
sortedInit:	
	MOV R3,0x0A
sortInit:
	MOV R2,0x01
sortLoop:
	LD R0,(R2)
	ADD R2,0x01
	LD R1,(R2)
	CMP R0,R1
	BRCS inc	;no swap needed, check next 2
	;swap
	ST R0,(R2)
	SUB R2,0x01
	ST R1,(R2)
	ADD R2,0x01
inc:
	CMP R2,R3
	BRCS sortLoop
goAgain:
	SUB R3,0x01
	BRNE sortInit
outputInit:
	MOV R1,0x01
outputLoop:		;fix somewhere
	LD R0,(R1)
	OUT R0,O
	ADD R1,0x01	
	CMP R1,0x0B
	BRCS outputLoop
