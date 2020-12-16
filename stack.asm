cseg segment

org 100h

begin:

    mov ax, 345h
    push ax

    mov ah, 10h

    int 16h

    pop ax

cseg ends
end begin