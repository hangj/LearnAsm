%define sys_exit 60
%define sys_read 0
%define sys_write 1

%define stdin 0
%define stdout 1

%define success 0

%define newline 10


section .bss
	%define name_max_len 64
	name: resb name_max_len
	name_len: resq 1

section .data
	prompt: db "Please enter your name: "
	prompt_len: equ $-prompt

	response_start: db "Hello, "
	response_start_len: equ $-response_start

	response_end: db "!", newline
	response_end_len: equ $-response_end

section .text

global _start
_start:

; Write the prompt out to the console
	mov rax, sys_write
	mov rdi, stdout
	mov rsi, prompt
	mov rdx, prompt_len
	syscall

; Read the user's name from the console
	mov rax, sys_read
	mov rdi, stdin
	mov rsi, name
	mov rdx, name_max_len
	syscall

; Store the number of characters enterd by the user
	dec rax
	mov [name_len], rax

; Write the start of the response
	mov rax, sys_write
	mov rdi, stdout
	mov rsi, response_start
	mov rdx, response_start_len
	syscall

; Write the user's name
	mov rax, sys_write
	mov rdi, stdout
	mov rsi, name
	mov rdx, [name_len]
	syscall

; Write the end of the response
	mov rax, sys_write
	mov rdi, stdout
	mov rsi, response_end
	mov rdx, response_end_len
	syscall

; End the program
	mov rax, sys_exit
	mov rdi, [name_len]
	syscall




