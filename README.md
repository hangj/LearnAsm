# LearnAsm

[introduction to 64 bit assembly](https://www.briansteffens.com/introduction-to-64-bit-assembly/)


[NASM - The Netwide Assembler](https://www.nasm.us/xdoc/2.15.05/html/nasmdoc3.html)


```asm
section .data
    prompt: db "Please enter your name: "
    prompt_len: equ $-prompt
```

$ evaluates to the assembly position at the beginning of the line containing the expression; so you can code an infinite loop using JMP $


$$ evaluates to the beginning of the current section; so you can tell how far into the section you are by using ($-$$)
