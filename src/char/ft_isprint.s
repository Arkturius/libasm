; int   ft_isprint(int c)
;
;   Tests for any printable character including space

global  ft_isprint

ft_isprint:
    mov     edx, 16384
    lea     eax, [rdi - 32]
    cmp     eax, 94
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
