%define sys_exit 60

%define sys_read 0
%define sys_write 1

%define stdin 0
%define stdout 1

%define success 0

%define newline 10


section .data

    output: db "Greetings!", newline, 0
    output_len: equ $-output


section .text

global _start
_start:

    mov rbx, 3

loop_start:

    cmp rbx, 0
    jle loop_stop

    mov rax, sys_write
    mov rdi, stdout
    mov rsi, output
    mov rdx, output_len
    syscall

    dec rbx
    jmp loop_start


loop_stop:

    mov rax, sys_exit
    mov rdi, success
    syscall










































