; Take an integer from the use to form the following structure.
; Input: 3
; Output:
;   *
;  ***
; *****


segment .data
n: dq 2
fmt_in: dq "%lld", 0
new_line: dq "", 10, 0
fmt_out: dq "*", 0
fmt_pattern_output: dq "Output:", 10, 0
spc: dq " ", 0
cnt: dq 0
cnt_tmp: dq 0
outer_cnt: dq 0
size: dq 0
space: dq 0
stars: dq 0

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RBX, 0
mov RCX, 0

mov RDI, fmt_in
mov RSI, n
call scanf
mov RDI, fmt_pattern_output
call printf
mov RDI, new_line
call printf

mov RAX, [n]
dec RAX
mov [space], RAX
mov RAX, 0
mov RBX, 0
mov RCX, 0

OUTER_LOOP:
	cmp RCX, [n]
	jz END
	mov [outer_cnt], RCX
	mov RCX, 0
	mov RAX, 0

	SPACE_LOOP:
		cmp RCX, [space]
		jz DONE
		mov [cnt_tmp], RCX
		mov RDI, spc
		call printf
		mov RCX, [cnt_tmp]
		inc RCX
		jmp SPACE_LOOP

	DONE:
		mov RAX, [outer_cnt]
		add RAX, RAX
		inc RAX
		mov [stars], RAX
		mov RAX, 0
		mov RCX, 0
		
	STAR_LOOP:
		cmp RCX, [stars]
		jz FINISH_ROW
		mov [cnt_tmp], RCX
		mov RDI, fmt_out
		call printf
		mov RCX, [cnt_tmp]
		inc RCX
		jmp STAR_LOOP

	FINISH_ROW:
		mov RDI, new_line
		call printf
		mov RCX, [outer_cnt]
		dec qword[space]
		inc RCX
		jmp OUTER_LOOP

END:
	mov RDI, new_line
	call printf
	mov RAX, 0
	pop RBP
	ret
