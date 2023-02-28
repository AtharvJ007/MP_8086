;program to replace first occuring character

.model small
.stack 100h

.data
	msg1 db 10,13, "Enter a string: $"
	msg2 db 10,13, "Enter character to be replaced: $"
	msg3 db 10,13, "Enter new character: $"
	msg4 db 10,13, "Replaced string is: $"

	str db 10 dup('$')
	sout db ?
	sin db ?

.code
	mov ax,@data
	mov ds,ax

	lea dx,msg1
	mov ah,09h
	int 21h

	lea dx,str ; STRING INPUT
	mov ah,0ah
	int 21h

	lea dx,msg2
	mov ah,09h
	int 21h

	mov ah,01h ; OUT CHAR
	int 21h
	mov sout,al

	lea dx,msg3
	mov ah,09h
	int 21h

	mov ah,01h ; IN CHAR
	int 21h
	mov sin,al


	lea si,str+1 
	mov cl,str+2

	mov bl,sout
	up:dec cl
	jz display
	inc si
	cmp bl,[si]
	jne up
	
	mov al,sin
	mov [si],al

	display: lea dx,msg4
	mov ah,09h
	int 21h

	lea si,str+2
	mov cl,str+1
	loop:mov dl,[si]
	mov ah,02h
	int 21h
	inc si
	dec cl
	jnz loop

	mov ah,4ch
	int 21h
end