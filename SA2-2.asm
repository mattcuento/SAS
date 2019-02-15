.EQU I = 0x30
.EQU O = 0x42

.CSEG
.ORG 0x10

main:	IN R0,I
		MOV R1,R0
		AND R1,0x03	;R1 % 4
		;compare
		CMP R1,0x00	;remainder = 0?
			;yes
			BREQ invert
			;no
			MOV R2,R0
			AND R2,0x01	;R2 % 2
			;compare
			CMP R2,0x00	;remainder = 0?
				;yes
				BREQ sub1
				;no
				ADD R0,0x11	;add 17
				LSR R0		;divide by 2
				CALL output	;jump to output
		
invert:	EXOR R0,0xFF	;invert
		CALL output		;jump to output
		
sub1:	SUB R0,0x01	;subtract 1
		CALL output	;jump to output

output:	OUT R0,O
