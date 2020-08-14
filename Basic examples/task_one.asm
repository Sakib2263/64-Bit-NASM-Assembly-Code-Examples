; Find a + (b*c)/d

segment .data
a: dq 0
b: dq 0
c: dq 0
d: dq 0
res: dw "Answer:",0
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

mov RAX, 0
mov RSI, c
mov RDI, fmt_in
call scanf

mov RAX, 0
mov RSI, d
mov RDI, fmt_in
call scanf

mov RAX , 0
mov RBX , 0
mov RDX, 0
mov RAX , [b]
mov RBX , [c]
mul RBX
mov RBX, 0
mov RBX, [d]
idiv RBX
add RAX, [a]
mov RDI, fmt
mov RSI, res
mov RDX, RAX
mov RAX , 0
call printf

mov RAX, 0
pop RBP
ret
