.model small
.stack 100h

.data
	msg1 db 10,13, "Enter an 8 bit number : $"
	msg2 db 10,13, "The sum is : $"

	arr db 10 dup('$')
	num1 db ?
	num2 db ?
	num3 db ?
	sum db ?
	carry db 00h
	q db ?
	r db ?

.code
	mov ax,@data
	mov ds,ax

	lea dx,msg1 ; FIRST NUM
	mov ah,09h
	int 21h
	call input
	mov num1,al

	lea dx,msg1 ; SECOND NUM
	mov ah,09h
	int 21h
	call input
	mov num2,al

	add al,num1 ; FIRST ADD
	daa
	jnc skip1
	inc carry
	skip1:mov sum,al
	
	lea dx,msg1 ; THIRD NUM
	mov ah,09h
	int 21h
	call input
	mov num3,al

	add al,sum ; SECOND ADD
	daa
	jnc skip2
	inc carry
	skip2:mov sum,al 

	lea dx,msg2
	mov ah,09h
	int 21h

	;lea si,sum
	;lea di,carry
	call output
	
	;lea dx,msg3 AVERAGE
	;mov ah,09h
	;int 21h
	
	;mov al,sum
	;mov ch,00h
	;goback:cmp al,03h
	;jc go
	;sub al,03h
	;inc ch
	;jmp goback
	;go:mov r,al
	;add ch,00H
	;daa
	;mov q,ch

	;call output2
	;mov al,q
	;add al,30h
	;mov dl,al
	;mov ah,02h
	;int 21h

	mov ah,4ch ; END
	int 21h

	input proc near ; INPUT 

	mov ah,01h
	int 21h
	sub al,30h
	mov cl,04h
	rol al,cl
	mov ch, al

	mov ah,01h
	int 21h
	sub al,30h
	add al,ch

	ret
	input endp

	output proc near ; OUTPUT
	
	mov al,carry  ; CARRY -- SUM
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h

	mov al,sum  ;10'S PLACE
	and al,0f0h
	mov cl,04h
	rol al,cl

	add al,30h
	mov dl,al
	mov ah,02h
	int 21h

	mov al,sum  ;1'S PLACE
	and al,0fh

	add al,30h
	mov dl,al
	mov ah,02h
	int 21h

	ret
	output endp

	;output2 proc near ; OUTPUT AVG
	
	;mov al,q  ;10'S PLACE
	;and al,0f0h
	;mov cl,04h
	;rol al,cl

	;add al,30h
	;mov dl,al
	;mov ah,02h
	;int 21h

	;mov al,q  ;1'S PLACE
	;and al,0fh

	;add al,30h
	;mov dl,al
	;mov ah,02h
	;int 21h

	;ret
	;output2 endp

end