datarea  segment
mess1    db    'Please input name:','$'
mess2    db    'Please input telephone number:','$'
mess3    db    'Do you want to search a telephone number?(y/n)','$'
mess4    db    0dh,0ah,'what is the name?','$'
mess5    db    'Not find',0dh,0ah,'$'
mess6    db    'the number you want to store:','$'
crlf     db     0dh,0ah,'$'
stokin1  label  byte
max1      db     21
act1      db     ?
stokn1    db     21 dup(?)
stokin2  label  word
max2      db     9
act2      db     ?
stokn2    db     9 dup(?)
numtable   db     50 dup(28 dup(?))
name_count dw    0
endaddr   dw     ?
swapped   dw     ?
totalnum dw   ?
savenp    db     28 dup(?),0dh,0ah,'$'
searchaddr dw    ?
flag      db     ?
flagb      db     ?
show      db     'name                phone',0dh,0ah,'$'
datarea  ends
codesg  segment
   assume ds:datarea,cs:codesg,es:datarea
main    proc    far
       mov ax,datarea
       mov ds,ax
       mov es,ax
       lea di,numtable     
       lea dx,mess6        
       mov ah,09   
       int 21h
       mov bx,0
  newchar:               
       mov ah,1         
       int 21h
       sub al,30h         
       jl next            
       cmp al,9           
       jg next            
       cbw                 
       xchg ax,bx          
       mov cx,10         
       mul cx                 
       xchg ax,bx               
       add bx,ax            
       jmp newchar               
   next:
       mov totalnum,bx
       lea dx,crlf
       mov ah,09
       int 21h
 a10:                              
       lea dx,mess1               
       mov ah,09
       int 21h
       call input_name  
       inc  name_count
       call stor_name 
       lea dx,mess2                
       mov ah,09
       int 21h
       call inphone
       call stor_phone
       cmp  name_count,0
       je  exit
       mov bx,totalnum
       cmp  name_count,bx       
       jnz  a10
       call name_sort
 a20:
       lea dx,mess3               
       mov ah,09
       int 21h
       mov ah,08                    
       int 21h
       cmp al,'y'
       jz  a30
       cmp al,'n'
       jz  exit
       jmp a20                          
 a30:
       mov ah,09
       lea dx,mess4             
       int 21h
       call input_name
 a40:
       call name_search
       
       jmp a20
 exit:
       mov ax,4c00h            
       int 21h
 main endp
input_name  proc  near
     mov ah,0ah
     lea dx,stokin1
     int 21h
     mov ah,09
     lea dx,crlf
     int 21h
     sub bh,bh
     mov bl,act1
     mov cx,21
     sub cx,bx              
b10:
     mov stokn1[bx],' '  
     inc bx
     loop b10

    ret
input_name endp
stor_name     proc   near
      lea  si,stokn1
      mov  cx,20
      rep  movsb
      ret
stor_name  endp
inphone   proc   near
     mov ah,0ah
     lea dx,stokin2
     int 21h
     mov ah,09
     lea dx,crlf
     int 21h
     sub bh,bh
     mov bl,act2
     mov cx,9
     sub cx,bx
c10:
     mov stokn2[bx],' '
     inc bx
     loop c10
     ret 
inphone endp
stor_phone  proc near
     lea  si,stokn2
     mov  cx,8
     rep  movsb  
     ret
stor_phone endp
name_sort  proc near     
     sub  di,28
     mov  endaddr,di
 c1:
     mov  swapped,0
     lea  si,numtable
 c2:
     mov  cx,20
     mov  di,si
     add  di,28
     mov  ax,di
     mov  bx,si  
     repz cmpsb   
     jbe  c3    
 ;chang order 
     mov si,bx
     lea di,savenp
     mov cx,28
     rep movsb
     mov cx,28
     mov di,bx
     rep movsb
     mov cx,28
     lea si,savenp
     rep movsb
     mov swapped,1
 c3:
     mov  si,ax
     cmp  si,endaddr
     jb   c2        
     cmp  swapped,0
     jnz  c1    
     ret
name_sort endp
name_search proc near
      lea  bx,numtable
	  mov  flag,0     

   d: 
     
      mov  cx,20
	  lea si,stokn1
      mov  di,bx
      repz cmpsb
      jz  d2
     
      add bx,28           
      cmp  bx,endaddr   
      jbe  d             
	  sub flag,0 
       jz  nof
    jmp  dexit        
 nof:  lea dx,mess5
       mov ah,09
       int 21h 
  d2:
      mov searchaddr,bx
	  inc flag
	  call printline
	   add bx,28          
      cmp  bx,endaddr   
      jbe  d            
      jmp  dexit         
       jnz  d
 dexit:
        ret
name_search endp
printline proc  near
       sub flag,0  
       jz  no
 p10:
       mov ah,09
       lea dx,show
       int 21h
       mov cx,28
       mov si,searchaddr
       lea di,savenp
       rep movsb
       lea dx,savenp
       mov ah,09
       int 21h
       jmp fexit
no:    lea dx,mess5
       mov ah,09
       int 21h 
fexit:  
       ret
printline endp
codesg ends
end main       
