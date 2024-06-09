section .text
global ft_strcmp

ft_strcmp:
loop:
    cmp byte [ rdi ], 0
    je end
    cmp byte [ rsi ], 0
    je end
    mov al, [ rdi ]
    cmp al, byte [ rsi ]
    jne end
    inc rdi
    inc rsi
    jmp loop
end:
    mov rax, [ rdi ]
    sub rax, [ rsi ]
    ret
