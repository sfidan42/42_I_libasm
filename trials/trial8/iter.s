section .text
	global ft_list_sort

ft_list_sort:
	; Inputs:
	;	rdi: t_list	**begin_list
	;	rsi: int (*cmp)()
	push rbp
	mov rbp, rsp
	sub rsp, 0x8
	
	mov rax, [rdi]			;	rax = *begin_list
	mov [rbp - 0x8], rax	;	ptr = rax

l1:							;	while (1) {
	cmp qword [rbp - 0x8], 0			;	if (ptr == 0)
	je e1						;		break ;



	mov rax, [rbp - 0x8]		;	rax = ptr
	mov rax, [rax + 0x8]		;	rax = rax->next
	mov [rbp - 0x8], rax		;	ptr = rax
	jmp l1					;	}
e1:

	leave
	ret
