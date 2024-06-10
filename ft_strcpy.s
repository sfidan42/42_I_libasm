section .text
global ft_strcpy

ft_strcpy:
loop:
	cmp byte [rsi], 0	;   while (*src)
	je end				;	{
	mov al, byte [rsi]	;		al = *src
	mov byte [rdi], al	;		*dst = al
	inc rdi				;		dst++;
	inc rsi				;		src++;
	jmp loop			;	}
end:
	mov byte [rdi], 0	;	*dst = 0;
	ret
