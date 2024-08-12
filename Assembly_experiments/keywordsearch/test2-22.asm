datarea segment

	m1 db 'Enter keyword:','$'
	m2 db 'Enter Sentence:','$'
	m3 db 'Match at location:','$'
	m4 db 'No match!',13,10,'$'
	m5 db 'match.',13,10,'$'
	m6 db 'H of the sentence.',13,10,'$'
	
stoknin1 label byte
	max1 db 10
	act1 db ?
	stokn1 db 10 dup(?)
	
stoknin2 label byte
	max2 db 50
	act2 db ?
	stokn2 db 50 dup(?)
datarea ends

prognam segment

main proc far
	assume cs:prognam, ds:datarea, es:datarea
	
start:
	push ds
	sub ax,ax
	sub bx,bx
	push ax
	mov ax,datarea
	mov ds,ax
	mov es,ax
	
	lea dx,m1	;enter keyword
	mov ah,09
	int 21h
	lea dx,stoknin1
	mov ah,0ah
	int 21h
	cmp act1,0
	je exit
	
a1:				;enter sentence
	call crlf
	lea dx,m2
	mov ah,09
	int 21h
	lea dx,stoknin2
	mov ah,0ah
	int 21h
	cmp act2,0
	je nmatch
	mov al,act1
	cbw
	mov cx,ax
	push cx
	mov al,act2
	sub al,act1
	js nmatch
	mov di,0
	mov si,0
	lea bx,stokn2
	inc al
	
a2:				;compare
	mov ah,[bx+di]
	cmp ah,stokn1[si]
	jne a3
	inc si
	inc di
	dec cx
	cmp cx,0
	je match
	jmp a2
	
a3:
	inc bx
	dec al
	cmp al,0
	je nmatch
	mov si,0
	mov di,0
	pop cx
	push cx
	jmp a2
	
exit:
	call crlf
	ret
	
nmatch:			;output nomatch
	call crlf
	lea dx,m4
	mov ah,09
	int 21h
	jmp a1
	
match:			;ouput match
	call crlf
	lea dx,m3
	mov ah,09
	int 21h
	sub bx,offset stokn2
	inc bx
	call trans
	lea dx,m6
	mov ah,09
	int 21h
	jmp a1
		
crlf proc near	;crlf
	mov dl,0ah
	mov ah,2
	int 21h
	mov dl,0ah
	mov ah,2
	int 21h
	ret
crlf endp

trans proc near	;将二进制转化为十六进制
	mov ch,4
	
rotate:
	mov cl,4
	rol bx,cl
	mov al,bl
	and al,0fh
	add al,30h
	cmp al,3ah
	jl printit
	add al,7h
	
printit:
	mov dl,al
	mov ah,2
	int 21h
	dec ch
	jnz rotate
	ret

trans endp

main endp

prognam ends

	end start
	
	
	

	