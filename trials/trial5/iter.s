section .text
	global iter

iter:
	; Input:
	;	rdi = rax = int arr[5]   // -0x8[rbp]
	;	rsi = rdx = int (*f)(int) // -0x10[rbp]
	push rbp
	mov rbp, rsp
	sub rsp, 0x20
	mov [rbp - 0x18], rdi
	mov [rbp - 0x20], rsi
	mov dword [rbp - 0x8], 0x0
loop:
	cmp dword [rbp - 0x8], 0x5
	jge end

	mov rax, [rbp - 0x8]
	lea rdx, [rax * 4]
	mov rax, [rbp - 0x18]
	lea rcx, [rax + rdx]
	mov rax, [rbp - 0x8]
	lea rdx, [rax * 4]
	mov rax, [rbp - 0x18]
	add rdx, rax
	mov rax, [rbp - 0x20]
	mov rsi, rcx
	mov rdi, rdx
	call rax

	inc dword [rbp - 0x8]
	jmp loop
end:

	leave
	ret
