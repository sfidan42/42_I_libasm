extern puts

section .text
global hello

hello:
    mov rdi, message
    call puts
    ret

section .data
    message db "Hello", 0, 0
