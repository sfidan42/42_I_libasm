section .text
	global _ft_atoi_base
	extern _ft_strlen
	extern _isspace
	extern _strchr

ret0:
	mov rax, 0x0
	leave
	ret

valid_base:
	; Inputs:
	;	rdi: char *base
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	mov [rbp - 0x8], rdi	;	save base
	call _ft_strlen			;	rax = strlen(base)
	cmp rax, 0x2			;	if (rax < 2)
	jl ret0					;		return (false);
.l1:						;	while (1) {
	mov rsi, [rbp - 0x8]	;		rsi = base
	cmp byte [rsi], 0x0		;		if (*base == '\0')
	je .e1					;			break ;
	
	mov edi, [rsi]			;		rdi = *base
	call _isspace			;		rax = isspace(*base)
	cmp rax, 0x0			;		if (rax)
	je ret0					;			return (false);

	mov rsi, [rbp - 0x8]	;		rsi = base
	cmp byte [rsi], 0x2b	;		if (*base == '+')
	je ret0					;			return (false);
	cmp byte [rsi], 0x2d	;		if (*base == '-')
	je ret0					;			return (false);

	lea rbx, [rsi + 0x1]	;		rbx = base + 1
.l2:						;		while (true) {
	cmp byte [rbx], 0x0		;			if (*tmp == '\0')
	je .l1					;				break ;
	mov dh, [rbx]			;			dh = *tmp
	cmp dh, [rsi]			;			if (*tmp == *base)
	je ret0					;				return (false);
	inc rbx					;			tmp++;
	jmp .l2					;		}
.e2:
	inc rsi
	mov [rbp - 0x8], rsi	;		base++;
	jmp .l1					;	}
.e1:
	mov rax, 0x1
	leave
	ret

;static bool	valid_base(char *base)
;{
;	if (strlen(base) < 2)
;		return false;
;	while (*base)
;	{
;		if (isspace(*base) || *base == '+' || *base == '-')
;			return false;
;		char *tmp = base + 1;
;		while (*tmp)
;		{
;			if (*tmp == *base)
;				return false;
;			tmp++;
;		}
;		base++;
;	}
;	return true;
;}

_ft_atoi_base:
	; Inputs:
	;	rdi: const char *str
	;	rsi: const char *base
	push rbp
	mov rbp, rsp
	sub rsp, 0x30
	mov [rbp - 0x8], rdi		;	save str
	mov [rbp - 0x10], rsi		;	save base
	mov qword [rbp - 0x18], 0x0	;	is_neg = false
	mov qword [rbp - 0x20], 0x0	;	nb = 0
	mov qword [rbp - 0x28], 0x0	;	radix = 0

	mov rdi, rsi				;	rdi = base
	call valid_base			;	rax = valid_base(base)
	cmp rax, 0x0				;	if (!rax)
	je ret0						;		return (0);

.l1:							;	while (1) {
	mov rdi, [rbp - 0x8]		;		rdi = str
	mov rdi, 0x0				;		rdi = 0
	mov dl, byte [rdi]			;		dl = *rdi
	call _isspace				;		rax = isspace(rdi)
	cmp rax, 0x0				;		if (!rax)
	je .e1						;			break ;
	inc qword [rbp - 0x8]		;		str++;
	jmp .l1						;	}
.e1:
	mov rax, 0x0				;	rax = false
	mov rsi, [rbp - 0x8]		;	rsi = str
.l2:							;	while (1) {
	cmp byte [rsi], 0x2b		;		if (*str != '+')
	jne .e2						;			break ;
	cmp byte [rsi], 0x2d		;		if (*str != '-')
	jne .e2						;			break ;
	cmp byte [rsi], 0x2d		;		if (*str == '-')
	jne .fi						;		{
	not rax						;			rax = !rax
.fi:							;		}
	inc qword [rbp - 0x8]		;		str++;
	jmp .l2						;	}
.e2:
	mov [rbp - 0x18], rax		;	is_neg = rax
	mov rdi, [rbp - 0x10]		;	rdi = base
	call _ft_strlen				;	rax = strlen(base)
	mov [rbp - 0x28], rax		;	radix = rax
.l3:							;	while (1) {
	mov rdi, [rbp - 0x10]		;		rdi = base
	mov rsi, [rbp - 0x8]		;		rsi = str
	mov rsi, [rsi]				;		rsi = *str
	cmp byte [rsi], 0x0			;		if (*str == '\0')
	je .e3						;			break ;
	call _strchr				;		rax = strchr(base, *str)
	cmp rax, 0x0				;		if (!rax)
	je .e3						;			break ;

	mov rdx, [rbp - 0x28]		;		rdx = radix
	mov rbx, [rbp - 0x20]		;		rbx = nb
	imul rbx, rdx				;		rbx *= radix
	sub rax, [rbp - 0x10]		;		rax -= base
	add rbx, rax				;		rbx += rax
	mov [rbp - 0x20], rbx		;		nb = rbx

	inc qword [rbp - 0x8]		;		str++;
	jmp .l3						;	}
.e3:
	mov rax, [rbp - 0x20]		;	rax = nb
	cmp byte [rbp - 0x18], 0x0	;	if (!is_neg)
	je .end						;		return (nb);
	neg rax						;	rax = -nb
.end:
	leave
	ret

;int ref_ft_atoi_base(char *str, char *base)
;{
;	long int nb;
;	int radix;
;	bool is_negative;
;
;	if (!valid_base(base))
;		return 0;
;	while (isspace(*str))
;		str++;
;	is_negative = false;
;	while (*str == '+' || *str == '-')
;		if (*str++ == '-')
;			is_negative = !is_negative;
;	radix = strlen(base);
;	nb = 0;
;	while (*str && strchr(base, *str) != NULL)
;	{
;		nb *= radix;
;		nb += strchr(base, *str) - base;
;		str++;
;	}
;	return is_negative ? -nb : nb;
;}
