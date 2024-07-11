section .text
global _ft_strcpy

_ft_strcpy:
	; Input:
	; rdi - (char *dst)
	; rsi - (char *src)
	push rdi
loop:					;	while (true) {
	mov al, [rsi]		;		al = *src
	cmp al, 0x0			;   	if (al == 0)
	je end				;			break ;
	mov byte [rdi], al	;		*dst = al
	inc rdi				;		dst++;
	inc rsi				;		src++;
	jmp loop			;	}
end:
	mov byte [rdi], 0	;	*dst = 0;
	pop rax
	ret
