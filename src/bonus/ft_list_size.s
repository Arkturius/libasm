global  ft_list_size

ft_list_size:
    sub     rsp, 8
    xor     eax, eax
    jmp     .loop
.inc:
    add     eax, 1
    mov     rdi, [rdi + 8]
.loop:
    test    rdi, rdi
    jne     .inc
.end:
    add     rsp, 8
    ret
