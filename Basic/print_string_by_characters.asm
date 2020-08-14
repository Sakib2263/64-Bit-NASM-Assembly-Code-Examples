segment .data
a: dq 2
b: dq -1
mul: dw "The String is:",0
fmt: dq "%s %s ",10,0
fmt_in: dq "%s", 0
fmt_out: dq "%c", 0
cnt: dq 0

section .bss
str: resq 20

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

mov RAX, 0
mov RBX, 0
mov RCX, 0

lol:
	cmp qword[str + RCX], 0
	jz END
	mov [cnt], RCX
	mov RAX, 0
	xor RBX, RBX
	mov RDI, fmt_out
	mov RCX, [cnt]
	mov RSI, qword[str + RCX]
	call printf
	mov RCX, [cnt]
	inc RCX
	jmp lol

END:
	mov RAX, 0
	pop RBP
	ret
