; int   ft_isspace(int c)
;
;   Tests for a whitespace character

global  ft_isspace

ft_isspace:
    mov     edx, 8192
    lea     eax, [rdi - 9]
    cmp     eax, 4
    jbe     .end
    cmp     edi, 32
    je      .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
