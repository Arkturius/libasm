global  ft_list_pop

ft_list_pop:
    test    rdi, rdi
    je      .end
    mov     rax, qword [rdi]
    test    rax, rax
    je      .end
    mov     rdx, [rax + 8]
    mov     qword [rdi], rdx
.end:
    ret
