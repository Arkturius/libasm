; void  *ft_calloc(size_t nmemb, size_t size)
;
;   Allocate nmemb * size bytes and return the adress poiting to it
;   If either nmemb or size is 0, returns NULL
;   If the multiplication between the two yields an integer overflow, returns NULL
;   The allocated zone will be initialized to zero

global  ft_calloc
extern  ft_bzero
extern  malloc

ft_calloc:
    push    r12
    xor     rax, rax
; Testing all NULL cases
    test    rdi ,rdi
    je      .end
    test    rsi, rsi
    je      .end
    mov     r12, rdi
    imul    r12, rsi
    jo      .end
; Call malloc to allocate memory
    mov     rdi, r12
    xor     rax, rax
    call    malloc
; Malloc protection
    test    rax, rax
    je      .end
; call ft_bzero to zero the memory zone
    mov     rdi, rax
    mov     rsi, r12
    call    ft_bzero
.end:
    pop     r12
    ret
