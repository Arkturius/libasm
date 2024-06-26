; void  *ft_memset(void *s, int c, size_t n)
;
;   Fills the n first bytes of s with c (as unsigned char)
;   64bit-aligned version
;   Tests for (uint64_t) alignement, then fills 8 bytes by 8 bytes
;   Finish 1 by 1, if 0 < n < 8 after the loop

global  ft_memset

%define	MASK 0x0101010101010101

ft_memset:
    sub     rsp, 8
; Moving destination pointer to rax to return it
    mov     rax, rdi
    test    rdx, rdx
    je      .end
.mask:
; Building 8-byte mask = ((unsigned uint64_t)-1/255)*c
    mov     r8, MASK
    movzx   ecx, sil
    imul    rcx, r8
    test    dil, 7
    je      .mainloop
.align:
; 64bit-alignement to match (uint64_t) boundary
    test    rdx, rdx
    je      .end
    mov     byte [rdi], sil
    inc     rdi
    dec     rdx
    test    dil, 7
    je      .mainloop
    jmp     .align
.mainloop:
; Looping through the destination and writing 8 bytes by 8 bytes
    test    rdx, rdx
    je      .end
    cmp     rdx, 8
    jl      .endloop
    mov     qword [rdi], rcx
    add     rdi, 8
    sub     rdx, 8
    jmp     .mainloop
.endloop:
; Finish the work if n is still above 0 and below 8
    test    rdx, rdx
    je      .end
    mov     byte [rdi], sil
    inc     rdi
    dec     rdx
    jmp     .endloop
.end:
    add     rsp, 8
    ret

; Naive version, 1 loop, 1 byte by 1 byte

; ft_memset:
;     mov     rax, rdi
; .loop:
;     test    rdx, rdx
;     je      .end
;     mov     byte [rdi], sil
;     dec     rdx
;     inc     rdi
;     jmp     .loop
; .end:
;     ret
