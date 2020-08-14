;    *
;   **
;  * *
; *  *
;*****
;When input is 5



SECTION .data
	scanfmt db "%d",0
	spc db " ",0
	star db "*",0
	printfmt db "%d ",0
	newline db 10,0


SECTION .bss
	n resq 1

SECTION .txt 
	extern printf
	extern scanf
global main

main:
	mov rdi, scanfmt
	mov rsi, n
	mov al,0
	call scanf

	xor rcx,rcx
	mov rcx, [n]
	mov r10, 1
	

l1:

	push r10
	mov r11, r10
   spcloop:
	
	push r11

	mov rdi, spc
	;mov rsi, r11
	mov rax,0
	call printf

	pop r11
	inc r11
	cmp r11, [n]
	jl spcloop

	pop r10
	mov r12, 1
	mov rcx, r10
	imul rcx,2
	sub rcx, 1
	push r10

   innerloop:
	push r12
	push rcx
	cmp r12, 1
	je printstar

	cmp r12, r10
	je printstar
	
      
      printspace:
	mov rdi, spc
	mov rax, 0
	call printf
	jmp cont
	
      printstar:
	mov rdi, star
	mov rax,0
	call printf
      cont:
	pop rcx
	pop r12
	inc r12
	cmp r12, rcx
	jle innerloop

	
out:
	pop r10
	
	mov rdi, newline
	mov rax, 0
	push r10
	call printf
	pop r10

	add r10,1
	cmp r10, [n]
	jge lastline
	jmp l1
	

lastline:
	mov rcx, [n]
	;imul rcx,2
	;sub rcx,1
  printstr:
	mov rdi, star
	mov rax, 0
	push rcx
	call printf
	pop rcx
	
	dec rcx
	cmp rcx,0
	jne printstr
	
	
mov rdi, newline
mov rax,0
call printf	

exit:
	ret
