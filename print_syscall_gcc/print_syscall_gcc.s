/* Prints to screen. This one uses gcc to compile	*/
/* To compile: gcc -w print_syscall_gcc.s -o print	*/
/* This one looks same as print_syscall.s but this one	*/
/* uses C's main function as entry point.		*/

@ Redirects entry point to main
.global main
.func main

main:
	MOV	R0, #0
	LDR	R1, =string
	MOV	R2, #14
	MOV	R7, #4
	SWI	0

_exit:
	@ Set system call to process terminate
	MOV	R7, #1
	SWI	0

@ Data
.data
string: .asciz "Hello World!\n"

