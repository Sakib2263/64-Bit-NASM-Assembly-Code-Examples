segment .data
a: dq 2
b: dq 2
fmt: dq "%lld is %s",10,0
prime: dw "Prime", 0
non_prime: dw "Not Prime", 0
fmt_in: dq "%lld", 0

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


mov RAX , 0
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
	mov RDI, fmt
	mov RSI, [a]
	mov RDX, prime
	jmp LAST

NOT_PRIME:
	mov RDI, fmt
	mov RSI, [a]
	mov RDX, non_prime
	jmp LAST

LAST:
	mov RAX , 0
	call printf

mov RAX, 0
pop RBP
ret
