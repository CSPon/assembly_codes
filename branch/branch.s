/* Bbranching						    	    */
/* First Hello World will be printed, then R3 value will be printed */
/* Note that this one will need gcc compiler due to BL printf	    */

.global main
.func	main

main:
	@ Printing R3 value
	MOV	R3, #10
	@ BL will branch AND save PC+4 to LR register
	BL	PRINT_HELLO
	BL	PRINT_OUTPUT
	B	_exit

PRINT_HELLO:
	MOV	R0, #1
	LDR	R1, =string
	MOV	R2, #14
	MOV	R7, #4
	SWI	0
	@ You can move LR value to PC register to continue execute
	@ from where you branched from
	MOV	PC, LR

PRINT_OUTPUT:
	@ This branch will use printf from C library
	@ Since printf takes first R0 as formatted string, R0
	@ will have formatted string, while R1 has value for
	@ formatted string
	@ We need to save return register in stack using PUSH
	@ PUSH will add LR value to next stack and stack pointer
	@ will increase
	PUSH	{LR}
	LDR	R0, =value
	MOV	R1, R3
	BL	printf
	@ POP will move value on stack pointer to target register
	@ in this case, PC. Since we pushed LR value, PC now has
	@ LR value.
	POP	{PC}

_exit:
	MOV	R7, #1
	SWI	0

@ Data
.data
@ .asciz adds terminator at the end of string
string:	.asciz "Hello World!\n"
value:	.asciz "Value is: %d\n"

