section .text
global ft_write

ft_write:
	mov edi, edi	; int fd
	mov rsi, rax	; const void *buf
	mov rdx, rdx	; size_t count
	mov eax, 1		; write
	syscall
	ret
