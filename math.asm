%define sys_exit 60

section .text

global _start
_start:

    mov rbx, 2
    add rbx, 3

    mov rax, 4
    sub rbx, rax

    imul rbx, 100

    ; When using the idiv instruction, the dividend is always assumed to be stored in rdx:rax
    ; A further limitation of the idiv instruction is that it can't divide by an immediate value. This means that the divisor must first be loaded into a register
    ; The result is placed in rax and the remainder is placed in rdx
    mov rdx, 0
    mov rax, rbx
    mov rbx, 13
    idiv rbx

; Return a number
	mov rdi, rax
    ;mov rdi, rdx
	mov rax, sys_exit
	syscall

