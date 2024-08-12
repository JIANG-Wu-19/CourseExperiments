datarea segment
	m1 db 'Input name:','$'
	m2 db 'Input a telephone number:','$'
	m3 db 'Do you want a telephone number?(Y/N)','$'
	m4 db 'name?',0ah,0dh,'$' 
	m5 db 'name',19 dup(0),'tel.',0ah,0dh,'$'
	m6 db 'Not find!',0ah,0dh,'$'
	m7 db 'wrong telephone number'
	num dw 0;用来标识电话表中数据个数

	phone label byte
		pmax db 9
		pact db ?
		pho db 9 dup(?)
		
	name1 label byte
		nmax db 21
		nact db ?
		nam db 21 dup(?)
		
	tmp_nam db 21 dup(?);临时单元
	tmp_tab db 21 dup(?),4 dup(?),9 dup(?),13,10,'$'
	;临时储存tel_tab中一项
	tel_tab db 50 dup(21 dup(?),4 dup(?),9 dup(?),13,10,'$')
	;37字节
datarea ends


prognam segment

main proc far
    assume cs:prognam,ds:datarea,es:datarea     
start:
    push ds
    sub ax,ax
    push ax
    mov ax,datarea
    mov ds,ax
    mov es,ax
begin:
    lea dx,m1;输入名字
    mov ah,09h
    int 21h
    call clear
    call input_name
    cmp nact,0
    je search
    call stor_name
    lea dx,m2
    mov ah,09h
    int 21h
    call inphone
    call name_sort
    jmp begin
search:
    mov ah,09
    lea dx,m3
    int 21h
    mov ah,01h
    int 21h
    cmp al,'N'
    je exit

    call crlf
    mov ah,09
    lea dx,m4
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
	call judge
    call crlf
    lea si,pho
    lea di,tmp_tab
    add di,24;phone
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
    lea si,tmp_tab;如果表项中没有内容，直接插入
    lea di,tel_tab
    mov cx,37
    cld
    repz movsb
    jmp exit3
sort:
    mov cx,num
    lea si,tmp_tab
    lea di,tel_tab
loopsort:
    push di
    push cx
    mov cx,21
    repz cmpsb
    ja move
    pop cx
    pop di
    call insert
    jmp exit3
move:
    pop cx
    pop di
    add di,37
    lea si,tmp_tab
    loop loopsort
    mov cx,37
    rep movsb
exit3:
    inc num
    ret
name_sort endp


insert proc near
    mov ax,num
loopinsert:
    push ax
    mov bx,37
    mul bx
    lea di,tel_tab
    add di,ax
    mov si,di
    sub si,37
    push cx
    mov cx,37
    rep movsb
    pop cx
    pop ax
    dec ax
    loop loopinsert

    lea si,tmp_tab
    lea di,tel_tab
    mov bx,37
    mul bx
    add di,ax
    mov cx,37
    rep movsb
    ret
insert endp


name_search proc near
    call clear
    mov ch,0
    mov cl,nact
    lea si,nam
    lea di,tmp_nam
    rep movsb
    mov cx,num;搜寻名字循环次数
    lea di,tel_tab
    lea si,tmp_nam
loopfind:
    push di
    push cx
    mov ch,0
    mov cl,21
    repz cmpsb
    je found
    pop cx
    pop di
    add di,37
    lea si,tmp_nam
    loop loopfind
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
    mov ah,09
    lea dx,m6;未找到
    int 21h
    jmp exit5
next:
    lea dx,m5
    mov ah,09
    int 21h
    mov ax,num
    sub ax,cx
    mov bx,37
    mul bx
    lea dx,tel_tab
    add dx,ax
    mov ah,09
    int 21h
exit5:
    ret
printline endp


crlf proc near
    mov dl,0ah
    mov ah,02h
    int 21h
    mov dl,0dh
    mov ah,02h
    int 21h
    ret
crlf endp


clear proc near
    lea di,tmp_tab
    xor al,al
    mov cx,34
    rep stosb
    lea di,tmp_nam
    xor al,al
    mov cx,21
    rep stosb
    ret
clear endp


prognam ends
    end start
