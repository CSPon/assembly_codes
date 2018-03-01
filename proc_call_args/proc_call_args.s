/* Procedure call with more than 4 arguments */
/* When more than 4 arguments are needed for procedure call */
/* You need to move load register values to memory instead */
/* Use gcc to compile */

.global main
.func main

main:
	@ We will call printf to print values
	LDR	R0, =out_str
	MOV	R1, #4
	MOV	R2, #8
	MOV	R3, #12

	@ With AAPCS standard, last two arguments must be
	@ passed via memory. Stack Pointer (SP) is used
	@ to keep track of these arguments.
	@ Single word takes 4 bytes. This means stack
	@ pointer SP needs to be moved down by 4 bytes
	@ to make room for arguments. Note that when saving
	@ values to memory, it is last in first out.
	@ Subtract 4 bytes from stack pointer
	SUB	SP, SP, #4
	@ Our stack pointer now points to next memory address.
	@ Now value for fifth (last) %d can be saved in the current
	@ stack pointer address.
	MOV	R12, #20
	STR	R12, [SP]

	@ Do the same for fourth argument
	SUB	SP, SP, #4
	MOV	R12, #16
	STR	R12, [SP]

	@ Now we can call print procedure
	BL	printf

	ADD	SP, SP, #8
	B	EXIT
	

PRINT:
	PUSH	{LR}
	BL	printf
	POP	{PC}

EXIT:
	MOV	R7, #1
	SWI	0

.data
out_str: .asciz "Numbers are %d %d %d %d and %d\n"

