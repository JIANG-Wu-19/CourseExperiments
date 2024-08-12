;1.题目：查找电话号码phone
;2.实验要求：
;（1）建立一个可存放50项的电话号码表，每项包括任命（20个字符）及电话号码（8个字符）两部分；
;（2）程序可接收输入人名及相应的电话号码，并把它们加入电话号码表中；
;（3）凡有新的输入后，程序应按照人名对电话号码表重新排序；
;（4）程序可接收需要查找电话号码的人名，并从电话号码表中查出其电话号码，再在屏幕上以如下格式显示出来。
;name tel.
;××× ×××

datarea segment
	m1 db 'Input name:','$'
	m2 db 'Input a telephone number:','$'
	m3 db 'Do you want a telephone number?(Y/N)','$'
	m4 db 'name?',13,10,'$'
	m5 db 'name',19 dup(0),'tel.',13,10,'$'
	m6 db 'Not find!',13,10,'$'
	num dw 0
	
	phone label byte	;电话号码
		pmax db 9
		pact db ?
		pho db 8 dup(?)
		
	name1 label byte		;姓名
		nmax db 21
		nact db ?
		nam db 20 dup(?)
		
	tel_tab db 50 dup(20 dup(?),4 dup(?),8 dup(?),13,10,'$')
	;每一项37字节
	tmp_nam db 20 dup(?);临时姓名单元
	tmp_tab db 20 dup(?),4 dup(?),8 dup(?),13,10,'$'	;临时标签，存储姓名、电话号码
datarea ends

prognam segment

main proc far
	assume cs:prognam, ds:datarea, es:datarea
	
start:
	push ds
	sub ax,ax
	push ax
	mov ax,datarea
	mov ds,ax
	mov es,ax
	
begin:
	lea dx,m1		;输入姓名
	mov ah,09h
	int 21h
	call clear		;清空tmp中内容
	call input_name
	cmp nact,0
	je search		;没有输入姓名，输入结束，开始排序查询
	call stor_name
	lea dx,m2
	mov ah,09h
	int 21h
	call inphone
	call name_sort
	jmp begin

search:
	lea dx,m3
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	cmp al,'N'
	je exit
	
	call crlf
	lea dx,m4
	mov ax,09h
	int 21h
	call input_name
	cmp nact,0
	je exit
	call name_search
	call printline
	jmp search

exit:
	ret
	
main endp



clear proc near
	lea di,tmp_tab
	xor al,al
	mov cx,32
	rep stosb
	lea di,tmp_nam
	xor al,al
	mov cx,14h
	rep stosb
	ret
clear endp


input_name proc near
	lea dx,name1
	mov ah,0ah
	int 21h
	call crlf
	ret
input_name endp


stor_name proc near
	cmp nact,0
	je exit1
	lea si,nam
	lea di,tmp_tab
	sub ch,ch
	mov cl,nact
	cld
	rep movsb
exit1:
	ret
stor_name endp


inphone proc near
	lea dx,phone
	mov ah,0ah
	int 21h
	cmp pact,0
	je exit2
	call crlf
	lea si,pho
	lea di,tmp_tab
	add di,23
	sub ch,ch
	mov cl,pact
	cld
	rep movsb
exit2:
	ret
inphone endp
	

name_sort proc near
	cmp num,0
	jnz sort
	lea si,tmp_tab
	lea di,tel_tab
	mov cx,23h
	cld
	repz movsb
	jmp exit3
sort:
	mov cx,num
	lea si,tmp_tab
	lea di,tel_tab
sortloop:
	push di
	push cx
	mov cx,20
	repz cmpsb
	ja move
	pop cx
	pop di
	call insert
	jmp exit3
move:
	pop cx
	pop di
	add di,23h
	lea si,tmp_tab
	loop sortloop
	mov cx,23h
	rep movsb
exit3:
	inc num
	ret
name_sort endp


insert proc near
	mov ax,num
insertloop:
	push ax
	mov bx,23h
	mul bx
	lea di,tel_tab
	add di,ax
	mov si,di
	sub si,23h
	push cx
	mov cx,23h
	rep movsb
	pop cx
	pop ax
	dec ax
	loop insertloop
	
	lea si,tmp_tab
	lea di,tel_tab
	mov bx,23h
	mul bx
	add di,ax
	mov cx,23h
	rep movsb
	ret
insert endp


crlf proc near
	mov dl,0ah
	mov ah,02h
	int 21h
	mov dl,0dh
	mov ah,02h
	int 21h
	ret
crlf endp


name_search proc near
	call clear
	mov ch,0
	mov cl,nact
	lea si,nam
	lea di,tmp_nam
	rep movsb
	mov cx,num
	lea di,tel_tab
	lea si,tmp_nam
searchloop:
	push di
	push cx
	mov ch,0
	mov cl,20
	repz cmpsb
	je found
	pop cx
	pop di
	add di,23h
	lea si,tmp_nam
	loop searchloop
	mov cx,0
	jmp exit4
found:
	pop cx
	pop di
exit4:
	ret
name_search endp


printline proc near
	cmp cx,0
	jnz next
	lea dx,m6
	mov ah,09h
	int 21h
	jmp exit5
next:
	lea dx,m5
	mov ah,09h
	int 21h
	mov ax,num
	sub ax,cx
	mov bx,35
	mul bx
	lea dx,tel_tab
	add dx,ax
	mov ah,09h
	int 21h
exit5:
	ret
printline endp

prognam ends

end start

;子模块namesort、namesearch