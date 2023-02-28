.model small
.stack 100h

.data
    msg1 db 10,13, "Enter a number to check : $"
    msg2 db 10,13, "The given number is odd.$"
    msg3 db 10,13, "The given number is even.$"
    num db ?

.code
    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h

    call input
    mov num,al
    mov cl,01h

    rcr al,cl
    jc skip
    lea dx,msg3
    mov ah,09h
    int 21h
    jmp exit

    skip:
    lea dx,msg2
    mov ah,09h
    int 21h

    exit:mov ah,4Ch
    int 21h

    input proc near ; INPUT NUMBERS

    mov ah,01h
    int 21h
    sub al,30h
    mov cl,04h
    rol al,cl
    mov bl,al

    mov ah,01h
    int 21h
    sub al,30h
    add al,bl

    ret
    input endp

end
