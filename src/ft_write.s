global  ft_write
extern  __errno_location

ft_write:
    test    rsi, rsi
    je      .null
    mov     rax, 1
    syscall
    cmp     rax, 0
    jl      .err
    ret
.err:
    neg     rax
    mov     rdi, rax
    call    __errno_location
    mov     [rax], rdi
    mov     rax, -1
    ret
.null:
    call    __errno_location
    mov     dword [rax], 22
    mov     rax, -1
    ret
