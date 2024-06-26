global  ft_atoi
extern  ft_isspace

ft_atoi:
    push    rbx
    test    rdi, rdi
    je      .end
    mov     rbx, rdi
    jmp     .space
.space_inc:
    add     rbx, 1
.space:
    movsx   edi, byte [rbx]
    call    ft_isspace
    test    eax, eax
    jne     .space_inc
    sub     edi, 43
    and     edi, 253
    jne     .loop
    movzx   edi, byte [rbx]
    add     rbx, 1
    jmp     .loop
.inc:
    lea     eax, [rax + 4 * rax]
    lea     eax, [rcx + 2 * rax]
    add     rbx, 1
.loop:
    movsx   ecx, byte [rbx]
    sub     ecx, 48
    cmp     ecx, 9
    jbe     .inc
    jmp     .end
.end:
    mov     ecx, eax
    neg     ecx
    cmp     edi, 45
    cmove   eax, ecx
    pop     rbx
    ret
