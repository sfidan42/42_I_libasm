section .data
;global ft_list_remove_if
extern free

ft_list_remove_if:
	; Input:
	;	rdi = t_list **alst
	;	rsi = void *ref
	;	rdx = int (*cmp)()
	; Local:
	;	rbx = t_list *current
	;	rcx = t_list *temp
	push rdi
	push rsi
	push rbx
	push rcx
l1:
	cmp qword [rdi], 0
	je e1
	mov rdi, [rdi]
	mov rdi, [rdi + 0]
	;mov rsi, rsi
	call rdx
	cmp rax, 0
	jne e1
	mov rcx, [rdi]
	mov rax, [rdi + 8]
	mov [rdi], rax
	push rdi
	mov rdi, rcx
	call free
	pop rdi
e1:
	mov rbx, [rdi]
l2:
	cmp rbx, 0
	je e2
	mov rax, [rbx + 8]
	mov rax, [rax]
	call rdx
	cmp rax, 0
	jne e2
	mov rcx, [rbx + 8]
	mov rax, [rcx + 8]
	mov [rbx + 8], rax
	push rbx
	mov rbx, rcx
	call free
	pop rbx
	jmp l2
e2:
	pop rcx
	pop rbx
	pop rsi
	pop rdi
	ret


;#include <stdlib.h>
;#include "ft_list.h"
;
;void ft_list_remove_if(t_list **alst, void *data_ref, int (*cmp)())
;{
;	t_list *current;
;	t_list *temp;
;
;	while (*alst && cmp((*alst)->data, data_ref) == 0)
;	{
;		temp = *alst;
;		*alst = (*alst)->next;
;		free(temp);
;	}
;	current = *alst;
;	while (current && current->next)
;	{
;		if (cmp(current->next->data, data_ref) == 0)
;		{
;			temp = current->next;
;			current->next = current->next->next;
;			free(temp);
;		}
;		else
;		{
;			current = current->next;
;		}
;	}
;}
;