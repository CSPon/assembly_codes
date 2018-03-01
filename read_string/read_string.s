/* Reads string from keyboard input */
/* Note that this code can be modified to read single character as well */
/* Uses gcc compiler */

.global main
.func main

main:
	@ First the prompt
	LDR	R0, =prompt_str
	BL	PRINT
	@ Now wait for keyboard input
	BL	SCAN
	@ Since SCAN procedure will return string address in R0
	@ input string must be moved to R1
	MOV	R1, R0
	LDR	R0, =output_str
	BL	PRINT
	B	EXIT

SCAN:
	PUSH	{LR}
	@ #3 for R7 means file reader
	MOV	R7, #3
	@ Read target is from monitor
	MOV	R0, #0
	@ Scan size is 256
	MOV	R2, #256
	@ And save (or point) scanned string to R1
	LDR	R1, =input_str
	
	SWI	0

	@ Save pointer to R0
	MOV	R0, R1
	@ Return
	POP	{PC}
	
PRINT:
	PUSH	{LR}
	BL	printf
	POP	{PC}

EXIT:
	MOV	R7, #1
	SWI	0

.data
prompt_str: .asciz "Enter a sentence (Size limit: 256 char)\n"
output_str: .asciz "You entered\n %s"
input_str: .ascii ""

