global  ft_sorted_list_insert
extern  ft_sorted_list_insert_elem
extern  malloc

ft_sorted_list_insert:
    push    rdi
    push    rsi
    push    rdx
    mov     edi, 16
    xor     rax, rax
    call    malloc
    pop     rdx
    pop     rsi
    pop     rdi
    test    rax, rax
    je      .end
    mov     qword [rax], rsi
    mov     qword [rax + 8], 0
    mov     rsi, rax 
    call    ft_sorted_list_insert_elem
.end:
    ret
