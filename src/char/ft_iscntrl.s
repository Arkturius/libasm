; int   ft_iscntrl(int c)
;
;   Tests for an control character

global  ft_iscntrl

ft_iscntrl:
    mov     edx, 2
    cmp     edi, 127
    je      .end
    mov     eax, edi
    cmp     eax, 31
    jbe     .end
    xor     edx, edx
.end:
    mov     eax, edx
    ret
