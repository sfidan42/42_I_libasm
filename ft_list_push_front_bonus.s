section .text
global ft_list_push_front

ft_list_push_front:
    cmp rdi, 0
    je  end
    push qword [ rdi ]
    mov [ rdi ], rsi
    pop qword rsi
    mov [ rdi + 8 ], rsi
end:
    ret