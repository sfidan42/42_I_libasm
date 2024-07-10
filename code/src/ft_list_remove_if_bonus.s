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
	sub rsp, 0x30
	mov [rbp - 0x8], rdi	;	begin_list
	mov [rbp - 0x10], rsi	;	data_ref
	mov [rbp - 0x18], rdx	;	cmp()
	mov rdi, [rdi]			;	rdi = *begin_list
	mov [rbp - 0x20], rdi	;	node = *begin_list

loop:						;	while (true) {
	mov rdi, [rbp - 0x20]	;		rdi = node
	mov rdi, [rdi + 0x8]	;		rdi = node->next
	cmp rdi, 0x0			;		if (!node->next)
	je end					;			break ;

	mov rdi, [rdi]			;		rdi = node->next->data
	mov rsi, [rbp - 0x10]	;		rsi = data_ref
	call [rbp - 0x18]		;		rax = cmp(node->next->data, data_ref)

	mov rax, [rbp - 0x20]	;		rax = node
	mov rax, [rax + 0x8]	;		rax = node->next
	mov [rbp - 0x20], rax	;		node = node->next
	jmp loop				;	}
end:

	leave
	ret
