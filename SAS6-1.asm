.EQU I = 0x9a
.EQU O = 0x42

.CSEG
.ORG 0x10

input:
	IN r0, I
	PUSH r0
	ADD r1, 0x01
	CMP r0, 0xFF
	BRNE input
	POP r0
	SUB r1, 0x01
	
output:
	POP r0
	SUB r1, 0x01
	OUT r0, O
	BRCC output
