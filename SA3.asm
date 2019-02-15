.EQU I = 0X9A
.EQU O = 0X42
.CSEG
.ORG 0X10

main:
	IN R0,I				;input
	
	MOV R1,R0			;copy num
	AND R1,0x0F			;R1 is 4 LSB
	AND R0,0xF0			;R0 is 4 MSB
	
	MOV R2,0x04			;R2 is # of times to loop shift

;shifts R0 4 times via logical shift right
shift:
	LSR R0
	SUB R2,0x01
	BRNE shift
	
	;check if either are 0
	CMP R0,0x00			
	BREQ end0
	CMP R1,0x00
	BREQ end0
	
	
	MOV R2,R1			;R2 is # of times to loop mult

;multiplies R0 by R1 via repeated addition
mult:
	SUB R0,0x01
	BREQ end			;if R0 is 1, 0 flag will set, and BREQ will go to end
	ADD R1,R2			;otherwise go through repeated addition
	CMP R0,0x01
	BRNE mult
	BREQ end

;output if 0 (uses R2 as the #0 from the shift being successful
end0:
	OUT R2,O
	BRN main
	
;output otherwise
end:
	OUT R1,O
	BRN main
