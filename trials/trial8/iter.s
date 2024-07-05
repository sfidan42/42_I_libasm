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
	mov [rbp - 0x8], rax		;	ptr = rax
	mov [rbp - 0x10], rsi		;	backup cmp

l1:
	mov rax, [rbp - 0x8]		;	rax = ptr
	mov rax, [rax + 0x8]		;	rax = ptr->next
	cmp rax, 0x0				;	while (ptr->next)
	je e1						;	{

	mov rsi, [rbp - 0x8]		;		rdi = ptr
	mov rsi, [rsi + 0x8]		;		rdi = ptr->next
	mov rsi, [rsi]				;		rdi = ptr->next->data
	mov rdi, [rbp - 0x8]		;		rsi = ptr
	mov rdi, [rdi]				;		rsi = ptr->data

	mov eax, 0x0				;		eax = 0
	call [rbp - 0x10]			;		cmp(ptr->data, ptr->next->data)

	mov rax, [rbp - 0x8]		;		rax = ptr
	mov rax, [rax + 0x8]		;		rax = rax->next
	mov [rbp - 0x8], rax		;		ptr = rax
	jmp l1						;	}
e1:

	leave
	ret
