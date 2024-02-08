.model small
.stack 100h
.data 
A DB ?
B DB ?
NEWL DB 10, 13, '$' 


.code
main proc
    mov AX,@DATA
    mov DS, AX   
    
    mov bh,3   ; declerd value1
    mov ch,4   ; declerd value2
    
    add BH,CH  ; addition
    add BH,30h 
    
    mov AH,2   ; print addition value
    mov DL,BH
    int 21h
    
    mov ah,9
    lea dx,NEWL
    int 21H
    
    sub BH,CH   ; subtraction from addition
    
    mov AH,2    ; print sub value
    mov DL,BH
    int 21h   
    
    mov ah,9
    lea dx,NEWL
    int 21H
    mov ah,9
    lea dx,NEWL
    int 21H
    
    mov AH,1   ;user input1
    int 21h
    mov A,AL
    
    mov AH,1   ;user input2
    int 21h
    mov B,AL 
    
    mov bh,A
    xchg bh,B
    mov A,bh 
               
    mov ah,9     ; for new line 
    lea dx,NEWL
    int 21H
    
    mov ah,9
    lea dx,NEWL
    int 21H
    
    mov AH,2     ; print xchange value1
    mov DL,A
    int 21h
    
    mov ah,9
    lea dx,NEWL  ; print new line
    int 21H
    
    mov AH,2     ; print xchange value2
    mov DL,B
    int 21h
    
    mov AH,4ch
    int 21h
    main endp
END