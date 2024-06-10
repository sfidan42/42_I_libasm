section .text
global ft_write

ft_write:
	; Input:
	; edi - (int fd)
	; rax - (void *buf)
	; rdx - (size_t count)
	;mov edi, edi	;	int fd
	mov rsi, rax	;	const void *buf
	;mov rdx, rdx	;	size_t count
	mov eax, 1		;	write system call number
	syscall
	ret
