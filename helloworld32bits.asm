; 32bits registers
; compile: nasm -f elf64(or 32bits) programname
; link uses the OS libary to convert into a executable and run: ld -s -o name nameOfObject
section .data    ; constants
    message db 'Hello, world!', 0x10 ; in ascii -> \n
    size equ $- message       ; size of message (char)
section .bss     ; variables

section .text    ; code

global _start    ; global start pointer

_start:
    mov eax, 0x4 ; im want get out.
    mov ebx, 0x1 ; for default output
    mov ecx, message
    mov edx, size
    int 0x80
                
    mov eax, 0x1 ; mov dest, origin (eax => finishing the code)
    mov ebx, 0x0 ; status code 0
    int 0x80     ; syscall (to execute)