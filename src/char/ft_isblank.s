; int   ft_isblank(int c)
;
;   Tests for a blank character (space or tab)

global  ft_isblank

ft_isblank:
    lea     edx, [rdi - 9]
    mov     eax, 1
    cmp     edx, 4
    je      .end
    cmp     edi, 32
    sete    al
.end:
    ret
