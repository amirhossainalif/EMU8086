;Write· a program to read one of the hex digits A-F, and display it on the next line in decimal.
;Sample execution:
;ENTER A HEX DIGIT: F
;IN DECIMAL IT IS: 15    



.model small
.stack 100h

.data
    msg1 db 10,13,'ENTER A HEX DIGIT:$'
    msg2 db 10,13,'IN DECIMAL IS IT:$' 
    newl db 10,13,'$'

.code


    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov bl,al  
    
    lea dx,newl
    mov ah,9
    int 21h

    lea dx,msg2
    mov ah,9
    int 21h

    mov dl,49d
    mov ah,2
    int 21h

    sub bl,17d
    mov dl,bl
    mov ah,2
    int 21h
    

    mov ah,4Ch
    int 21h

end