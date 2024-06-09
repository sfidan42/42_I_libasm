section .text
global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc
extern printf

ft_strdup:
    call ft_strlen
    push rdi
    mov rdi, rax
    inc rdi
    call malloc
    pop rsi
    mov rdi, rax
    push rax
    call ft_strcpy
    pop rax
    ret
