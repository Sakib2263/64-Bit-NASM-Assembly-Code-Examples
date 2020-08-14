; Write a program which reads 5 numbers into an array, sorts/arranges the numbers from
; low to high and prints all numbers in the array.
; If the user enters 7, 13, 2, 10, 6 then your program should print 2, 6, 7, 10, and 13.

segment .data
a: dq 2
b: dq 0
ind: dq 0
cnt: dq 0
cnt2: dq 0
mini: dq 0
maxi: dq 0
min_pos: dq 0
max_pos: dq 0
fmt: dq "%lld ",10, 0
fmt_in: dq "%lld", 0
fmt_out: dq "The sorted array is: ", 10, 0

segment .bss
array resq 21
array2 resq 21

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
	cmp RCX, 5
	jz DONE
	mov [cnt], RCX
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, [a]
	mov RCX, [cnt]
	mov [array+RCX*8], RAX
	mov [array2+RCX*8], RAX
	add RBX, [a]	
	inc RCX	
	jmp INPUT_ARRAY 

DONE:
	mov RAX, 0
	mov RCX, 0
	mov RBX, 0	

OUTER_LOOP:
	cmp RCX, 5
	jge END_LOOP
	mov [cnt], RCX
	mov RAX, [array+RCX*8]

INNER_LOOP:
	inc RCX
	cmp RCX, 5
	jz OK 
	cmp RAX, [array+RCX*8]		
	jle INNER_LOOP		
	xchg RAX, [array+RCX*8]
	jmp INNER_LOOP

OK:
	mov RCX, [cnt]
	mov [array+RCX*8], RAX
	inc RCX
	jmp OUTER_LOOP

END_LOOP:
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0
	mov RDI, fmt_out
	call printf
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0		

PRINT_ARRAY:
	cmp RCX, 5
	jz END
	mov RAX, [array+RCX*8]
	inc RCX	
	mov [cnt], RCX
	mov RDI, fmt
	mov RSI, RAX
	call printf
	mov RCX, [cnt]
	jmp PRINT_ARRAY

END:
	mov RAX, 0
	pop RBP
ret
