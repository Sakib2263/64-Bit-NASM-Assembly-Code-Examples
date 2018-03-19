; Implement STRCMP


segment .data
a: dq 2
b: dq -1
fmt: dq "%s %s ",10,0
fmt_in: dq "%s", 0
fmt_equal: dq "Equal: %lld", 10, 0
fmt_not_equal: dq "Not Equal: %lld", 10, 0
new_line: dq "", 10, 0
fmt_out: dq "%c", 0
cnt: dq 0
size: dq 0
size1: dq 0
difference: dq 0

section .bss
str1: resq 20
str2: resq 20

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RSI, str1
mov RDI, fmt_in
call scanf

mov RAX, 0
mov RSI, str2
mov RDI, fmt_in
call scanf

mov RAX, 0
mov RCX, 0

SIZE_LOOP1:
	cmp qword[str1 + RCX], 0
	jz DONE
	inc qword[size]
	inc RCX
	jmp SIZE_LOOP1

DONE:
	mov RAX, 0
	mov RCX, 0

SIZE_LOOP2:
	cmp qword[str2 + RCX], 0
	jz DONE_SIZE_CHECK
	inc RAX
	inc qword[size1]
	cmp RAX, [size]
	inc RCX
	mov [size1], RCX
	jmp SIZE_LOOP2

DONE_SIZE_CHECK:
	mov RAX, [size]
	mov [size1], RCX
	cmp RCX, [size]
	jne SIZE_NOT_EQUAL
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0
	jmp COMPARE

SIZE_NOT_EQUAL:
	mov RAX, [size]
	mov RBX, [size1]
	cmp RAX, RBX
	jle LESS_THAN
	sub RAX, [size1]
	mov [difference], RAX
	jmp NOT_EQUAL

LESS_THAN:
	mov RAX, [size1]
	sub RAX, [size]
	imul RAX, -1
	mov [difference], RAX
	jmp NOT_EQUAL	

COMPARE:
	cmp qword[str1 + RCX], 0
	jz EQUAL
	mov [cnt], RCX
	mov RAX, 0
	mov AL, [str1 + RCX]
	mov RBX, 0
	mov BL, [str2 + RCX]
	sub RAX, RBX
	mov [difference], RAX
	mov RAX, 0
	mov AL, [str1 + RCX]
	mov RBX, 0
	mov BL, [str2 + RCX]
	cmp RAX, RBX
	jne NOT_EQUAL
	mov RCX, [cnt]
	inc RCX
	jmp COMPARE

EQUAL:
	mov RDI, fmt_equal
	mov RSI, [difference]
	call printf
	mov RDI, new_line
	call printf 
	jmp END

NOT_EQUAL:
	mov RDI, fmt_not_equal
	mov RSI, [difference]
	call printf
	mov RDI, new_line
	call printf

END:
	mov RAX, 0
	pop RBP
	ret
