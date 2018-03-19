segment .data
in: db "%ld %ld %ld",0
out: db "%ld",10,0
test: db "%d %d",10,0


segment .bss
n1: resq 1
n2: resq 1
n3: resq 1
lcm2: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp

mov rdi,in
mov rsi,n1
mov rdx,n2
mov rcx, n3
mov rax,0
call scanf


mov r8,[n1]	;x
mov r9,[n2] 	;y
mov r10,[n3] 	;z

gcd:
	
	mov r13, r8	;temp = x		
	mov rax, r9	;x = y%x
	xor rdx,rdx
	div r8
	mov r8, rdx
	mov r9, r13
	
	cmp r8, 0
	je gcddone
	jmp gcd

gcddone:

	
	xor rax, rax
	mov rax, [n1]
	mov r14, [n2]
	imul r14
	xor rdx, rdx
	div r9
	mov [lcm2], rax


mov r8, [lcm2]
mov r9, [n3]

gcd2:	
	mov r13, r8	;temp = x
		
	mov rax, r9	;x = y%x
	xor rdx,rdx
	div r8
	mov r8, rdx
	mov r9, r13
	
	cmp r8, 0
	je gcddone2
	jmp gcd2

gcddone2:
	
	xor rax, rax
	mov rax, [lcm2]
	mov r14, [n3]
	imul r14
	xor rdx, rdx
	div r9
	mov [lcm2], rax

	mov rdi, out
	mov rsi, [lcm2]
	xor rax,rax
	call printf
	

	
pop rbp
ret
