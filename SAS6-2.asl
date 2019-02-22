

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
(0007)  CS-0x010  0x361FF         || 	MOV r1, 0xFF
(0008)  CS-0x011  0x362FF         || 	MOV r2, 0xFF
(0009)                     0x012  || input:
(0010)  CS-0x012  0x3209A         || 	IN r0, I
(0011)  CS-0x013  0x300FF         || 	CMP r0, 0xFF
(0012)  CS-0x014  0x080C2         || 	BREQ output
(0013)  CS-0x015  0x12001         || 	PUSH r0
(0014)  CS-0x016  0x2C201         || 	SUB r2, 0x01
(0015)  CS-0x017  0x08090         || 	BRN input
(0016)                            || 	
(0017)                     0x018  || output:
(0018)  CS-0x018  0x14100         || 	WSP r1
(0019)  CS-0x019  0x0430A         || 	LD r3, (r1)
(0020)  CS-0x01A  0x34342         || 	OUT r3, O
(0021)  CS-0x01B  0x28201         || 	ADD r2, 0x01
(0022)  CS-0x01C  0x302FF         || 	CMP r2, 0xFF
(0023)  CS-0x01D  0x08102         || 	BREQ done
(0024)  CS-0x01E  0x2C101         || 	SUB r1, 0x01
(0025)  CS-0x01F  0x080C0         || 	BRN output
(0026)                            || 
(0027)                     0x020  || done:





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
DONE           0x020   (0027)  ||  0023 
INPUT          0x012   (0009)  ||  0015 
OUTPUT         0x018   (0017)  ||  0012 0025 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
I              0x09A   (0001)  ||  0010 
O              0x042   (0002)  ||  0020 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
