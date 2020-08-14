; sum from  1 to n

segment .data
a: dq 2
b: dq 2
fmt: dq "The sum from 1 to %lld is: %lld",10,0
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
mov RCX, 0
mov RBX, 0
mov RAX , [a]

WHILE: 
	cmp RCX, RAX
	jge END_WHILE
	inc RCX
	add RBX, RCX
	jmp WHILE 

END_WHILE:
	mov RDI, fmt
	mov RSI, [a]
	mov RDX, RBX
	jmp LAST

LAST:
	mov RAX , 0
	call printf

mov RAX, 0
pop RBP
ret
