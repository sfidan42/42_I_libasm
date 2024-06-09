section .text
global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc
ft_strdup:
    push rbp
    mov rbp, rsp
    push rsi
    push rdi
    push rbx
    push r12
    push r13
    push r14
    push r15
    mov rsi, rdi
    call ft_strlen
    mov rdi, rax
    call malloc
    mov r12, rax
    mov rdi, rsi
    mov rsi, r12
    call ft_strcpy
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rdi
    pop rsi
    pop rbp
    ret
