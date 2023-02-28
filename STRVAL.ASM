.model small
.stack 100h

.data
    str db 10 dup('$')
    msg1 db 10,13, "Enter username : $"
    msg2 db 10,13, "Username is not valid$"
    msg3 db 10,13, "Welocome Cusat!$"

.code
    mov ax,@data
    mov ds,ax

    lea dx,msg1 ; MSG1
    mov ah,09h
    int 21h

    lea dx,str ; INPUT
    mov ah,0Ah
    int 21h

    lea si,str+2 
    mov cl,str+1

    mov al,[si] ; COMPARE
    cmp al,'C'
    jne fail
    inc si
    mov al,[si]
    cmp al,'u'
    jne fail
    inc si
    mov al,[si]
    cmp al,'s'
    jne fail
    inc si
    mov al,[si]
    cmp al,'a'
    jne fail
    inc si
    mov al,[si]
    cmp al,'t'
    je check

    fail:lea dx,msg2  ; FAIL
    mov ah,09h
    int 21h
    jmp exit

    check:
    mov al,00h
    up:inc al
    dec cl
    jnz up

    cmp al,05h
    jne fail

    lea dx,msg3  ; SUCCESS
    mov ah,09h
    int 21h

    exit :mov ah,4Ch
    int 21h

end
