section .text
global _ft_strlen

_ft_strlen:
	; Input:
	;	rdi: const char *str
	mov rax, rdi
loop:
	cmp byte [rax], 0	;	while (*str)
	je end				;	{
	inc rax				;		str++;
	jmp loop			;	}
end:
	sub rax, rdi		;	return (str - begin);
	ret
