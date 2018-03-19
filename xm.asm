segment .data
fmt: db "string: %d",10,0
token_: db "%c" ,0
array_print: db "%d "

segment .bss
var1: resq 100
var2: resq 1
size_array: resq 1000
n: resq 8

segment .text
extern printf
extern scanf
extern gets

global main

main:

push RBP
	mov rax,0
	mov rbx,0
	mov rcx,0
	mov rdx,0
	;mov rsi,0



	
	
        mov rdi, var1
	call gets

	mov rdi,token_
	mov rsi, var2
	call scanf

	;mov rdi,fmt
	;mov rsi,[var2]
	;call printf

	XOR r15,r15
	mov RCX, var1
	XOR r8,r8
	XOR r9,r9
	mov RBX,size_array

	;mov rdi,fmt
	;mov rsi,RCX
	;call printf



string_check:

		
	mov RDX,0
	mov dl,[RCX]
        add RCX,1

	cmp RDX,0
	je print_level
		
        cmp RDX, [var2]
        je size

	
	add r8,1

	

	
	jmp string_check


size:

	mov [RBX+r9],r8
	XOR r8,r8
	add r9,8
	jmp string_check
	
	


print_level:

	mov [RBX+r9],r8
	mov RBX,0
	add r9,8

	

start:	mov RDI,array_print
	mov RSI, [size_array+RBX]	
	push RBX
	push r9
	mov RAX,0
	call printf
	
	pop r9
	pop RBX
	add RBX,8

	cmp RBX,r9
	jne start

Exit:

        




pop RBP
ret
