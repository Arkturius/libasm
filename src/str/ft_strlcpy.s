global  ft_strlcpy

ft_strlcpy:
    sub     rsp, 8
    mov     rax, rsi
    test    rdx, rdx
    je      .null
.loop:
    cmp     rdx, 1
    je      .null
    movzx   ecx, byte [rax]
    test    cl, cl
    je      .null
    mov     byte [rdi], cl
    inc     rax
    inc     rdi
    dec     rdx
    jmp     .loop
.null:
    mov     byte [rdi], 0
.endloop:
    movzx   ecx, byte [rax]
    test    cl, cl
    je      .end
    inc     rax
    jmp     .endloop
.end:
    sub     rax, rsi
    add     rsp, 8
    ret
