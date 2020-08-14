segment .data
a: dq 2
b: dq -1
mul: dw "The String is:",0
fmt: dq "%s %s ",10,0
fmt_in: dq "%s", 0

section .bss
str: resb 20

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RSI, str
mov RDI, fmt_in
call scanf

mov RDI, fmt
mov RSI, mul
mov RDX, str
mov RAX , 0
call printf

mov RAX, 0
pop RBP
ret

