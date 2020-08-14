; Write an assembly program that reads 10 numbers from the user and prints the first and
; last odd number in the list.

segment .data
a: dq 2
b: dq 0
ind: dq 0
cnt: dq 0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 0
fmt_out_first: dq "The first odd is: %lld ", 10, 0
fmt_out_last: dq "The last odd is: %lld", 10, 0

segment .bss
array resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP

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
	mov RCX, 0
	mov RBX, 0	

FIRST_ODD:
	cmp RCX, 10
	jz END
	mov RAX, [array+RCX*8]
	inc RCX	
	mov [cnt], RCX
	test RAX, 1
	jnz PRINT_FIRST_ODD 
	mov RCX, [cnt]
	jmp FIRST_ODD

PRINT_FIRST_ODD:
	mov RDI, fmt_out_first
	mov RSI, RAX
	call printf
	mov RAX, 0
	mov RCX, 9
	mov RBX, 0	

LAST_ODD:
	cmp RCX, 0
	jnge END
	mov RAX, [array+RCX*8]
	dec RCX	
	mov [cnt], RCX
	test RAX, 1
	jnz PRINT_LAST_ODD 
	mov RCX, [cnt]
	jmp LAST_ODD

PRINT_LAST_ODD:
	mov RDI, fmt_out_last
	mov RSI, RAX
	call printf	

END:
	mov RAX, 0
	pop RBP
ret
