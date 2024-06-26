; int   ft_islower(int c)
;
;   Tests for a lowercase character

global  ft_islower

ft_islower:
    mov     edx, 512
    lea     eax, [rdi - 97]
    cmp     eax, 25
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
