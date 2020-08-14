segment .data
a: dq 2
b: dq -1
fmt: dq "%lld is Greater Equal %lld",10,0
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
mov RDX, 0
mov RAX , [a]
mov RBX , [b]
mov RDI, fmt
cmp RAX, RBX
jge ELSE
mov RSI, RBX
mov RDX, RAX
jmp LAST
ELSE: 
	mov RSI, RAX
	mov RDX, RBX
	jmp LAST
LAST:
	mov RAX , 0
	call printf

mov RAX, 0
pop RBP
ret
