global  ft_strlcat
extern  ft_strlen

ft_strlcat:
    push    r12
    push    r13
    push    r14
    mov     r12, rdi    ; d = dst
    mov     r13, rsi    ; s = src
    mov     r14, rdx    ; n = size
    xor     rax, rax    ; dlen
.dlen:
    test    r14, r14
    je      .init
    cmp     byte [r12], 0
    je      .init
    inc     rax
    inc     r12
    dec     r14
    jmp     .dlen
.init:
    mov     r14, rdx
    sub     rdx, rax
    test    rdx, rdx
    je      .nocat
    jmp     .loop
.inc:
    inc     r13
.loop:
    cmp     byte [r13], 0
    je      .null
    cmp     r14, 1
    je      .inc
    movzx   ecx, byte [r13]
    mov     byte [r12], cl
    inc     r12
    dec     r14
    jmp     .inc
.nocat:
    mov     rcx, rax
    mov     rdi, r13
    call    ft_strlen
    add     rax, rcx
    jmp     .end
.null:
    mov     byte [r12], 0
    sub     r13, rsi
    add     rax, r13
.end:
    pop     r14
    pop     r13
    pop     r12
    ret
