global  ft_strlcat
extern  ft_strlen

ft_strlcat:
    push    rbx
    xor     rbx, rbx
    test    rdx, rdx
    je      .null
    mov     rbx, rdi
    lea     rcx, [rbx + rdx]

.findend:
    cmp     byte [rbx], 0
    je      .end
    add     rbx, 1
    cmp     rbx, rcx
    je      .loop
    jmp     .findend

.end:
    mov     rdi, rsi
    call    ft_strlen
    cdqe
    add     rax, rbx
    pop     rbx
    ret
