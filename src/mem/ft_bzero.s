; void  ft_bzero(void *s, size_t n)
;
;   Write zeros to the n first bytes of s
;   64bit-aligned version
;   Tests for (uint64_t) alignement, then write zeros 8 bytes by 8 bytes
;   Finish 1 by 1, if 0 < n < 8 after the loop

global  ft_bzero

ft_bzero:
    sub     rsp, 8
; Moving destination pointer to rax to return it
    mov     rax, rdi
    xor     rcx, rcx
    test    dil, 7
    je      .mainloop
.align:
; 64bit-alignement to match (uint64_t) boundary
    test    rsi, rsi
    je      .end
    mov     byte [rdi], 0
    inc     rdi
    dec     rsi
    test    dil, 7
    je      .mainloop
    jmp     .align
.mainloop:
; Looping through the destination and writing 8 bytes by 8 bytes
    test    rsi, rsi
    je      .end
    cmp     rsi, 8
    jl      .endloop
    mov     qword [rdi], rcx
    add     rdi, 8
    sub     rsi, 8
    jmp     .mainloop
.endloop:
; Finish the work if n is still above 0 and below 8
    test    rsi, rsi
    je      .end
    mov     byte [rdi], 0
    inc     rdi
    dec     rsi
    jmp     .endloop
.end:
    add     rsp, 8
    ret

; ft_bzero:
;     mov     rax, rdi
; .loop:
;     test    rsi, rsi
;     je      .end
;     mov     byte [rdi], 0
;     dec     rsi
;     inc     rdi
;     jmp     .loop
; .end:
;     ret
