; loop using com,je,jmp


.model small
.stack 100h

.data
    newl db 10,13,'$' 
    a DB " HELLO WORLD", 10,13,'$'
    b DB 10,13, ' BYE WORLD$'  ;, 10,13,'$'

.code


    mov ax,@data
    mov ds,ax 
           
    mov BH, 5
    
    
    mov cl, 0
    
  START:
         
    
    cmp cl, bh
    
    je BYE
    
    mov ah,9
    lea dx,a
    dec bh
    int 21h  
    
    jmp START
     
    
  BYE:
    
    mov ah,9
    lea dx,b
    int 21h
         
    

    mov ah,4Ch
    int 21h

end