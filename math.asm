%define sys_exit 60

section .text

global _start
_start:

; Return a number
	mov rdi, 7
	mov rax, sys_exit
	syscall

