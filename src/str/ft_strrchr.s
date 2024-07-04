global  ft_strrchr
extern  ft_strlen

ft_strrchr:
    sub     rsp, 8
    push    rsi
    call    ft_strlen
    pop     rsi
    test    rax, rax
    je      .end
    lea     rax, [rdi + rax]
.loop:
    cmp     byte [rax], sil
    je      .end
    cmp     rax, rdi
    je      .null
    dec     rax
    jmp     .loop
.null:
    xor     rax, rax
.end:
    add     rsp, 8
    ret
