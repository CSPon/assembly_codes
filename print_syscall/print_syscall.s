/* Print to screen using system call */

.global _start

@ Entry point
_start:
	@ System call for write mode
	MOV	R7, #4
	@ Set stdout to screen
	MOV	R0, #0
	@ Set string length
	MOV	R2, #14
	@ Load R1 to point string
	LDR	R1, =string
	@ Call system interrupt
	SWI	0

_exit:
	@ System call for process terminate
	MOV	R7, #1
	SWI	0

@ Data
.data
string: .asciz "Hello World!\n"

