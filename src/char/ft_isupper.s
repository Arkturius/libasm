; int   ft_isupper(int c)
;
;   Tests for an uppercase character

global  ft_isupper

ft_isupper:
    mov     edx, 256
    lea     eax, [rdi - 65]
    cmp     eax, 25
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
