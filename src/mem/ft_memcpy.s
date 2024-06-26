; void  *ft_memcpy(void *dest, const void *src, size_t n)
;
;   Copies the n first bytes from src to dest
;   64bit-aligned version
;   Tests for (uint64_t) alignment, then copies 8 bytes by 8 bytes
;   Finish 1 by 1 if less than 8 bytes remaining

global  ft_memcpy

ft_memcpy:
    sub     rsp, 8
; Moving destination pointer to rax to return it
    mov     rax, rdi
    test    rdx, rdx
    je      .end
    test    sil, 7
    je      .mainloop
.align:
; 64bit-alignement to match (uint64_t) boundary
    test    rdx, rdx
    je      .end
    movzx   ecx, byte [rsi]
    mov     byte [rdi], cl
    inc     rdi
    inc     rsi
    dec     rdx
    test    sil, 7
    jne     .align
.mainloop:
; Looping through the destination and copying 8 bytes by 8 bytes
    test    rdx, rdx
    je      .end
    cmp     rdx, 8
    jl      .endloop
    mov     rcx, qword [rsi]
    mov     qword [rdi], rcx
    add     rsi, 8
    add     rdi, 8
    sub     rdx, 8
    jmp     .mainloop
.endloop:
; Finish the work if n is still above 0 and below 8
    test    rdx, rdx
    je      .end
    movzx   ecx, byte [rsi]
    mov     byte [rdi], cl
    inc     rsi
    inc     rdi
    dec     rdx
    jmp     .endloop
.end:
    add     rsp, 8
    ret

; ft_memcpy:
;     mov     rax, rdi
; .loop:
;     test    rdx, rdx
;     je      .end
;     movzx   ecx, byte [rsi]
;     mov     byte [rdi], cl
;     inc     rdi
;     inc     rsi
;     dec     rdx
;     jmp     .loop
; .end:
;     ret
