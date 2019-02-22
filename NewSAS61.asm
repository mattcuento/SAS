.EQU I = 0x9a
.EQU O = 0x42

.CSEG
.ORG 0x10

input:
	IN r0, I
	CMP r0, 0xFF
	BREQ output
	PUSH r0
	ADD r1, 0x01
	BRN input
	
output:
	POP r0
	SUB r1, 0x01
	OUT r0, O
	CMP r1, 0x01
	BRCC output
