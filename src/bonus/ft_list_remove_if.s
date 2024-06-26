global  ft_list_remove_if
extern  free

ft_list_remove_if:
    push    rbx
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    test    rdi, rdi
    je      .end
    test    rsi, rsi
    je      .end
    test    rcx, rcx
    je      .end
    test    rdx, rdx
    je      .end
    mov     r11, rdi
    mov     rbx, [rdi]
    test    rbx, rbx
    je      .end
    mov     r12, rdx
    mov     r13, rcx
    mov     r14, rbx
    xor     r15, r15
    mov     rbx, rdi
    jmp     .loop
.remove:
    mov     rax, qword [r14 + 8]
    test    r15, r15
    je      .noprev
    mov     qword [r15 + 8], rax
    mov     rdi, qword [r14]
    push    rsi
    call    r13
    mov     rdi, r14
    call    free
    pop     rsi
    mov     r14, qword [r15 + 8]
.loop_inc:
    test    r14, r14
    je      .end
.loop:
    mov     rdi, qword [r14]
    push    rsi
    xor     rax, rax
    call    r12
    pop     rsi
    test    rax, rax
    je      .remove
    mov     r15, r14
    mov     r14, qword [r15 + 8]
    jmp     .loop_inc
.end:
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     rbx
    ret
.noprev:
    mov     qword [rbx], rax
    mov     rdi, qword [r14]
    push    rsi
    call    r13
    pop     rsi
    mov     r14, qword [rbx]
    jmp     .loop_inc
