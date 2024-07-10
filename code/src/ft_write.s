section .text
global ft_write
extern __errno_location

ft_write:
	; Input:
	; edi - (int fd)
	; rax - (void *buf)
	; rdx - (size_t count)
	;mov edi, edi	;	int fd
	;mov rsi, rax	;	const void *buf
	;mov rdx, rdx	;	size_t count
	mov eax, 1		;	write system call number
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

