section .text
	global _ft_atoi_base
	extern _ft_strlen
	extern _isspace
	extern _strchr
	global _valid_base

ret0:
	mov rax, 0x0
	leave
	ret

_valid_base:
	; Inputs:
	;	rdi: char *base
	push rbp
	mov rbp, rsp
	sub rsp, 0x10
	mov [rbp - 0x8], rdi	;	save base
	call _ft_strlen			;	eax = strlen(base)
	cmp eax, 0x2			;	if (eax < 2)
	jl ret0					;		return (false);
.l1:						;	while (1) {
	mov rsi, [rbp - 0x8]	;		rsi = base
	cmp byte [rsi], 0x0		;		if (*base == '\0')
	je .e1					;			break ;
	cmp byte [rsi], 0x9		;		if (*base == '\t')
	je ret0					;			return (false);
	cmp byte [rsi], 0xa		;		if (*base == '\n')
	je ret0					;			return (false);
	cmp byte [rsi], 0xb		;		if (*base == '\v')
	je ret0					;			return (false);
	cmp byte [rsi], 0xc		;		if (*base == '\f')
	je ret0					;			return (false);
	cmp byte [rsi], 0xd		;		if (*base == '\r')
	je ret0					;			return (false);
	cmp byte [rsi], 0x20	;		if (*base == ' ')
	je ret0					;			return (false);
	cmp byte [rsi], 0x2b	;		if (*base == '+')
	je ret0					;			return (false);
	cmp byte [rsi], 0x2d	;		if (*base == '-')
	je ret0					;			return (false);

	inc rsi
	mov [rbp - 0x8], rsi	;		base++;
	jmp .l1					;	}
.e1:
	mov rax, 0x1
	leave
	ret

;bool valid_base(char *base)
;{
;	if (strlen(base) < 2)
;		return false;
;	while (1)
;	{
;		if (*base == 0)
;			break ;
;		if (isspace(*base) || *base == '+' || *base == '-')
;			return false;
;		if (strchr(base + 1, *base))
;			return false;
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
	call _valid_base			;	rax = valid_base(base)
	cmp rax, 0x0				;	if (!rax)
	je ret0						;		return (0);

.l1:							;	while (1) {
	mov rdi, [rbp - 0x8]		;		rdi = str
	cmp byte [rdi], 0x9			;		if (*str != '\t')
	jne .e1						;			break ;
	cmp byte [rdi], 0xa			;		if (*str != '\n')
	jne .e1						;			break ;
	cmp byte [rdi], 0xb			;		if (*str != '\v')
	jne .e1						;			break ;
	cmp byte [rdi], 0xc			;		if (*str != '\f')
	jne .e1						;			break ;
	cmp byte [rdi], 0xd			;		if (*str != '\r')
	jne .e1						;			break ;
	cmp byte [rdi], 0x20		;		if (*str != ' ')
	jne .e1						;			break ;
	inc qword [rbp - 0x8]		;		str++;
	jmp .l1						;	}
.e1:

	mov rax, 0x0				;	rax = false
	mov rsi, [rbp - 0x8]		;	rsi = str
.l2:							;	while (1) {
	cmp byte [rsi], 0x2d		;		if (*str == '-')
	jne .fi1					;		{
	not rax						;			is_neg = !is_neg
	inc rsi						;			rsi++;
	mov [rbp - 0x8], rsi		;			str = rsi;
	jmp .l2						;			continue ;
.fi1:							;		}
	cmp byte [rsi], 0x2b		;		if (*str == '+')
	je .fi2						;		{
	inc rsi						;			rsi++;
	mov [rbp - 0x8], rsi		;			str = rsi;
	jmp .l2						;			continue ;
.fi2:							;		}
	jmp .e2						;	}
.e2:
	mov [rbp - 0x18], rax		;	is_neg = rax
	mov rdi, [rbp - 0x10]		;	rdi = base
	call _ft_strlen				;	rax = strlen(base)
	mov [rbp - 0x28], rax		;	radix = rax
.l3:							;	while (1) {
	mov rdi, [rbp - 0x10]		;		rdi = base
	mov rsi, [rbp - 0x8]		;		rsi = str
	cmp byte [rsi], 0x0			;		if (*str == '\0')
	je .e3						;			break ;
;	call _strchr				;		rax = strchr(base, *str)
;	cmp rax, 0x0				;		if (!rax)
;	je .e3						;			break ;
;
;	mov rdx, [rbp - 0x28]		;		rdx = radix
;	mov rbx, [rbp - 0x20]		;		rbx = nb
;	imul rbx, rdx				;		rbx *= radix
;	sub rax, [rbp - 0x10]		;		rax -= base
;	add rbx, rax				;		rbx += rax
;	mov [rbp - 0x20], rbx		;		nb = rbx
;
	inc qword [rbp - 0x8]		;		str++;
	jmp .l3						;	}
.e3:
;	mov rax, [rbp - 0x20]		;	rax = nb
;	cmp byte [rbp - 0x18], 0x0	;	if (!is_neg)
;	je .end						;		return (nb);
;	neg rax						;	rax = -nb
;.end:
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
