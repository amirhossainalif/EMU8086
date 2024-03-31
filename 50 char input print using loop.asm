.model small
.stack 100h
.data  

msg1 DB 10, 13, "Enter a character: $"
char_input DB ?

.code
main proc
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, msg1
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    MOV char_input, AL
    
    MOV CX, 50         
    MOV AH, 02H         
    MOV DL, char_input
    
    top:
    int 21h
    loop top
     

    MOV AH, 4CH
    INT 21H
    main endp
end