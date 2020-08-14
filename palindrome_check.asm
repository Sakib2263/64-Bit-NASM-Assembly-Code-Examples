; Given an input string containing alphanumeric characters. 
; Check whether the string is a palindrome or not. Ignore case of letters in the input.
; For example: 
; Input: AbBa
; Output: Palindrome

segment .data
a: dq 2
b: dq -1
mul: dw "The String is:",0
fmt: dq "%s %s ",10,0
fmt_in: dq "%s", 0
fmt_out: dq "%lld", 0
palin: dq "Palindrome", 10, 0
not_palin: dq "Not Palindrome", 10, 0
new_line: dq "", 10, 0
cnt: dq 0
string_sz: dq 0

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

LOWER_CASE_CONVERT:
	cmp qword[str + RCX], 0
	jz FINISH_CONVERT
	mov RAX, 0
	mov AL, [str + RCX]
	cmp RAX, 97
	jl CONVERT
DONE:
	inc RCX
	jmp LOWER_CASE_CONVERT

CONVERT:
	mov RAX, 0
	mov AL, [str + RCX]
	sub RAX, 32d
	mov [str + RCX], RAX
	jmp DONE

FINISH_CONVERT:
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0

STRING_SIZE:
	cmp qword[str + RCX], 0
	jz FINISH
	inc qword[string_sz]
	inc RCX
	jmp STRING_SIZE


FINISH:
	mov RAX, 0
	mov RBX, [string_sz]
	mov RCX, 0
	dec RBX

COMPARE:
	cmp qword[str + RCX], 0
	jz PALINDROME
	mov [cnt], RCX
	xor RAX, RAX
	mov AL, [str + RCX]
	xor RDX, RDX
	xor DL, [str + RBX]
	cmp RAX, RDX
	jnz NOT_PALINDROME
	mov RCX, [cnt]
	inc RCX
	dec RBX
	jmp COMPARE

PALINDROME:
	mov RDI, palin
	jmp PRINT

NOT_PALINDROME:
	mov RDI, not_palin

PRINT:
	call printf
	mov RDI, new_line
	call printf

END:
	mov RAX, 0
	pop RBP
	ret
