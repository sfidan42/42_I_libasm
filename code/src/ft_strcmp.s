section .text
global ft_strcmp

ft_strcmp:
	; Inputs:
	;	rdi: const char *s1
	;	rsi: const char *s2
loop:				;	while (true) {
	mov ah, [rdi]	;		ah = *s1
	mov al, [rsi]	;		al = *s2
	cmp ah, 0		;		if (*s1 == 0)
	je end			;			break ;
	cmp al, 0		;		if (*s2 == 0)
	je end			;			break ;
	cmp ah, al		;		if (*s1 != *s2)
	jne end			;			break ;
	inc rdi			;		s1++
	inc rsi			;		s2++
	jmp loop		;	}
end:				;
	mov rax, [rdi]	;	rax = *s1
	sub rax, [rsi]	;	return (rax - *s2);
	ret
