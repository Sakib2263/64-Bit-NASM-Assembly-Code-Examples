segment .data
a: dq 2
b: dq 2
fmt: dq "The Number is %s",10,0
palin: dw "Palindrome", 0
non_palin: dw "Not Palindrome", 0
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
mov RBX, 0
mov RAX, 0
mov RCX, [a]

WHILE: 
	mov RAX, RBX
	mov RBX, 10
	mul RBX
	mov RBX, RAX
	mov RAX, RCX
	mov RDX, 0
	mov RCX, 10
	idiv RCX
	add RBX, RDX
	mov RCX, RAX
	cmp RCX, 0
	jz CHECK
	jmp WHILE 

CHECK:
	cmp RBX, [a]
	jz PALIN
	mov RSI, non_palin	
	jmp LAST

PALIN: mov RSI, palin

LAST:
	mov RAX , 0
	mov RDI, fmt
	call printf

mov RAX, 0
pop RBP
ret
