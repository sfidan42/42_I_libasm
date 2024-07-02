section .text
	global iter

iter:
	; Input:
	;	rdi = rax = int arr[5]   // -0x8[rbp]
	;	rsi = rdx = int (*f)(int) // -0x10[rbp]
	push rbp
	mov rbp, rsp
	sub rsp, 0x20
	mov [rbp - 0x18], rdi		;	int arr
	mov [rbp - 0x20], rsi		;	int (*f)()
	mov dword [rbp - 0x8], 0x0	;	int i = 0;
loop:
	cmp dword [rbp - 0x8], 0x5	;	while (i < 5)
	jge end					;	{

	mov rax, [rbp - 0x8]
	lea rsi, [rax * 4]
	mov rax, [rbp - 0x18]
	add rsi, rax				;		rsi = arr[i];

	mov rax, [rbp - 0x8]
	lea rdi, [rax * 4]
	mov rax, [rbp - 0x18]
	add rdi, rax				;		rsi = arr[i];

	call [rbp - 0x20]			;		f();
	inc dword [rbp - 0x8]		;		i++;
	jmp loop					;	}
end:
	leave
	ret
