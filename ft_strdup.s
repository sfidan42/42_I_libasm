section .text
global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc
extern printf

ft_strdup:
	call ft_strlen	;	rax = ft_strlen(s1)
	push rdi		;	save s1
	mov rdi, rax	;	rdi = rax
	inc rdi			;	rdi++
	call malloc		;	rax = malloc(rdi);
	pop rsi			;	rsi = s1
	mov rdi, rax	;	rdi = rax
	call ft_strcpy	;	ft_strcpy(rax, s1); or ft_strcpy(rdi, rsi);
	ret
