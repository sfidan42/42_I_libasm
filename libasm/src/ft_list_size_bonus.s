section .text
global _ft_list_size

_ft_list_size:
	; Input:
	;	rdi = t_list* lst
	; Output:
	;	eax = size of the list
	mov rax, 0			;	rax = 0;
loop:					;	while (true) {
	cmp rdi, 0			;		if (rdi == NULL)
	je end				;			break ;
	inc rax				;		rax++ ;
	mov rdi, [rdi + 8]	;		rdi = rdi->next
	jmp loop			;	}
end:					;	return (rax) ;
	ret
