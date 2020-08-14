; Write an assembly program that reads 10 numbers from the user. The program then reads
; a number between 0 to 9, and shows the number at the corresponding index number. For
; instance, if the array is a and the user enters 3, your program should print the value at
; position 3.

segment .data
a: dq 2
b: dq 0
ind: dq 0
cnt: dq 0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 0
fmt_out: dq "The value at position %lld is: %lld", 10, 0

segment .bss
array resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RSI, ind
mov RDI, fmt_in
call scanf

mov RAX, 0
mov RCX, 0
mov RBX, 0

INPUT_ARRAY: 
	cmp RCX, 10
	jz DONE
	mov [cnt], RCX
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, [a]
	mov RCX, [cnt]
	mov [array+RCX*8], RAX
	add RBX, [a]	
	inc RCX	
	jmp INPUT_ARRAY 

DONE:
	mov RAX, 0
	mov RCX, [ind]
	mov RDI, fmt_out
	mov RSI, [ind]
	mov RDX, [array+RCX*8]
	call printf	

END:
	mov RAX, 0
	pop RBP
ret
