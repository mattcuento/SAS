.equ I0 = 0x30
.equ I1 = 0x30
.equ I2 = 0x30
.equ O0 = 0x40

.cseg
.org 0x10

main:	IN r0,I0
		IN r1,I1
		IN r2,I2
		ADD	r0,r1
		ADD r0,r2
		OUT r0, O0
		BRN main
