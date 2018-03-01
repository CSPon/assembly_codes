/* Load a value to register R0, modify, then exit			*/
/* To view modified value, echo $? will display value in register R0	*/

.global _start

_start:
	@ Set R0 value to 0
	MOV	R0, #0
	@ Easy to remember this way;
	@ ADD to R0, with value R0 and 1
	ADD	R0, R0, #1
	MOV	R7, #1
	SWI	0

