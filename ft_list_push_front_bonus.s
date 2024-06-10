section .text
global ft_list_push_front

ft_list_push_front:
	; Input:
	; rdi - address of pointer to head of list (t_list **alst)
	; rsi - pointer to new node (t_list *new)

	cmp rsi, 0			;	if (!new)
	je end				;		return
	cmp rdi, 0			;	if (!alst)
	je end				;		return
	mov rax, [rdi]		;	rax = *alst
	mov [rsi + 8], rax	;	new->next = rax
	mov [rdi], rsi		;	*alst = new
end:
	ret
