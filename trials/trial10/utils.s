section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:
	; Inputs:
	;	rdi: t_list	**begin_list
	;	rsi: void *data_ref
	;	rdx: int (*cmp)()
	push rbp
	mov rbp, rsp
	sub rsp, 0x28
	mov [rbp - 0x8], rdi	;	begin_list
	mov [rbp - 0x10], rsi	;	data_ref
	mov [rbp - 0x18], rdx	;	cmp()

	mov rax, [rdi]			;	rax = *begin_list
	mov rdi, [rax]			;	rdi = (*begin_list)->data
	mov rsi, [rbp - 0x10]	;	rsi = data_ref
	call [rbp - 0x18]		;	rax = cmp((*begin_list)->data, data_ref)
	cmp rax, 0x0			;	if (rax == 0)
	jne fi					;	{
	mov rax, [rbp - 0x8]	;		rax = begin_list
	mov rbx, [rax]			;		rbx = *begin_list
	mov rbx, [rbx + 0x8]	;		rbx = (*begin_list)->next
	mov rdi, [rbp - 0x8]	;		rdi = begin_list
	mov rdi, [rdi]			;		rdi = *begin_list
	mov [rax], rbx			;		*begin_list = (*begin_list)->next
	call free				;		free(head)
fi:							;	}

	mov rax, [rbp - 0x8]	;	rax = begin_list
	mov rax, [rax]			;	rax = *begin_list
	mov [rbp - 0x28], rax	;	current = *begin_list

loop:						;	while (true) {
	mov rax, [rbp - 0x28]	;		rax = current
	mov rbx, [rax + 0x8]	;		next = current->next
	cmp rbx, 0x0			;		if (next == NULL)
	je end					;			break ;
	mov rdi, [rbx]			;		rdi = next->data
	mov rsi, [rbp - 0x10]	;		rsi = data_ref
	call [rbp - 0x18]		;		rax = cmp(next->data, data_ref)
	cmp rax, 0x0			;		if (rax == 0)
	jne fi2					;		{
	mov rax, [rbp - 0x28]	;			rax = current
	mov rdi, [rax + 0x8]	;			rdi = current->next
	mov rsi, [rdi + 0x8]	;			rsi = current->next->next
	mov [rax + 0x8], rsi	;			current->next = current->next->next
	call free				;			free(current->next)
fi2:						;		}
	mov rax, [rbp - 0x28]	;		rax = current
	mov rax, [rax + 0x8]	;		rax = current->next
	mov [rbp - 0x28], rax	;		current = current->next
	jmp loop				;	}
end:
	leave
	ret
