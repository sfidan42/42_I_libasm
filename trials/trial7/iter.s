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
l1:
	cmp dword [rbp - 0x8], 0x4	;	while (i < 5)
	jge end						;	{

	mov rax, [rbp - 0x8]
	lea rsi, [rax * 0x4 + 0x4]
	mov rax, [rbp - 0x18]
	add rsi, rax				;		rsi = arr[i];

	mov rax, [rbp - 0x8]
	lea rdi, [rax * 0x4]
	mov rax, [rbp - 0x18]
	add rdi, rax				;		rsi = arr[i];

	call [rbp - 0x20]			;		f();
	cmp rax, 0x0				;		if (f() > 0)
	jle fi						;		{
	
fi:								;		}

	inc dword [rbp - 0x8]		;		i++;
	jmp l1						;	}
end:
	leave
	ret
