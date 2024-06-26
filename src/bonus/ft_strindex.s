global  ft_strindex

ft_strindex:
    push    rbx
    test    rdi, rdi
    je      .not_in
    mov     rax, rdi
    jmp     .loop
.inc:
    add     rax, 1
.loop:
    movzx   ebx, byte [rax]
    test    ebx, ebx
    je      .not_in
    cmp     bl, sil
    jne     .inc
    sub     rax, rdi
    jmp     .end
.not_in:
    mov     eax, -1
.end:
    pop     rbx
    ret
