global  ft_list_push_front
extern  malloc

ft_list_push_front:
    push    rsi
    push    rbx
    push    rcx
    test    rdi, rdi
    je      .end
    mov     rbx, rdi
    mov     edi, 16
    push    rsi
    call    malloc
    pop     rsi
    test    rax, rax
    je      .end
    mov     qword [rax], rsi
    mov     rcx, [rbx]
    mov     qword [rax + 8], rcx
    mov     qword [rbx], rax
.end:
    pop     rcx
    pop     rbx
    pop     rsi
    ret
