.EQU I = 0x9a
.EQU O = 0x42

.CSEG
.ORG 0x10

	MOV r1, 0xFF
	MOV r2, 0xFF
input:
	IN r0, I
	CMP r0, 0xFF
	BREQ output
	PUSH r0
	SUB r2, 0x01
	BRN input
	
output:
	WSP r1
	LD r3, (r1)
	OUT r3, O
	ADD r2, 0x01
	CMP r2, 0xFF
	BREQ done
	SUB r1, 0x01
	BRN output

done:
