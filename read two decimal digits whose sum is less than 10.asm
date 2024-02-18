;Write a Assembly emu8086 program to (a) display a “?”, (b) read two decimal digits whose sum is less than 10, (c) display them and their sum on the next line, with an appropriate message.
;Sample execution:
;?27
;THE SUM OF 2 AND 7 IS 9


.model small
.stack 100h
.data

a DB 10, 13, '?$'  

sum_msg DB 10, 13, 'The sum of $'
  
sum_msg2 DB  ' and $'

sum_msg3 DB  ' is $'



NEWL DB 10, 13, '$' 


.code
main proc
    mov AX,@DATA
    mov DS, AX 
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov AH,1
    int 21h
    mov BH,AL
    
    mov AH,1
    int 21h
    mov CH,AL 
    
    mov ah,9
    lea dx,NEWL
    int 21H
    
    mov ah,9
    lea dx,sum_msg
    int 21H
    
    mov DL,BH
    mov AH,02h
    int 21h   
    
    mov ah,9
    lea dx,sum_msg2
    int 21H
    
    mov DL, CH
    mov AH, 02h
    int 21h

    mov ah,9
    lea dx,sum_msg3
    int 21H
    
    ADD BH, CH
    sub BH, 30h
    
    mov AH,2
    mov DL,BH
    int 21h
    
    mov AH,4ch
    int 21h
    main endp
END