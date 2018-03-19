; Given 2 input strings. Check if the two strings are equal (case sensitive).
; Example: 
; Input: abcd abcd
; Output: Equal
; Input: abCd abcd
; Output: Not equal


segment .data
a: dq 2
b: dq -1
fmt: dq "%s %s ",10,0
fmt_in: dq "%s", 0
fmt_equal: dq "Equal", 10, 0
fmt_not_equal: dq "Not Equal", 10, 0
new_line: dq "", 10, 0
fmt_out: dq "%c", 0
cnt: dq 0
size: dq 0
size1: dq 0

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
	cmp RAX, [size]
	jg NOT_EQUAL
	inc RCX
	mov [size1], RCX
	jmp SIZE_LOOP2

DONE_SIZE_CHECK:
	mov RAX, [size]
	cmp RCX, [size]
	jne NOT_EQUAL
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0

COMPARE:
	cmp qword[str1 + RCX], 0
	jz EQUAL
	mov [cnt], RCX
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
	call printf
	mov RDI, new_line
	call printf 
	jmp END

NOT_EQUAL:
	mov RDI, fmt_not_equal
	call printf
	mov RDI, new_line
	call printf

END:
	mov RAX, 0
	pop RBP
	ret
