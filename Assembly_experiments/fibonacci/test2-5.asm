datarea segment
	string1 db 'Please input a number(1-100):N=','$'
	string2 db 13,10,'FIB(N)=','$'
	string3 db 13,10,13,10,'A number between 1 and 100 olease!',13,10,13,10,'$'
	
	N dw ?
	
	stoknin1 db 3,?,3 dup(?)	;input
	stoknin2 db 11 dup('0')		;output
	
	result1h dw 0
	result1l dw 0
	result2h dw 0
	result2l dw 0
	
	c10 dw 10
datarea ends

prognam segment
	assume cs:prognam, ds:datarea
start:
	mov ax,datarea
	mov ds,ax
	call input
	call fibonacci
	call output
	jmp quit
	
input proc
	jmp t1
	
wrong:
	lea dx,string3
	mov ah,09h
	int 21h
	
t1:
	lea dx,string1
	mov ah,09h
	int 21h
	lea dx,stoknin1
	mov ah,0ah
	int 21h
	mov ax,0
	mov cl,stoknin1+1
	mov ch,0
	lea bx,stoknin1+2
	
t2:
	mul c10
	mov dl,[bx]
	cmp dl,'0'
	jb wrong
	cmp dl,'9'
	ja wrong
	and dl,0fh
	add al,dl
	adc ah,0
	inc bx
	loop t2
	cmp ax,0064h
	ja wrong
	cmp ax,1
	jb wrong
	mov N,ax
	ret

input endp


fibonacci proc
	cmp N,1
	jz l1
	cmp N,2
	jz l2
	dec N
	call fibonacci
	mov ax,result2l
	mov dx,result2h
	mov cx,result1l
	add result2l,cx
	mov cx,result1h
	adc result2h,cx
	mov result1l,ax
	mov result1h,dx
	jmp exit1
	
l1:
	mov result1l,1
	mov result2l,1
	jmp exit1
	
l2:
	mov result2l,1
	dec N
	call fibonacci
	
exit1:
	ret
	
fibonacci endp


output proc
	mov ax,result2l
	lea si,stoknin2
	mov cx,5
r1:
	mov dx,0
	div c10
	inc si
	add [si],dl
	loop r1
	mov ax,result2h
	lea si,stoknin2
	mov cx,5	
r2:
	mov dx,0
	div c10
	inc si
	push cx
	cmp dx,0
	je noadd
	mov cx,dx
addn:
	call add65536
	loop addn
noadd:
	pop cx
	loop r2
	lea dx,string2
	mov ah,09h
	int 21h
	lea si,stoknin2
	mov bx,10
r3:
	cmp byte ptr [si+bx],'0'
	ja print
	dec bx
	jmp r3
	
print:
	mov dl,[si+bx]
	mov ah,02h
	int 21h
	dec bx
	cmp bx,1
	jae print
	ret
	
output endp


add65536 proc
	add byte ptr [si],6
	mov dl,0
	cmp byte ptr [si],3ah
	jb a1
	sub byte ptr [si],10
	mov dl,1
a1:
	add byte ptr [si+1],3
	add byte ptr [si+1],dl
	mov dl,0
	cmp byte ptr [si+1],3ah
	jb a2
	sub byte ptr [si+1],10
	mov dl,1
a2:
	add byte ptr [si+2],5
	add byte ptr [si+2],dl
	mov dl,0
	cmp byte ptr [si+2],3ah
	jb a3
	sub byte ptr [si+2],10
	mov dl,1
a3:
	add byte ptr [si+3],5
	add byte ptr [si+3],dl
	mov dl,0
	cmp byte ptr [si+3],3ah
	jb a4
	sub byte ptr [si+3],10
	mov dl,1
a4:
	add byte ptr [si+4],6
	add byte ptr [si+4],dl
	mov dl,0
	cmp byte ptr [si+4],3ah
	jb a0
	sub byte ptr [si+4],10
	mov dl,1
a5:
	add byte ptr [si+5],dl
	mov dl,0
	cmp byte ptr [si+5],3ah
	jb a0
	sub byte ptr [si+5],10
	mov dl,1
a6:
	add byte ptr [si+6],dl
	mov dl,0
	cmp byte ptr [si+6],3ah
	jb a0
	sub byte ptr [si+6],10
	mov dl,1
a7:
	add byte ptr [si+7],dl
	mov dl,0
	cmp byte ptr [si+7],3ah
	jb a0
	sub byte ptr [si+7],10
	mov dl,1
a8:
	add byte ptr [si+8],dl
	mov dl,0
	cmp byte ptr [si+8],3ah
	jb a0
	sub byte ptr [si+8],10
	mov dl,1
a9:
	add byte ptr [si+9],dl
a0:
	ret
add65536 endp


quit:
	mov ah,4ch
	int 21h
	
prognam ends

end start
	



	
	
