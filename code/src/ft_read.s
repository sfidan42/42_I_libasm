section .text
global _ft_read
extern ___error

_ft_read:
	; Input:
	; edi - (int fd)
	; rsi - (void *buf)
	; rdx - (size_t count)
	mov		rax, 0x02000003	; read system call number
	syscall
	jc		err_ret			; jump if carry flag is set
	ret

err_ret:
	push	rax
	call	___error
	pop		rdx			;	rdx = old rax
	mov		[rax], rdx	;	*___error() = old rax
	mov		rax, -1		;	return (-1);
	ret
