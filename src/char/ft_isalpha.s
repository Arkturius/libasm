; int   ft_isalpha(int c)
;
;   Tests for an alphabetic character

global  ft_isalpha

ft_isalpha:
    lea     eax, [rdi - 97]
    mov     edx, 1024
    cmp     eax, 25
    jbe     .end
    lea     eax, [rdi - 65]
    cmp     eax, 25
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
