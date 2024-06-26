global  ft_list_sort
extern  ft_list_pop
extern  ft_sorted_list_insert_elem

ft_list_sort:
    push    rbx
    push    r11
    push    r12
    mov     r12, rsp
    sub     rsp, 8
    test    rdi, rdi
    je      .end
    test    rsi, rsi
    je      .end
    mov     rbx, rdi
    mov     r11, rsi
    mov     qword [r12 - 8], 0
    jmp     .pop
.insert:
    lea     rdi, [rsp]
    mov     rsi, rax
    mov     rdx, r11
    xor     rax, rax
    call    ft_sorted_list_insert_elem
.pop:
    mov     rdi, rbx
    xor     rax, rax
    call    ft_list_pop
    test    rax, rax
    jne     .insert
.end:
    mov     rax, qword [rsp]
    mov     qword [rbx], rax
    add     rsp, 8
    pop     r12
    pop     r11
    pop     rbx
    ret
