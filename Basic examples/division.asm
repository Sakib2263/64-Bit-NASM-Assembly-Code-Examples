segment .data
a: dq 200
b: dq 100
div: dw "Quotient:",0
fmt: dq "%s %lld ",10,0

segment .text
global main
extern printf

main:
push RBP

mov RAX , 0
mov RBX , 0
mov RDX, 0
mov RAX , [a]
mov RBX , [b]
div RBX
mov RDI, fmt
mov RSI, div
mov RDX, RAX
mov RAX , 0
call printf

mov RAX, 0
pop RBP
ret

;nasm -f elf64 division.asm && gcc division.o -o division && ./division
