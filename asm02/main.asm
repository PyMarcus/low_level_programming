segment .data 
    LF           equ 0xA ; LF => line feed => \n
    SYS_EXIT     equ 0x1 ; call the sys to finish
    SYS_CALL     equ 0x80; execute an action
    NULL         equ 0xD ; null value 
    
    ; to eax register
    SUCCESS_EXIT equ 0x0 ; status 0
    SYS_READ     equ 0x3 ; input operation
    SYS_WRITE    equ 0x4 ; print operation
    
    ; to ebx register
    STD_IN       equ 0x0 ; standard input
    STD_OUT      equ 0x1 ; standard output
      
section .data 
    message db "What is your forename?", LF, NULL
    sizeMessage    equ $- message
    
    theName db "Your forename is: "
    sizeTheName    equ $- theName
    
section .bss 
    name resb 1
    
section .text 

global _start 

_start:
    ; print operation
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, message
    mov edx, sizeMessage 
    int SYS_CALL         ; stdout -> message
    
    ; input operation
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, name 
    mov edx, 0xF
    int SYS_CALL         ; stdin -> name
    
    ; print operation shows the result
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, theName
    mov edx, sizeTheName
    int SYS_CALL        ; stdout -> theName
    
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, name 
    mov edx, 0xF
    int SYS_CALL        ; stdout -> name
    
    ; end
    mov eax, SYS_EXIT
    mov ebx, SUCCESS_EXIT
    int SYS_CALL