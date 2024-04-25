.model small
.data
a db "Enter value: $"
b db "Output: $"
.code
main proc  
    
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21H 
    
    xor cx, cx
    mov ah,1
    int 21h
    
while_:

    cmp al, 13
    je output_
    push ax
    inc cx
    int 21h
    jmp while_
    
output_:

    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah,9
    lea dx,b
    int 21H 
    
    mov ah, 2
    jcxz exit
    
top:

    pop dx
    int 21h
    loop top
    
exit:
     
    mov ah, 4ch
    int 21h
    main endp
end
    
    