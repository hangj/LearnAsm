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
    push rbp
    mov rbp, rsp
    sub rsp, 0x40





    mov rax, 0x0    ; 返回值

    add rsp, 0x40   ; mov rsp, rbp
    pop rbp
    ret

































