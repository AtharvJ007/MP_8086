.stack 100h
.model small

data segment
arr db 20 dup(?)
msg db 10,13,"Enter Array Elements : $"
msg1 db 10,13,"Length is $"
msg2 db 10,13,"Key to be searched : $"
msg3 db 10,13,"Key found!!$"
msg4 db 10,13,"Key Not found!!$"
count db ?
key db ?
data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    ;array message
    lea dx,msg
    mov ah,09h
    int 21h

    ;array read
    mov si,offset arr
    mov cl,00h          ;counter 0
    mov dl,13           ;enter key
    mov ah,01h

read:
    int 21h
    mov [si],al
    cmp [si],dl
    je exit
    inc si
    inc cl
    jmp read
    

exit:
    mov count,cl

    lea dx,msg1;array length
    mov ah,09h
    int 21h

   
    mov ah,02h
    mov dl,count
    add dl,30h
    int 21h


    lea dx,msg2;enter key
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h

    mov key,al

    mov si,offset arr
    mov cl,count

loop1: 
    mov al,[si]
    cmp al,key
    je found
    inc si
    dec cl
    jnz loop1
    jmp notfound
    jmp escape

found:
    lea dx,msg3;found message
    mov ah,09h
    int 21h
    jmp escape

notfound:
    lea dx,msg4;found message
    mov ah,09h
    int 21h
    jmp escape


 escape:    
    mov ah,4ch
    int 21h

code ends
end start