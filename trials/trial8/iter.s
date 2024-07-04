section .data
	str 

section .text
	global ft_list_sort

ft_list_sort:
	; Inputs:
	;	rdi: t_list	**begin_list
	;	rsi: int (*cmp)()
	push rbp
	mov rbp, rsp
	sub rsp, 0x8
	
	mov rax, [rdi]
	mov [rbp - 0x8], rax

l1:
	cmp rax, 0
	je e1



	mov rax, [rax + 0x8]
	jmp l1
e1:

	leave
	ret
