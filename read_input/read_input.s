/* Reads input from user (or keyboard, more precise)	 */
/* This will use scanf to scan number (i.e. gcc compiler */

.global main
.func main

main:
	BL	PROMPT
	BL	SCAN
	@ Since R0 will be overwriten by output string,
	@ we need to save returned value somewhere else
	MOV	R3, R0
	BL	OUTPUT
	B	_exit

PROMPT:
	MOV	R7, #4
	MOV	R0, #1
	LDR	R1, =prompt
	MOV	R2, #16
	SWI	0

	MOV	PC, LR

SCAN:
	PUSH	{LR}
	@ Make room for scanf
	SUB	SP, SP, #4
	@ Need to load scan format
	LDR	R0, =scanformat
	@ Need to store entry point to R1
	MOV	R1, SP
	@ Call scanf
	BL	scanf
	@ Returned value from scanf is saved on SP
	LDR	R0, [SP]
	@ scanf used all buffer. Move SP back
	ADD	SP, SP, #4
	POP	{PC}

OUTPUT:
	PUSH	{LR}
	LDR	R0, =output
	MOV	R1, R3
	BL	printf
	POP	{PC}

_exit:
	MOV	R7, #1
	SWI	0
.data
prompt:		.asciz "Enter a number: "
scanformat:	.asciz "%d"
output:		.asciz "Value is %d\n"

