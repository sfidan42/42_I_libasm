section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:
	; Inputs:
	;	rdi: t_list	**begin_list
	;	rsi: void *data_ref
	;	rdx: int (*cmp)()
	;	rcx: void (*free_fct)()
	push rbp
	mov rbp, rsp
	sub rsp, 0x30
	mov [rbp - 0x8], rdi	;	begin_list
	mov [rbp - 0x10], rsi	;	data_ref
	mov [rbp - 0x18], rdx	;	cmp()
	mov [rbp - 0x20], rcx	;	free_fct()
	mov rdi, [rdi]			;	rdi = *begin_list
	mov [rbp - 0x28], rdi	;	node = *begin_list

loop:						;	while (true) {
	mov rdi, [rbp - 0x28]	;		rdi = node
	cmp rdi, 0x0			;		if (!node)
	je end					;			break ;
	mov rdi, [rdi + 0x8]	;		rdi = node->next
	cmp rdi, 0x0			;		if (!node->next)
	je end					;			break ;

	mov rdi, [rdi]			;		rdi = node->next->data
	mov rsi, [rbp - 0x10]	;		rsi = data_ref
	call [rbp - 0x18]		;		rax = cmp(node->next->data, data_ref)
	cmp rax, 0x0			;		if (rax == 0)
	jne fi					;		{
	mov rax, [rbp - 0x28]	;			rax = node
	mov rdi, [rax + 0x8]	;			rdi = node->next
	mov rbx, [rdi + 0x8]	;			rbx = node->next->next
	mov [rax + 0x8], rbx	;			node->next = node->next->next
	call [rbp - 0x20]		;			free_fct(node->next)
	jmp loop				;			continue ;
fi:							;		}

	mov rax, [rbp - 0x28]	;		rax = node
	mov rax, [rax + 0x8]	;		rax = node->next
	mov [rbp - 0x28], rax	;		node = node->next
	jmp loop				;	}
end:
	mov rdi, [rbp - 0x8]	;	rdi = begin_list
	mov rdi, [rdi]			;	rdi = *begin_list
	cmp rdi, 0x0			;	if (!*begin_list)
	je fi2					;		break ;
	mov rdi, [rdi]			;	rdi = (*begin_list)->data
	mov rsi, [rbp - 0x10]	;	rsi = data_ref
	call [rbp - 0x18]		;	rax = cmp((*begin_list)->data, data_ref)
	cmp rax, 0x0			;	if (rax == 0)
	jne fi2					;	{
	mov rax, [rbp - 0x8]	;		rdi = begin_list
	mov rdi, [rax]			;		rdi = *begin_list
	mov rbx, [rdi + 0x8]	;		rbx = (*begin_list)->next
	mov [rax], rbx			;		*begin_list = (*begin_list)->next
	call [rbp - 0x20]		;		free_fct(*begin_list)
fi2:						;	}
	leave
	ret
