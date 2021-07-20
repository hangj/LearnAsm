section .text
global _start

section .data
	msg db "hello, world!", 0xa
	len equ $ - msg

_syscall:
		int 0x80
		ret

_start:
	push dword len
	push dword msg
	push dword 1		; file descriptor value
	mov eax, 0x4		; system call number (sys_write)
	call _syscall

	add esp, 12

	push dword 0
	mov eax, 0x1		; system call number (sys_exit)
	call _syscall
