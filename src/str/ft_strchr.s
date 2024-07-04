global  ft_strchr

ft_strchr:
    sub     rsp, 8
    mov     rax, rdi
.loop:
    cmp     byte [rax], 0
    je      .null
    cmp     byte [rax], sil
    je      .end
    inc     rax
    jmp     .loop
.null:
    test    sil, sil
    je      .end
    xor     rax, rax
.end:
    add     rsp, 8
    ret
