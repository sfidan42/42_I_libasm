section .text
global ft_strlen

ft_strlen:
loop:
	cmp byte [rax], 0	;	while (*str)
	je end				;	{
	inc rax				;		str++;
	jmp loop			;	}
end:
	sub rax, rdi		;	return (str - begin);
	ret
