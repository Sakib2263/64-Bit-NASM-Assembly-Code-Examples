; Given two numbers as input. Show all the prime numbers in between those numbers. 
; Then show the absolute difference between the sum of primes in odd position and primes in even position.
; For example if n1=1 and n2=10 Output: 2, 3, 5, 7 Difference = 3

segment .data
a: dq 2
b: dq 2
fmt: dq "%lld is %s",10,0
prime: dq "Prime", 0
fmt_out: dq "%lld", 0
non_prime: dq "Not Prime", 0
new_line: dq "" ,10, 0
fmt_in: dq "%lld", 0
fmt_out2: dq "Output: ", 0
fmt_out3: dq "Difference = %lld", 10, 0
spc: dq " ", 0
size: dq 0
cnt: dq 0
odd_pos: dq 0
even_pos: dq 0

section .bss
array: resq 211

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RSI, a
mov RDI, fmt_in
call scanf

mov RAX, 0
mov RSI, b
mov RDI, fmt_in
call scanf

OUTER_LOOP: 
	mov RCX, [a]
	cmp RCX, [b]
	jg END_OUTER_LOOP

	mov RAX, 0
	mov RCX, 2
	mov RBX, 0
		
	mov RAX , [a]
	cmp RAX, 2
	je PRIME
	cmp RAX, 1
	je PRIME

	WHILE: 
		mov RAX, [a]
		mov RDX, 0
		mov RBX, RCX
		idiv RBX
		cmp RDX, 0
		jz NOT_PRIME
		inc RCX
		cmp RCX, [a]
		jz PRIME
		jmp WHILE 

	PRIME:
		mov RCX, [size]
		mov RAX, [a]
		mov [array + RCX*8], RAX
		inc RCX
		mov [size], RCX
		mov RCX, [a]
		inc RCX
		mov [a], RCX
		jmp OUTER_LOOP

	NOT_PRIME:
		mov RCX, [a]
		inc RCX
		mov [a], RCX
		jmp OUTER_LOOP

END_OUTER_LOOP:
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0
	mov RDI, fmt_out2
	call printf
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0

PRINT_ARRAY:
	cmp RCX, [size]
	jz LAST
	test RCX, 1
	jz INC_ODD
	jmp INC_EVEN
DONE:	
	mov RAX, [array+RCX*8]
	inc RCX	
	mov [cnt], RCX
	mov RDI, fmt_out
	mov RSI, RAX
	call printf
	mov RDI, spc
	call printf
	mov RCX, [cnt]
	jmp PRINT_ARRAY

INC_ODD:
	mov RAX, [array+RCX*8]
	add RAX, [odd_pos]
	mov [odd_pos], RAX 
	jmp DONE

INC_EVEN:
	mov RAX, [array+RCX*8]
	add RAX, [even_pos]
	mov [even_pos], RAX 
	jmp DONE

LAST:
	mov RDI, new_line
	call printf 
	mov RAX, [even_pos]
	sub RAX, [odd_pos]
	mov RDI, fmt_out3
	mov RSI, RAX
	call printf
	mov RDI, new_line
	call printf
	mov RAX, 0

mov RAX, 0
pop RBP
ret
