.model small
.stack 100

.data
	msg1 db 10,13,"Enter string : $"
	msg2 db 10,13,"Reversed string is : $"
	str db 10 dup('$')

.code
	mov ax,@data
	mov ds,ax
	
	lea dx,msg1 ; MSG1
	mov ah,09h
	int 21h

	lea dx,str ; TAKE STRING AS INPUT
	mov ah,0Ah
	int 21h

	lea dx,msg2 ; MSG2
	mov ah,09h
	int 21h

	lea si,str+2
	;mov si, offset str+2
	mov cl,str+1

	up:
	inc si
	dec cl
	jnz up
	mov cl,str+1

	display:
	dec si
	mov dl,[si]
	mov ah,02h
	int 21h
	dec cl
	jnz display

	exit:
	mov ah,4ch
	int 21h
end