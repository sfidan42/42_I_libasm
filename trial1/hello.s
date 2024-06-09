extern puts
extern exit

section .text
global _start

%macro call_func 1
    call %1
%endmacro

_start:
    mov rdi, hello
    call_func puts

    mov rax, 0xa
    call exit

section .data
    hello db "Hello World"
