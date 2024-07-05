section .text
	global ft_list_sort

ft_list_sort:
	; Inputs:
	;	rdi: t_list	**begin_list
	;	rsi: int (*cmp)()
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	
	mov rax, [rdi]				;	rax = *begin_list
	mov [rbp - 0x10], rsi		;	backup cmp

	mov [rbp - 0x8], rax		;	ptr2 = rax

l2:
	mov rax, [rbp - 0x8]		;	rax = ptr2
	mov rax, [rax + 0x8]		;	rax = ptr2->next
	cmp rax, 0x0				;	while (ptr2->next)
	je e2						;	{

	mov rsi, [rbp - 0x8]		;		rdi = ptr2
	mov rsi, [rsi + 0x8]		;		rdi = ptr2->next
	mov rsi, [rsi]				;		rdi = ptr2->next->data
	mov rdi, [rbp - 0x8]		;		rsi = ptr2
	mov rdi, [rdi]				;		rsi = ptr2->data

	mov eax, 0x0				;		eax = 0
	call [rbp - 0x10]			;		cmp(ptr2->data, ptr2->next->data)

	cmp eax, 0x0				;		if (cmp(ptr2->data, ptr2->next->data) > 0)
	jle fi						;		{
	
fi								;		}

	mov rax, [rbp - 0x8]		;		rax = ptr2
	mov rax, [rax + 0x8]		;		rax = rax->next
	mov [rbp - 0x8], rax		;		ptr2 = rax
	jmp l2						;	}
e2:

	leave
	ret
