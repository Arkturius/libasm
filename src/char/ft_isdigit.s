; int   ft_iscntrl(int c)
;
;   Tests for a digit character

global  ft_isdigit

ft_isdigit:
    mov     edx, 2048
    lea     eax, [rdi - 48]
    cmp     eax, 9
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
