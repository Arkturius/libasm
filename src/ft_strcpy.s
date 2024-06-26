; ft_strcpy(char *dest, const char *src)
;
;   Copies the string src to dest
;   64bit-aligned version
;   Tests for (uint64_t) alignment, then copies 8 bytes by 8 bytes
;   Finding NULL byte is done by bitmask operations
;   Finish 1 by 1 if the NULL byte is found in the next 8 bytes

global  ft_strcpy

%define	LOW 0xFEFEFEFEFEFEFEFF
%define HIGH 0x8080808080808080

ft_strcpy:
    sub     rsp, 8
; Moving destination pointer to rax to return it
    mov     rax, rdi
    test    sil, 7
    je      .mask
.align:
; 64bit-alignment to match (uint64_t) boundary
    movzx   ecx, byte [rsi]
    test    cl, cl
    je      .end
    mov     byte [rdi], cl
    inc     rdi
    inc     rsi
    test    sil, 7
    jne     .align
.mask:
; Setting up bitmasks to detect NULL bytes in next 8 bytes
    mov     r8, LOW
    mov     r9, HIGH
    mov     rdx, qword [rsi]
.mainloop:
; Looping through source, and copying 8 bytes by 8 bytes to dest
    mov     r10, rdx
    lea     rcx, [rdx + r8]
    not     rdx
    and     rdx, rcx
    test    rdx, r9
    jne     .endloop
    mov     qword [rdi], r10
    mov     rdx, qword [rsi + 8]
    add     rdi, 8
    add     rsi, 8
    jmp     .mainloop
.endloop:
; Finish the work if NULL isnt found on a (uint64_t) boundary 
    movzx   ecx, byte [rsi]
    test    cl, cl
    je      .end
    mov     byte [rdi], cl
    inc     rdi
    inc     rsi
    jmp     .endloop
.end:
; NULL terminate the destination
    mov     byte [rdi], 0
    add     rsp, 8
    ret

; Naive version, 1 loop, copies 1 byte by 1 byte

; ft_strcpy:
;     sub     rsp, 8
;     mov     rax, rdi
;     movzx   ecx, byte [rsi]
;     test    cl, cl
;     je      .end
; .loop:
;     mov     byte [rdi], cl
;     add     rsi, 1
;     add     rdi, 1
;     movzx   ecx, byte [rsi]
;     test    cl, cl
;     jne     .loop
; .end:
;     mov     byte [rdi], 0
;     add     rsp, 8
;     ret
