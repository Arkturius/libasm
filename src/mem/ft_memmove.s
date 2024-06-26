; void  *ft_memmove(void *dest, const void *src, size_t n)
;
;   Copies the n first bytes from src to dest
;   Supports overlapping memory areas
;   64bit-aligned version
;   Calling ft_memcpy if src > dest, otherwise copy in reverse
;   Tests for (uint64_t) alignment, then copies 8 bytes by 8 bytes
;   Finish 1 by 1 if less than 8 bytes remaining

global  ft_memmove
extern  ft_memcpy

ft_memmove:
    sub     rsp, 8
; Moving destination pointer to rax to return it
    mov     rax, rdi
    test    rdx, rdx
    je      .end
; Testing for memory overlapping possibility
    cmp     rsi, rdi
    jb      .reverse
    call    ft_memcpy
    jmp     .end
.reverse:
    test    sil, 7
    je      .mainloop
.align:
; 64bit-alignement to match (uint64_t) boundary
    test    rdx, rdx
    je      .end
    movzx   ecx, byte [rsi + rdx - 1]
    mov     byte [rdi + rdx - 1], cl
    dec     rdx
    test    sil, 7
    jne     .align
.mainloop:
; Looping through the destination and writing 8 bytes by 8 bytes
    test    rdx, rdx
    je      .end
    cmp     rdx, 8
    jl      .endloop
    mov     rcx, qword [rsi + rdx - 8]
    mov     qword [rdi + rdx - 8], rcx
    sub     rdx, 8
    jmp     .mainloop
.endloop:
; Finish the work if n is still above 0 and below 8
    test    rdx, rdx
    je      .end
    movzx   ecx, byte [rsi + rdx - 1]
    mov     byte [rdi + rdx - 1], cl
    dec     rdx
    jmp     .endloop
.end:
    add     rsp, 8
    ret

; Naive version, 1 loop, 1 byte by 1 byte

; ft_memmove:
;     sub     rsp, 8
;     mov     rax, rdi
;     cmp     rsi, rdi
;     jb      .loop
;     call    ft_memcpy
;     jmp     .end
; .loop:
;     test    rdx, rdx
;     je      .end
;     movzx   ecx, byte [rsi + rdx - 1]
;     mov     byte [rdi + rdx - 1], cl
;     dec     rdx
;     jmp     .loop
; .end:
;     add     rsp, 8
;     ret
