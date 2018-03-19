segment .data
a: dq 2
b: dq -1
div: dw "Quotient:",0
fmt: dq "%s %lld ",10,0
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
mov RBX , 0
mov RDX, 0
mov RAX , [a]
mov RBX , [b]
idiv RBX
mov RDI, fmt
mov RSI, div
mov RDX, RAX
mov RAX , 0
call printf

mov RAX, 0
pop RBP
ret
