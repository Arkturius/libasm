; ft_strcmp(const char *s1, const char *s2)
;
;   Compares strings pointed by s1 and s2
;   64bit-aligned version
;   Tests for (uint64_t) alignment, then compare 8 bytes by 8 bytes
;   Finding NULL byte is done by bitmask operations
;   Testing on *(uint64_t *)s1 - *(uint64_t *)s2
;   Finish the comparison if 

global  ft_strcmp

; ft_strcmp:
;     sub     rsp, 8
;     test    dil

; .end:
;     sub     edi, esi
;     add     rsp, 8
;     ret

ft_strcmp:
    push    rdi
    push    rsi
    sub     rsp, 8
    jmp     .loop
.loop_inc:
    cmp     byte [rsi], al
    jne     .end
    add     rdi, 1
    add     rsi, 1
.loop:
    movzx   eax, byte [rdi]
    test    al, al
    jne     .loop_inc
    xor     eax, eax
.end:
    movzx   edx, byte [rsi]
    sub     eax, edx
    add     rsp, 8
    pop     rsi
    pop     rdi
    ret
