[org 0x7c00]
mov ah, 0x0e
mov bx, 0
mov al, [variable + bx]
jmp printf
printf:
    cmp al, 0
    je exit
    int 0x10
    inc bx
    mov al, [variable + bx]
    jne printf

variable:
      db "Eae", 0

exit:
      jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
