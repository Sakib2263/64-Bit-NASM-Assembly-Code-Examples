segment .data
a: dq 2
b: dq 2
fmt_even: dq "%lld is Even",10,0
fmt_odd: dq "%lld is Odd",10,0
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
mov RDX, 0
mov RAX , [a]
mov RBX , [b]
idiv RBX
cmp RDX, 1
jge ELSE
mov RDI, fmt_even
mov RSI, [a]
jmp LAST
ELSE: 
	mov RDI, fmt_odd
	mov RSI, [a]
	jmp LAST
LAST:
	mov RAX , 0
	call printf

mov RAX, 0
pop RBP
ret
