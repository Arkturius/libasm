global  ft_verif_base

ft_verif_base:    
    test    rdi, rdi
    je      .err
    movzx   rcx, byte [rdi]
    test    rcx, rcx
    je      .err
    cmp     byte [rdi + 1], 0
    je      .err
    mov     eax, 1
    sub     rsp, 144
    pxor    xmm0, xmm0
    movaps  [rsp-120], xmm0
    movaps  [rsp-104], xmm0
    movaps  [rsp-88], xmm0
    movaps  [rsp-72], xmm0
    movaps  [rsp-56], xmm0
    movaps  [rsp-40], xmm0
    movaps  [rsp-24], xmm0
    movaps  [rsp-8], xmm0
    movaps  [rsp+8], xmm0
    movaps  [rsp+24], xmm0
    movaps  [rsp+40], xmm0
    movaps  [rsp+56], xmm0
    movaps  [rsp+72], xmm0
    movaps  [rsp+88], xmm0
    movaps  [rsp+104], xmm0
    movaps  [rsp+120], xmm0
    jmp     .loop
.inc:
    add     rdi, 1
    mov     byte [rsp - 120 + rcx], 1
    test    cl, cl
    je      .end
    sub     ecx, 9
    cmp     ecx, 4
    setbe   al
    cmp     ecx, 23
    sete    dl
    or      eax, edx
    test    al, al
    jne     .inv
    sub     ecx, 34
    and     ecx, 253
    je      .inv
    movsx   rcx, byte [rdi]
.loop:
    cmp     byte [rsp - 120 + rcx], 0
    je      .inc
    add     rsp, 144
.err:
    xor     eax, eax
    ret
.end:
    mov     eax, 1
    add     rsp, 144
    ret
.inv:
    xor     eax, eax
    add     rsp, 144
    ret