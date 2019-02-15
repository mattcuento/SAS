.EQU I = 0x30
.EQU O = 0x42

.CSEG
.ORG 0x10

main:	IN R0,I
		CMP R0,0x80
		BRCC great
		ADD R0,0x00
		LSR R0
		LSR R0
		CALL output
		
great:	LSL R0
		CALL output

output:	OUT R0,O
