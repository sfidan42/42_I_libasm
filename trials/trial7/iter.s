section .text
	global iter

iter:
	; Input:
	;	rdi = rax = int arr[5]   // -0x8[rbp]
	;	rsi = rdx = int (*f)(int) // -0x10[rbp]
	push rbp
	mov rbp, rsp
	sub rsp, 0x20
	mov [rbp - 0x18], rdi		;	int arr[5]
	mov [rbp - 0x10], rsi		;	int (*f)()
	mov qword [rbp - 0x8], 0x0	;	size_t i = 0;
l1:
	cmp qword [rbp - 0x8], 0x4	;	while (i < 4)
	jge end						;	{

	mov rax, [rbp - 0x8]
	lea rsi, [rax * 0x4 + 0x4]
	mov rax, [rbp - 0x18]
	add rsi, rax				;		rsi = arr[i];

	mov rax, [rbp - 0x8]
	lea rdi, [rax * 0x4]
	mov rax, [rbp - 0x18]
	add rdi, rax				;		rdi = arr[i];

	call [rbp - 0x10]			;		rax = f();
	cmp rax, 0x0				;		if (rax > 0)
	jle fi						;		{
	
fi:								;		}

	inc qword [rbp - 0x8]		;		i++;
	jmp l1						;	}
end:
	leave
	ret
