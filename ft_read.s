section .text
global ft_read

ft_read:
	;mov edi, edi	; int fd
	mov rsi, rax	; const void *buf
	;mov rdx, rdx	; size_t count
	mov eax, 0		; read
	syscall
	ret
