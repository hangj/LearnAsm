%define sys_exit 60

%define sys_read 0
%define sys_write 1

%define stdin 0
%define stdout 1

%define success 0

%define newline 10


section .data

; message to be shown if rbx is equal to 10
    msg_equal: db "rbx is 10", newline
    msg_equal_len: equ $-msg_equal

; message to be shown if rbx is not equal to 10
    msg_unequal: db "rbx is not 10", newline
    msg_unequal_len: equ $-msg_unequal


section .text

global _start
_start:

    mov rbx, 10

    cmp rbx, 10
    jne unequal ; jne   stands for "Jump if Not Equal"
                ; jmp   unconditional jump (always jump)
                ; je    jump if equal
                ; jne   jump if not equal
                ; jl    jump if less than
                ; jle   jump if less than or equal
                ; jg    jump if greater than
                ; jge   jump if greater than or equal

    mov rax, sys_write
    mov rdi, stdout
    mov rsi, msg_equal
    mov rdx, msg_equal_len
    syscall

    jmp done

unequal:
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, msg_unequal
    mov rdx, msg_unequal_len
    syscall


done:
    mov rax, sys_exit
    mov rdi, success
    syscall














































