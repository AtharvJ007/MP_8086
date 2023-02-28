.model small
.stack 100

.data
	msg1 db 10,13, "Enter first number : $"
	msg2 db 10,13, "Enter second number : $"
	msg3 db 10,13, "The result is : $"
	num1 db ?
	num2 db ?
	sum db ?
	carry db ?


.code
	mov ax,@data ; initial
	mov ds,ax

	lea dx,msg1
	mov ah,09h
	int 21h

	mov ah,01h ; first inp  -- we can also use registers to store values like bh,bl
	int 21h
	mov num1,al

	lea dx,msg2
	mov ah,09h
	int 21h

	mov ah,01h ; second inp
	int 21h

	mov ah,00h ; clears ah as to perform aaa
	add al,num1 ; addition code
	aaa
	add ax,3030h ; converts to ascii
	mov carry,ah ; stores result
	mov sum,al

	lea dx,msg3 ; print result
	mov ah,09h
	int 21h

	mov dl,carry ; carry print
	mov ah,02h
	int 21h

	mov dl,sum ; sum print
	mov ah,02h
	int 21h

	mov ah,4ch ; exit
	int 21h

end

