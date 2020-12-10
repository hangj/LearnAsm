%define sys_exit 60
%define sys_read 0
%define sys_write 1

%define stdin 0
%define stdout 1

%define success 0

%define newline 10


section .bss ; bss stands for "Block started by symbol"

    %define buffer_len 64
    buffer: resb buffer_len ; resb stands for "reserve bytes"

    %define name_max_len 64
    name: resb name_max_len
    ; name_len: resp 1 ; resq means to reserve a quad-word. This is 8 bytes, or 64 bits
    name_len: resb 8 ;

section .data

    prompt: db "Please enter your name: " ; db means that the data being declared is a series of bytes
    prompt_len: equ $-prompt

    response_start: db "Hello, "
    response_start_len: equ $-response_start

    response_end: db "!", newline, 0
    response_end_len: equ $-response_end

section .text

global _start
_start:

    mov rax, sys_write
    mov rdi, stdout
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

; read input from the user
    mov rax, sys_read
    mov rdi, stdin
    mov rsi, name
    mov rdx, name_max_len
    syscall

; store the number of characters entered by the user
    dec rax ; remove the extra newline
    mov [name_len], rax ; copy the value to memory at the given address

; write the start of the response
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_start
    mov rdx, response_start_len
    syscall

; write the suer's name
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, name
    mov rdx, [name_len]
    syscall

; write the end of the response
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_end
    mov rdx, response_end_len
    syscall

; end the program
    mov rax, sys_exit
    mov rdi, [name_len]
    syscall



