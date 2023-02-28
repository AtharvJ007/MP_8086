.model small
.stack 100h

.data
        msg1 db 10,13, "Basic checking$"

.code
        mov ax,@data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21h

        mov ah,4ch
        int 21h
end
