; int   ft_isgraph(int c)
;
;   Tests for any printable character except space

global  ft_isgraph

ft_isgraph:
    mov     edx, 32768
    lea     eax, [rdi - 33]
    cmp     eax, 93
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
