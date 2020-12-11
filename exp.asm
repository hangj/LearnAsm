%define sys_exit 60

%define sys_read 0
%define sys_write 1

%define stdin 0
%define stdout 1

%define success 0

%define newline 10


section .text
global _start
_start:

    mov rbx, 2
    mov rcx, 3

    mov rax, 1


loop_start:
    cmp rcx, 0
    jle loop_stop

    imul rax, rbx

    dec rcx
    jmp loop_start


loop_stop:
    mov rdi, rax
    mov rax, sys_exit
    syscall








