section .text
global ft_strlen

ft_strlen:
loop:
    cmp byte [rax], 0
    je end
    inc rax
    jmp loop
end:
    sub rax, rdi
    ret
