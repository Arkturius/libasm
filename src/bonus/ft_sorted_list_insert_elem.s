global  ft_sorted_list_insert_elem

ft_sorted_list_insert_elem:
    push    rbx
    push    r13
    push    r12
    push    r11
    test    rdi, rdi
    je      .end
    test    rsi, rsi
    je      .end
    test    rdx, rdx
    je      .end
    mov     r13, rdx
    mov     rbx, rdi
    mov     rax, rsi
    mov     qword [rax + 8], 0
    mov     r12, rax
    mov     r11, qword [rbx]
    test    r11, r11
    je      .insert_start
.compare_first:
    mov     rdi, qword [r11]
    mov     rsi, qword [r12]
    xor     rax, rax
    call    r13
    cmp     eax, 0
    jle     .compare
    mov     qword [r12 + 8], r11
    mov     qword [rbx], r12
    jmp     .end
.inc:
    mov     r11, qword [r11 + 8]
.compare:
    mov     rdi, qword [r11 + 8]
    test    rdi, rdi
    je      .insert_end
    mov     rdi, qword [rdi]
    mov     rsi, qword [r12]
    xor     rax, rax
    call    r13
    cmp     eax, 0
    jle     .inc
    mov     rdi, qword [r11 + 8]
    mov     qword [r12 + 8], rdi
    mov     qword [r11 + 8], r12
    jmp      .end
.insert_end:
    mov     qword [r11 + 8], r12
.end:
    pop     r11
    pop     r12
    pop     r13
    pop     rbx
    ret
.insert_start:
    mov     qword [rbx], r12
    jmp     .end
