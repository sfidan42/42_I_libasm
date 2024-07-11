section .text
global _ft_list_push_front
extern _malloc

_ft_list_push_front:
	; Input:
	; rdi - (t_list **alst)
	; rsi - (void *data)
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	mov [rbp - 0x8], rdi		;	alst
	mov [rbp - 0x10], rsi		;	data

	mov rdi, 0x10				;	rdi = 16
	call _malloc				;	rax = malloc(16)
	mov rsi, [rbp - 0x10]		;	rsi = data
	mov [rax], rsi				;	rsi->data = data
	mov qword [rax + 0x8], 0x0	;	rsi->next = NULL

	mov rdi, [rbp - 0x8]		;	rdi = alst
	mov rsi, [rdi]				;	rsi = *alst
	cmp rsi, 0x0				;	if (*alst)
	je fi						;	{
	mov [rax + 0x8], rsi		;		rax->next = *alst
fi:								;	}
	mov [rdi], rax				;	*alst = rax
	leave
	ret
