; void  *ft_memchr(const void *s, int c, size_t n)
;
;   Searches for an occurence of byte c in the first n bytes of s
;   64bit-aligned version
;   Tests for (uint64_t) alignment, then searches 8 bytes by 8 bytes
;   Finish comparison 1 by 1 if less than 8 bytes remaining

;   s/o https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord for the bitmasks

global  ft_memchr

%define	LOW 0xFEFEFEFEFEFEFEFF
%define HIGH 0x8080808080808080
%define	MASK 0x0101010101010101

ft_memchr:
    push    r12
; Building 8-byte mask = ((unsigned uint64_t)-1/255)*c
    mov     r8, MASK
    movzx   ecx, sil
    imul    rcx, r8
    test    dil, 7
    je      .mask
.align:
; 64bit-alignement to match (uint64_t) boundary
    test    rdx, rdx
    je      .null
    mov     rax, rdi
    cmp     byte [rdi], sil
    je      .end
    inc     rdi
    dec     rdx
    test    dil, 7
    je      .mask
    jmp     .align
.mask:
    mov     r8, LOW
    mov     r9, HIGH
.mainloop:
; Looping through s 8 bytes by 8 bytes and search for c
    test    rdx, rdx
    je      .null
    cmp     rdx, 8
    jl      .endloop
    mov     r10, qword [rdi]
    mov     rax, rdi
    xor     r10, rcx
    lea     r12, [r10 + r8]
    not     r10
    and     r10, r12
    test    r10, r9
    jne     .endloop
    add     rdi, 8
    sub     rdx, 8
    jmp     .mainloop
.endloop:
; Finish the work if n is still above 0 and below 8
    test    rdx, rdx
    je      .null
    mov     rax, rdi
    cmp     byte [rdi], sil
    je      .end
    inc     rdi
    dec     rdx
    jmp     .endloop
.null:
; NULL return path
    xor     rax, rax
.end:
    pop     r12
    ret

; Naive versionk, 1 loop, 1 byte by 1 byte

; ft_memchr:
;     sub     rsp, 8
; .loop:
;     test    rdx, rdx
;     je      .null
;     mov     rax, rdi
;     cmp     byte [rdi], sil
;     je      .end
;     inc     rdi
;     jmp     .loop
; .null:
;     xor     rax, rax
; .end:
;     add     rsp, 8
;     ret
