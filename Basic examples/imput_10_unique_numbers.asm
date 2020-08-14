; Given an array of size 10. You are to take 10 inputs from the keyboard. 
; All the number will have to be unique. If you give a duplicate number, it will not be included in the array. 
; Finally your array will contain 10 unique number.
; For Example:
; Input: 5
; Output: Give 9 more numbers.
; Input: 5
; Output: Number already exists. Give 9 more numbers.
; Input: 7
; Output: Give 8 more numbers.
; …
; …
; …
; Input: 26
; Output: The 10 numbers are 5, 7, …, 26


segment .data
a: dq 2
b: dq -1
mul: dw "The String is:",0
fmt: dq "%s %s ",10,0
fmt_in: dq "%lld", 0
fmt_out: dq "%lld", 0
new_line: dq "", 10, 0
spc: dq " ", 0
cnt: dq 0
string_sz: dq 0
val: dq 0
temp: dq 0
required: dq 10
fmt_out2: dq "The 10 numbers are : ", 10, 0
fmt_not_found: dq "Give %lld more numbers", 10, 0
fmt_found: dq "Number already exists. Give %lld more numbers", 10, 0
fmt_debug: dq "HERE: ", 10, 0

section .bss
array: resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RBX, 0
mov RCX, 0

INPUT:
	cmp RCX, 10
	jz END
	mov [cnt], RCX

	mov RAX, 0
	mov RBX, 0
	mov RDI, fmt_in
	mov RSI, val
	call scanf
	jmp COMPARE

DONE:
	mov RCX, [cnt]
	jmp INPUT

COMPARE:
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0
	

	LOOP_ARRAY:
		cmp RCX, [cnt]
		jz NOT_FOUND
		mov RAX, [array + RCX*8]
		cmp RAX, [val]
		jz FOUND
		inc RCX
		jmp LOOP_ARRAY 

	NOT_FOUND:
		mov RCX, [cnt]
		mov RAX, [val]
		mov [array + RCX*8], RAX
		dec qword[required]
		inc RCX
		mov [cnt], RCX
		mov RCX, [required]
		cmp RCX, 0
		jz FINISH
		mov RDI, fmt_not_found
		mov RSI, [required]
		call printf
		mov RDI, new_line
		call printf
		jmp DONE

	FOUND:
		mov RDI, fmt_found
		mov RSI, [required]
		call printf
		mov RDI, new_line
		call printf

	jmp DONE

FINISH:
	mov RDI, fmt_out2
	call printf
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0

PRINT_INPUT:
	cmp RCX, 10
	jz END
	mov [cnt], RCX
	mov RDI, fmt_out
	mov RSI, [array + RCX*8]
	call printf
	mov RDI, spc
	call printf
	mov RCX, [cnt]
	inc RCX
	jmp PRINT_INPUT


END:
	mov RDI, new_line
	call printf
	mov RAX, 0
	pop RBP
	ret
