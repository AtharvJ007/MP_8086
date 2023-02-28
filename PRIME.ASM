.model small
.stack 100h

.data
    msg1 db 10,13, "Enter number to be checked : $"
    msg2 db 10,13, "Give number is a prime number. $"
    msg3 db 10,13, "Given number is not a prime number.  $"
    num1 db ?

.code
    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h

    call input ; INPUT
    mov num1,al

    mov bl,01h ; COUNT IT
    mov ch,num1
    dec ch    ; STORES NUM-1

    up:inc bl
    mov ah,00h ; AX
    mov al,num1
    div bl

    cmp ah,00h ; REMINDER CHECK
    je out
    cmp bl,ch ; LOOP CHECK
    jne up

    lea dx,msg2
    mov ah,09h
    int 21h
    jmp exit

    out:lea dx,msg3
    mov ah,09h
    int 21h
  
    exit:mov ah,4Ch
    int 21h

    input proc near ; INPUT NUMBERS

    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip1
    sub al,07h
    skip1:mov cl,04h
    rol al,cl
    mov bl,al

    mov ah,01h
    int 21h
    sub al,30h
    cmp al,09h
    jle skip2
    sub al,07h
    skip2:add al,bl

    ret
    input endp

end
