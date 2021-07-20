%define NULL 0

org 0x7C00

    mov si, message

print_string:
    lodsb

    ; Check for the NULL-termination character. If found, exit the loop.
    cmp al, NULL
    je infinite_loop

    ; Write the byte in `al` as an ASCII character to the screen.
    mov ah, 0x0E
    int 0x10

    jmp print_string

infinite_loop:
    jmp infinite_loop

message: db "Hi, I'm a bootloader who doesn't load anything.", NULL

; Pad out the file to the 510th byte with zeroes.
times 510-($-$$) db 0

; MBR boot signature.
db 0x55, 0xAA

