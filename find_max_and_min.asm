; Write a program which reads 5 numbers into an array and prints the smallest and largest
; number and their location in the array.
; If the user enters 7, 13, -5, 10, 6 then your program should print
; “Smallest number -5 was found at location 2”.
; “Largest number 13 was found at location 1”.

segment .data
a: dq 2
b: dq 0
ind: dq 0
cnt: dq 0
cnt2: dq 0
mini: dq 0
maxi: dq 0
min_pos: dq 0
max_pos: dq 0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 0
fmt_out_max: dq "The largest number at index %lld is: %lld ", 10, 0
fmt_out_min: dq "The smallest number at index %lld is: %lld ", 10, 0

segment .bss
array resq 21
array2 resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RCX, 0
mov RBX, 0

INPUT_ARRAY: 
	cmp RCX, 5
	jz DONE
	mov [cnt], RCX
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, [a]
	mov RCX, [cnt]
	mov [array+RCX*8], RAX
	mov [array2+RCX*8], RAX
	add RBX, [a]	
	inc RCX	
	jmp INPUT_ARRAY 

DONE:
	mov RAX, 0
	mov RCX, 0
	mov RBX, 0	

OUTER_LOOP:
	cmp RCX, 5
	jge END_LOOP
	mov [cnt], RCX
	mov RAX, [array+RCX*8]

INNER_LOOP:
	inc RCX
	cmp RCX, 5
	jz OK 
	cmp RAX, [array+RCX*8]		
	jle INNER_LOOP		
	xchg RAX, [array+RCX*8]
	jmp INNER_LOOP

OK:
	mov RCX, [cnt]
	mov [array+RCX*8], RAX
	inc RCX
	jmp OUTER_LOOP

END_LOOP:
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0
	mov RAX, [array+RCX*8]
	mov [mini], RAX

	mov RCX, 4	
	mov RAX, [array+RCX*8]
	mov [maxi], RAX
	

	mov RCX, 0
	mov RAX, 0
	mov RBX, 0	

FIND_MAX:
	cmp RCX, 5
	mov [cnt], RCX	
	jz PRINT_MAX
	mov RAX, [maxi]
	mov RBX, [array2+RCX*8]
	cmp RAX, RBX
	jz PRINT_MAX
	mov RCX, [cnt]
	inc RCX
	jmp FIND_MAX

PRINT_MAX:
	mov RAX, [maxi]
	mov RDI, fmt_out_max
	mov RSI, RCX
	mov RDX, RAX
	call printf
	mov RCX, 0
	mov RAX, 0
	mov RBX, 0

FIND_MIN:
	cmp RCX, 5
	mov [cnt], RCX	
	jz PRINT_MIN
	mov RAX, [mini]
	mov RBX, [array2+RCX*8]
	cmp RAX, RBX
	jz PRINT_MIN
	mov RCX, [cnt]
	inc RCX
	jmp FIND_MIN

PRINT_MIN:
	mov RAX, [mini]
	mov RDI, fmt_out_min
	mov RSI, RCX
	mov RDX, RAX
	call printf


END:
	mov RAX, 0
	pop RBP
ret
