datarea segment
	mess1 db 'Enter keyword:','$'
	mess2 db 'Enter Sentence:','$'
	mess3 db 'Match at location:','$' 
	mess4 db 'No match!',13,10,'$ '
	mess5 db 'match.',13,10,'$ '
	mess6 db 'H of the sentence.',13,10,'$ '
;
stoknin1 label byte
	max1 db 10
	act1 db ?
	stokn1 db 10 dup(?)
;
stoknin2 label byte
	max2 db 50
	act2 db ?
	stokn2 db 50 dup(?)
datarea ends

prognam segment
main proc far
	assume cs:prognam ,ds:datarea,es:datarea
start:
	push ds 
	sub ax,ax
	sub bx,bx
	push ax		
	mov ax,datarea
	mov ds,ax
	mov es,ax

	lea dx,mess1			
	mov ah,09
	int 21h
	lea dx,stoknin1
	mov ah,0ah
	int 21h			
	cmp act1,0
	je exit	        			
a10:					
	call crlf
	lea dx,mess2
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
	lea bx,stokn2;
	inc al				
a20:
	mov ah,[bx+di]			
	cmp ah,stokn1[si]               
	jne a30                         
	inc si
	inc di
	;inc bx
	dec cx
	cmp cx,0
	je match
	jmp a20			
a30:
	inc bx
	dec al
	cmp al,0
	je nmatch
	mov si,0
	mov di,0
	pop cx
	push cx
	jmp a20	
exit:   
	call crlf	
	ret 
nmatch:			
	call crlf	
	lea dx,mess4
	mov ah,09
	int 21h
	jmp a10
match:		
	call crlf				
	lea dx,mess3
	mov ah,09
	int 21h				
	sub bx,offset stokn2
	inc bx					
	call trans 			
	lea dx,mess6
	mov ah,09
	int 21h                         
	jmp a10
crlf proc near 			
	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	mov ah,2
	int 21h
	ret
crlf   endp
trans proc near
	mov ch,4 		 ;number of digits
rotate: mov cl,4  	         ;set count to 4bits
	rol bx,cl		 ;left digit to right
	mov al,bl		 ;mov to al
	and al,0fh		 ;mask off left digit
	add al,30h		 ;convert hex to ASCII
	cmp al,3ah		 ;is it>9?
	jl printit		 ;jump if digit=0 to 9
	add al,7h		 ;digit is A to F
printit:
	mov dl,al 		 ;put ASCII char in DL
	mov ah,2		 ;Display Output funct
	int 21h			 ;call DOS
	dec ch			 ;done 4 digits?
	jnz rotate		 ;not yet
	ret			 ;return from trans
trans endp			;
main endp
;----------------------------------
prognam ends
;**********************************	
	end start		