.model small
.stack 100h
.data


.code
main proc
    
    MOV AX, @DATA
    MOV DS, AX
    
    mov cx,80
    mov ah,2
    mov dl,'*'
    
    top:
    int 21h
    loop top
     

    MOV AH, 4CH
    INT 21H
    main endp
end
