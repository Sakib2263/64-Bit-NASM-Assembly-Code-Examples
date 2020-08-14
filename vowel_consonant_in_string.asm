; Given an input string (upper case letters only). Count the number of vowels and
; consonants in the string. For example, if the user gives “this is a string.” Then your
; program should print
; “Given input: this is a string”
; “Vowels: 8 Consonants: 15”

segment .data
a: dq 2
b: dq -1
fmt: dq "%s %s ",10,0
fmt_in: dq "%s", 0
fmt_out: dq "The String is: %s", 10, 0
fmt_out_nxt: dq "Vowels: %lld, Consonants: %lld", 10, 0
fmt_character: dq "The character is: %c", 10, 0
fmt_debug: dq "HERE : %c", 10, 0
new_line: dq "", 10, 0
cnt: dq 0
tmp: dq 0
vowel: dq 0
consonant: dq 0

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

mov RAX, 0
mov RBX, 0
mov RCX, 0

SCAN_STRING:
	cmp byte[str + RCX], 0
	jz PRINT
	mov [cnt], RCX
	mov RAX, 0
	mov AL, [str + RCX]
	mov [tmp], RAX

	
	mov RAX, 0
	mov RBX, 0
	mov RAX, qword[tmp]

	mov RBX, 65
	cmp RAX, RBX
	jz INC_VOWEL
	
	mov RBX, 69
	cmp RAX, RBX
	jz INC_VOWEL
	
	mov RBX, 73
	cmp RAX, RBX
	jz INC_VOWEL
	
	mov RBX, 79
	cmp RAX, RBX
	jz INC_VOWEL
	
	mov RBX, 85
	cmp RAX, RBX
	jz INC_VOWEL

	jmp INC_CONS

INC_VOWEL:
	inc qword[vowel]
	mov RCX, [cnt]
	inc RCX
	jmp SCAN_STRING

INC_CONS:
	inc qword[consonant]
	mov RCX, [cnt]
	inc RCX
	jmp SCAN_STRING

PRINT:
	mov RAX, 0
	mov RDI, fmt_out
	mov RSI, str
	call printf
	mov RDI, new_line
	call printf
	mov RDI, fmt_out_nxt
	mov RSI, [vowel]
	mov RDX, [consonant]
	call printf
	mov RDI, new_line
	call printf

END:
	mov RAX, 0
	pop RBP
	ret
