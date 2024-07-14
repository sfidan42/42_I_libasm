section .text
global _ft_strcmp

_ft_strcmp:
	; Inputs:
	;	rdi: const char *s1
	;	rsi: const char *s2
	mov rax, 0		;	rax = 0
	mov rdx, 0		;	rdx = 0
loop:				;	while (true) {
	mov al, [rdi]	;		al = *s1
	mov dl, [rsi]	;		dl = *s2
	cmp al, 0x0		;		if (*s1 == 0)
	je end			;			break ;
	cmp dl, 0x0		;		if (*s2 == 0)
	je end			;			break ;
	cmp al, dl		;		if (*s1 != *s2)
	jne end			;			break ;
	inc rdi			;		s1++;
	inc rsi			;		s2++;
	jmp loop		;	}
end:
	sub rax, rdx	;	return (al - dl);
	ret
