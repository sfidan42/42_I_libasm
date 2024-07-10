section .text
global ft_read
extern __errno_location

ft_read:
	; Input:
	; edi - (int fd)
	; rsi - (void *buf)
	; rdx - (size_t count)
	mov rax, 0x0	;	read system call number
	syscall
	cmp rax, 0x0	;	if (rax < 0)
	jl err_ret		;		goto err_ret
	ret				;	return (rax);

err_ret:
	neg	rax
	mov rdx, rax
	call __errno_location
	mov [rax], rdx			;	*__errno_location() = -rax
	mov rax, -1				;	return (-1);
	ret
