global  ft_atoi_base
extern  ft_verif_base
extern  ft_strindex
extern  ft_strlen
extern  ft_isspace

ft_atoi_base:
    push    r10
    push    r11
    sub     rsp, 8
    test    rdi, rdi
    je      .end
    xor     rdx, rdx
    mov     r10, rsi
    mov     rbx, rdi
    mov     rdi, rsi
    call    ft_verif_base
    test    rax, rax
    je      .end
    mov     rdi, rsi
    call    ft_strlen
    mov     r11, rax
    jmp     .space
.space_inc:
    add     rbx, 1
.space:
    movsx   edi, byte [rbx]
    call    ft_isspace
    test    eax, eax
    jne     .space_inc
    jmp     .sign
.sign_inc:
    add     rbx, 1
    xor     rdx, 1
.sign:
    movsx   edi, byte [rbx]
    sub     edi, 43
    and     edi, 253
    jne     .loop
    movsx   edi, byte [rbx]
    cmp     edi, 45
    je      .sign_inc
    add     rbx, 1
    jmp     .sign
.inc:
    mov     rsi, rax
    pop     rax
    imul    eax, r11d
    add     eax, esi
    add     rbx, 1
.loop:
    movsx   esi, byte [rbx]
    mov     rdi, r10
    push    rax
    call    ft_strindex
    cmp     eax, 0
    jge     .inc
    pop     rax
    jmp     .end
.end:
    mov     ecx, eax
    neg     ecx
    cmp     rdx, 1
    cmove   eax, ecx
    add     rsp, 8
    pop     r11
    pop     r10
    ret
