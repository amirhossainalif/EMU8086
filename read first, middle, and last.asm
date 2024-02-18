;Write a Assembly emu8086  program to (a) prompt the user, (b) read first, middle, and last initials of a person's name, and (c) display them down the left margin.
;Sample execution:
;ENTER THREE INITIALS: JFK
;JFK
;FK
;K


.model small
.stack 100h
.data
     
i DB 10, 13, 'ENTER THREE INITIALS: $'

a DB ? 

b DB ?
  
c DB ?

NEWL DB 10, 13, '$' 


.code
main proc
    mov AX,@DATA
    mov DS, AX
    
    mov ah,9
    lea dx,i
    int 21H 
    
    mov AH,1
    int 21h
    mov a,AL
    
    mov AH,1
    int 21h
    mov b, AL 
    
    mov AH,1
    int 21h
    mov c,AL 
    
    mov ah,9
    lea dx,NEWL
    int 21H
    
    mov ah,9
    lea dx,a
    int 21H
   
    mov ah,9
    lea dx,b
    int 21H

    mov ah,9
    lea dx,c
    int 21H
    
    mov AH,4ch
    int 21h
    main endp
END