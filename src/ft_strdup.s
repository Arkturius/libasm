global  ft_strdup
extern  ft_strlen
extern  malloc

ft_strdup:
    push    rbx
    xor     rax, rax
    mov     rbx, rdi
    call    ft_strlen
    lea     rdi, [rax + 1]
    xor     rax, rax
    call    malloc
    test    rax, rax
    je      .end
    xor     rdx, rdx
    jmp     .loop
.inc:
    mov     byte [rax + rdx], cl
    add     rdx, 1
.loop:
    movzx   ecx, byte [rbx + rdx]
    test    cl, cl
    jne     .inc
    mov     byte [rax + rdx], 0
.end:
    pop     rbx
    ret
