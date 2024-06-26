; size_t	ft_strlen(const char *str)
;
;   Return the length of a C string
;   64bit-aligned version
;   Tests for (uint64_t) alignment, then test for NULL byte 8 by 8
;   Finish 1 by 1 if less than 8 bytes remaining

;   s/o https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord for the bitmasks

global	ft_strlen

%define	LOW 0xFEFEFEFEFEFEFEFF
%define HIGH 0x8080808080808080

ft_strlen:
	sub		rsp, 8
; Moving string pointer to rax to return it
	mov		rax, rdi
	test	dil, 7
	je		.mask
.align:
; 64bit-alignement to match (uint64_t) boundary
	cmp		byte [rax], 0
	je		.end
	inc		rax
	test	al, 7
	jne		.align
.mask:
	mov 	r8, LOW
	mov		rdx, qword [rax]
	mov 	rsi, HIGH
.mainloop:
; Looping through the string and test for a NULL byte on the next 8 bytes
	lea		rcx, [rdx + r8]
	not		rdx
	and		rdx, rcx
	test	rdx, rsi
	jne		.endloop
	mov 	rdx, qword [rax + 8]
	add		rax, 8
	jmp		.mainloop
.endloop:
; Finish the work if NULL is found on the last 8 tested bytes to avoid accessing memory after the string
	cmp		byte [rax], 0
	je		.end
	inc		rax
	jmp		.endloop
.end:
; substract source pointer from iterator to deduce length
	sub		rax, rdi
	add		rsp, 8
	ret

; Naive version, 1 loop, 1 byte by 1 byte

; ft_strlen:
; 	mov		rax, rdi
; .loop:
; 	cmp		byte [rax], 0
; 	je		.end
; 	inc		rax
; 	jmp		.loop
; .end:
; 	sub		rax, rdi
; 	ret
