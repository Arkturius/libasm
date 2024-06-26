; int   ft_isascii(int c)
;
;   Tests for an ascii character

global  ft_isascii

ft_isascii:
    xor     eax, eax
    cmp     edi, 127
    setbe   al
    ret
