
mov ah, 0x0e 
mov al, 65
int 0x10
jmp loop2
loop1:
        sub al, 31
        cmp al, 'Z' + 1
        je exit
        int 0x10
        jl loop2
loop2:
        add al, 33
        cmp al, 'z' + 1
        je exit
        int 0x10
        jl loop1
exit:
        jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
