section .text
global ft_read

ft_read:
	; Input:
	; edi - (int fd)
	; rax - (void *buf)
	; rdx - (size_t count)
	;mov edi, edi	;	int fd
	mov rsi, rax	;	const void *buf
	;mov rdx, rdx	;	size_t count
	mov eax, 0		;	read system call number
	syscall
	ret
