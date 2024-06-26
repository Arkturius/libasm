; int   ft_isxdigit(int c)
;
;   Tests for an hexadecimal character

global  ft_isxdigit
extern  ft_isdigit

ft_isxdigit:
    mov     ecx, 4096
    call    ft_isdigit
    test    eax, eax
    jne      .end
    lea     eax, [rdi - 65]
    and     eax, -33
    cmp     eax, 5
    jbe     .end
    xor     ecx, ecx
.end:
    mov     eax, ecx
    ret
