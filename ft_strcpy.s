section .text
global ft_strcpy

ft_strcpy:
loop:
    cmp byte [ rsi ], 0
    je end
    mov al, byte [ rsi ], 
    mov byte [ rdi ], al
    inc rdi
    inc rsi
    jmp loop
end:
    mov al, 0
    mov byte [ rdi ], al
    ret
