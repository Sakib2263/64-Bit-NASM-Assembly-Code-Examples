segment .data
a: dq 200
b: dq 100
mul: dw "Multiplication:",0
fmt: dq "%s %lld ",10,0

segment .text
global main
extern printf

main:
push RBP

mov RAX , 0
mov RDX, 0
mov RAX , [a]
mov RDX , [b]
mul RDX
mov RDI, fmt
mov RSI, mul
mov RDX, RAX
mov RAX , 0
call printf

mov RAX, 0
pop RBP
ret

