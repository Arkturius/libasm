; int   ft_memcmp(void *s1, void *s2, size_t n)
;
;   Compare the first n bytes of memory pointed by s1 to s2
;   64bit-aligned version
;   Tests for (uint64_t) alignment, then compares 8 bytes by 8 bytes
;   Finish 1 by 1 if less than 8 bytes remaining, or difference found in 8 next

global  ft_memcmp

ft_memcmp:
    sub     rsp, 8
    test    rdx, rdx
    je      .end
    test    cl, 7
    je      .mainloop
.align:
; 64bit-alignement to match (uint64_t) boundary
    test    rdx, rdx
    je      .end
    movzx   ecx, byte [rdi]
    movzx   r8d, byte [rsi]
    mov     eax, ecx
    sub     eax, r8d
    cmp     cl, r8b
    jne     .end
    inc     rdi
    inc     rsi
    dec     rdx
    test    cl, 7
    jne     .align
.mainloop:
; Looping through s1 and s2 and compare 8 bytes by 8 bytes
    test    rdx, rdx
    je      .end
    cmp     rdx, 8
    jl      .endloop
    mov     rax, qword [rdi]
    mov     rcx, qword [rsi]
    xor     rax, rcx
    test    rax, rax
    jne     .endloop
    add     rdi, 8
    add     rsi, 8
    sub     rdx, 8
    jmp     .mainloop
.endloop:
; Finish the work if 8 next bytes aren't equal
    test    rdx, rdx
    je      .end
    movzx   ecx, byte [rdi]
    movzx   r8d, byte [rsi]
    mov     eax, ecx
    sub     eax, r8d
    cmp     cl, r8b
    jne     .end
    inc     rdi
    inc     rsi
    dec     rdx
    jmp     .endloop
.end:
    add     rsp, 8
    ret

; ft_memcmp:
; .loop:
;     test    rdx, rdx
;     je      .end
;     movzx   ecx, byte [rdi]
;     movzx   r8d, byte [rsi]
;     mov     eax, ecx
;     sub     eax, r8d
;     cmp     cl, r8b
;     jne     .end
;     inc     rdi
;     inc     rsi
;     dec     rdx
;     jmp     .loop
; .end:
;     ret
