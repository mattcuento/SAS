.equ I = 0x30			;assign I to address 0x30
.equ O = 0x40			;assign O to address 0x40

.cseg					;code segment start
.org 0x01				;start at address 0x01

main: 	IN r0, I		;register I to r0
		EXOR r0, 0xff	;complement r0
		ADD r0, 0x01	;add 1 to r0
		OUT r0, O		;output r0
		BRN main		;loop main
