; int   ft_ispunct(int c)
;
;   Tests for a punctuation character (isgraph && !isalnum)

global  ft_ispunct
    extern  ft_isalnum
    extern  ft_isgraph

ft_ispunct:
    call    ft_isgraph
    test    eax, eax
    setne   cl
    call    ft_isalnum
    test    eax, eax
    sete    al
    and     ecx, eax
    xor     eax, eax
    test    ecx, ecx
    je      .end
    mov     eax, 4
.end:
    ret
