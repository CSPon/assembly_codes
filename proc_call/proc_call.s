/* Procedure calls */
/* This one will show you how to call procedure with arguements */
/* Use gcc to compile */

.global main
.func main

main:
	@ R0 will have returned value from procedure call, so 
	@ arguments will be passed starting from R1
	MOV	R1, #4
	MOV	R2, #8
	BL	ADDNUM
	@ Output string needs to be in R0, so result from ADDNUM
	@ is moved to R1 as argument
	MOV	R1, R0
	LDR	R0, =out_str
	BL	PRINT
	B	EXIT

ADDNUM:
	ADD	R0, R1, R2
	MOV	PC, LR

PRINT:
	PUSH	{LR}
	BL	printf
	POP	{PC}

EXIT:
	MOV	R7, #1
	SWI	0

.data
out_str: .asciz "Output: %d\n"

