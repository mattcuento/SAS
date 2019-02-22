

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                       154  || .EQU I = 0x9a
(0002)                       066  || .EQU O = 0x42
(0003)                            || 
(0004)                            || .CSEG
(0005)                       016  || .ORG 0x10
(0006)                            || 
(0007)                     0x010  || input:
(0008)  CS-0x010  0x3209A         || 	IN r0, I
(0009)  CS-0x011  0x12001         || 	PUSH r0
(0010)  CS-0x012  0x28101         || 	ADD r1, 0x01
(0011)  CS-0x013  0x300FF         || 	CMP r0, 0xFF
(0012)  CS-0x014  0x08083         || 	BRNE input
(0013)  CS-0x015  0x12002         || 	POP r0
(0014)  CS-0x016  0x2C101         || 	SUB r1, 0x01
(0015)                            || 	
(0016)                     0x017  || output:
(0017)  CS-0x017  0x12002         || 	POP r0
(0018)  CS-0x018  0x2C101         || 	SUB r1, 0x01
(0019)  CS-0x019  0x34042         || 	OUT r0, O
(0020)  CS-0x01A  0x0A0B9         || 	BRCC output





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
INPUT          0x010   (0007)  ||  0012 
OUTPUT         0x017   (0016)  ||  0020 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
I              0x09A   (0001)  ||  0008 
O              0x042   (0002)  ||  0019 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
