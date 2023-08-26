bits 64

global	ft_putchar
global	ft_putstr

section	.text
	ft_putchar:
		push	rax
		push	rdi
		push	rdx
		push	rsi

		mov		rax, 1
		mov		rdi, 1
		mov		rsi, rsp
		add		rsi, 16
		mov		rdx, 1
		syscall

		pop		rsi
		pop		rdx
		pop		rdi
		pop		rax

		ret
;================================================
	ft_putstr:
		push	rax
		push	rdi
		push	rdx
		push	rsi

		mov		rsi, [rsp + 16]

	_loop:
		mov		rax, 1
		mov		rdi, 1
		mov		rdx, 1
		syscall

		add		rsi, 1
		movzx	rcx, byte [rsi]
		cmp		rcx, 0
		jne		_loop
		
		pop		rsi
		pop		rdx
		pop		rdi
		pop		rax

		ret