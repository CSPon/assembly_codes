/* Generating array */
/* This code will generate array of int with size 10 */
/* Code uses gcc compiler */

.global main
.func main

main:
	MOV	R0, #0		@ Initialize array index counter
	MOV	R3, #10		@ To save into array

FILL:	@ Fiiling loop
	CMP	R0, #10		@ Compare value 10 and R0
	BEQ	PRINT		@ If R0 == 10, jump to PRINT
	
	LDR	R1, =arr	@ Get array pointer
	
	LSL	R2, R0, #2	@ Logical shift to left by 4 bits to get array offset
	ADD	R2, R1, R2	@ R2 has array offset, R1 has entry point, so R2 now points to index

	ADD	R3, R3, R0	@ R3 now has value of R3 + R0
	STR	R3, [R2]	@ Store value of R3 to memory pointer in R2

	ADD	R0, R0, #1	@ Increment index counter
	B	FILL		@ Do it again!

PRINT:
	MOV	R0, #0		@ Reset index counter

OUTPUT:
	CMP	R0, #10
	BEQ	EXIT

	LDR	R1, =arr

	LSL	R2, R0, #2
	ADD	R2, R1, R2

	LDR	R1, [R2]	@ Since we want to get value in memory address saved at R2, we use LDR this time
	
	@ Before calling printf, we need to have backup for R0 through R2, otherwise printf will overwrite all the values we saved
	@ for the array.
	@ Instead of using PUSH for each register, we will use STMDB to decrement stack pointer before storing register value
	STMDB	SP!, {R0-R2}

	MOV	R2, R1		@ Move array value to R2
	MOV	R1, R0		@ Move array index number to R1
	LDR	R0, =out_str	@ Send string memory pointer to R0
	BL	printf		@ Call printf

	@ Similar to STMDB, LDMIA will load multiple value to registers, IA will Increment After reading value from memory address
	LDMIA	SP!, {R0-R2}

	ADD	R0, R0, #1
	B	OUTPUT

EXIT:
	MOV	R7, #1
	SWI	0
.data
@ .balign 4 will make sure next address is within 4-byte size
.balign 4
@ .skip 40 will make room for 10 words, each sized with 4 bytes
arr: .skip 40

out_str: .asciz "arr[%d] = %d\n"
