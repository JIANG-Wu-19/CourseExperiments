datarea segment
	letter1 db ?
	digit1 db ?
	other1 db ?
	string label byte
		max db 80
		act db ?
		str db 80 dup(?)
	print db 13,10,'Please enter the string:','$'
	m1 db 13,10,'The total number of letter:','$'
	m2 db 13,10,'The total number of digit:','$'
	m3 db 13,10,'The total number of other character:','$'
datarea ends

prognam segment
	assume cs:prognam, ds:datarea
start:
	push ds
	sub ax,ax
	push ax
	mov ax,datarea
	mov ds,ax
	mov es,ax
	mov letter1,0
	mov digit1,0
	mov other1,0
	lea dx,print
	mov ah,09h
	int 21h
	lea dx,string
	mov ah,0ah
	int 21h
	sub ch,ch
	mov cl,[string+1]
	lea si,string+2
	
digitseg:
	mov al,[si]
	cmp al,'0'
	jb otherseg
	cmp al,'9'
	ja capitalletterseg
	inc digit1
	jmp loop1
	
capitalletterseg:
	cmp al,'A'
	jb otherseg
	cmp al,'Z'
	ja smallletterseg
	inc letter1
	jmp loop1
	
smallletterseg:
	cmp al,'a'
	jb otherseg
	cmp al,'z'
	ja otherseg
	inc letter1
	jmp loop1
	
otherseg:
	inc other1
	
loop1:
	inc si
	dec cl
	cmp cl,0
	jz print1
	jne digitseg
	
print1:
	lea dx,m1
	mov ah,09h
	int 21h
	mov al,letter1
	call disp
	lea dx,m2
	mov ah,09h
	int 21h
	mov al,digit1
	call disp
	lea dx,m3
	mov ah,09h
	int 21h
	mov al,other1
	call disp
	
exit:
	mov ah,4ch
	int 21h
	
disp:
	mov ah,0
	mov bl,10
	div bl
	add al,30h
	mov dl,al
	mov bh,ah
	mov ah,02h
	int 21h
	mov al,bh
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h
	ret
	
prognam ends

end start