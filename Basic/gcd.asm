segment .data
a: dq 2
b: dq 2
fmt: dq "The GCD is: %lld",10,0
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

mov RAX, 0
mov RSI, b
mov RDI, fmt_in
call scanf

mov RAX , 0
mov RBX, 0
mov RAX, [a]
mov RBX, [b]

WHILE: 
	mov RDX, 0
	idiv RBX
	cmp RDX, 0
	jz LAST
	mov RAX, RBX
	mov RBX, RDX
	jmp WHILE 

LAST:
	mov RAX , 0
	mov RDI, fmt
	mov RSI, RBX 
	call printf

mov RAX, 0
pop RBP
ret
