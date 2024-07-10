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
	cmp rax, 0x0
	jl err_ret
	ret

err_ret:
	neg	rax
	mov rdx, rax
	call __errno_location
	mov [rax], rdx
	mov rax, -1
	ret
