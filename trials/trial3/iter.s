section .text
	global iter

iter:
	; Input:
	;	rdi = rax = int arr[5]   // -0x8[rbp]
	;	rsi = rdx = int (*f)(int) // -0x10[rbp]
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	mov [rbp - 0x8], rdi
	mov [rbp - 0x10], rsi
	
	mov rax, [rbp - 0x8]
	mov eax, [rax]
	mov rdx, [rbp - 0x10]
	mov edi, eax
	call rdx
	
	mov rax, [rbp - 0x8]
	mov eax, [rax + 0x4]
	mov rdx, [rbp - 0x10]
	mov edi, eax
	call rdx

	mov rax, [rbp - 0x8]
	mov eax, [rax + 0x8]
	mov rdx, [rbp - 0x10]
	mov edi, eax
	call rdx

	mov rax, [rbp - 0x8]
	mov eax, [rax + 0xc]
	mov rdx, [rbp - 0x10]
	mov edi, eax
	call rdx

	mov rax, [rbp - 0x8]
	mov eax, [rax + 0x10]
	mov rdx, [rbp - 0x10]
	mov edi, eax
	call rdx

	leave
	ret
