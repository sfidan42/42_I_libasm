section .data
    hello db 'Hello, World!',0

section .text
    global foo
    extern puts

foo:
    push rbp
    mov rbp, rsp

    ; puts(hello)
    lea rdi, [rel hello]
    call puts

    mov rsp, rbp
    pop rbp
    ret