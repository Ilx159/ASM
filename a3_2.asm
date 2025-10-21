[org 0x7c00]
mov ah, 0x0e
jmp main

print_char:
    cmp al, 0
    je main
    int 0x10
    inc bx
    mov al, [buffer + bx]
    jne print_char

print:
    mov ah, 0x0e
    mov bx, 0
    mov al, [buffer + bx]
    jmp print_char

input:
    mov ah, 0
    int 0x16
    mov [buffer], al
    mov [buffer + 1], 13
    mov [buffer + 2], 0
    cmp [buffer], 'q'
    je exit
    jne print

buffer:
      db 0

main:
      jmp input

exit:
      jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
