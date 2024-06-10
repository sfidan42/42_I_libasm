section .text
global ft_strcmp

ft_strcmp:				;	while (true)
loop:					;	{
	cmp byte [rdi], 0	;		if (*s1 == 0)
	je end				;			break ;
	cmp byte [rsi], 0	;		if (*s2 == 0)
	je end				;			break ;
	mov al, [rdi]		;		al = *s1
	cmp al, byte [rsi]	;		if (al != *s2)
	jne end				;			break ;
	inc rdi				;		s1++;
	inc rsi				;		s2++;
	jmp loop			;	}
end:					;
	mov rax, [rdi]		;	rax = *s1
	sub rax, [rsi]		;	return (rax - *s2);
	ret
