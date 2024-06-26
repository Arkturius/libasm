; int   ft_isalnum(int c)
;
;   Tests for an alphanumeric character

global  ft_isalnum

ft_isalnum:
    mov     eax, edi
    and     eax, -33
    mov     edx, 8
    sub     eax, 65
    cmp     eax, 25
    jbe     .end
    lea     eax, [rdi - 48]
    cmp     eax, 9
    jbe     .end
    xor     edx, edx     
.end:
    mov     eax, edx
    ret
