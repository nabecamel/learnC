.global _plus, _main
.p2align 2

_plus:
	add x0, x1, x0
	ret

_main:
	mov x0, #3
	mov x1, #4
	bl _plus

	bl _exit
