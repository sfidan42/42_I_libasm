section .text
	global ft_list_sort

ft_list_sort:
	; Inputs:
	;	rdi: t_list	**begin_list
	;	rsi: int (*cmp)()
	push rbp
	mov rbp, rsp
	sub rsp, 0x30
	
	mov rax, [rdi]				;	rax = *begin_list
	mov [rbp - 0x18], rax		;	save *begin_list
	mov [rbp - 0x10], rsi		;	save cmp

	mov [rbp - 0x20], rax		;	ptr = *begin_list
l1:
	cmp qword [rbp - 0x20], 0x0	;	while (ptr)
	je e1						;	{
	mov rax, [rbp - 0x18]		;		rax = *begin_list
	mov [rbp - 0x8], rax		;		ptr2 = rax
l2:	
	mov rax, [rbp - 0x8]		;		rax = ptr2
	mov rax, [rax + 0x8]		;		rax = ptr2->next
	cmp rax, 0x0				;		while (ptr2->next)
	je e2						;		{

	mov rsi, [rbp - 0x8]		;			rdi = ptr2
	mov rsi, [rsi + 0x8]		;			rdi = ptr2->next
	mov rsi, [rsi]				;			rdi = ptr2->next->data
	mov rdi, [rbp - 0x8]		;			rsi = ptr2
	mov rdi, [rdi]				;			rsi = ptr2->data

	mov eax, 0x0				;			eax = 0
	call [rbp - 0x10]			;			cmp(ptr2->data, ptr2->next->data)

	cmp eax, 0x0				;			if (cmp(ptr2->data, ptr2->next->data) > 0)
	jle fi						;			{
	mov rax, [rbp - 0x8]		;				rax = ptr2
	mov rdi, [rax]				;				rdi = ptr2->data // next
	mov rbx, [rbp - 0x8]		;				rbx = ptr2
	mov rbx, [rbx + 0x8]		;				rbx = ptr2->next
	mov rsi, [rbx]				;				rsi = ptr2->next->data
	mov [rax], rsi				;				ptr2->data = ptr2->next->data
	mov [rbx], rdi				;				ptr2->next->data = next
fi:								;			}
	mov rax, [rbp - 0x8]		;			rax = ptr2
	mov rax, [rax + 0x8]		;			rax = rax->next
	mov [rbp - 0x8], rax		;			ptr2 = rax
	jmp l2						;		}
e2:
	mov rax, [rbp - 0x20]		;		rax = ptr
	mov rax, [rax + 0x8]		;		rax = ptr->next
	mov [rbp - 0x20], rax		;		ptr = rax
	jmp l1						;	}
e1:
	leave
	ret
