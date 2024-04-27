;  binary input output

.model small
.data

a db "Enter a binary value: $"
b db "Output: $"

.code
main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov bx,0    ;xor bx,bx
    mov cx,16
    
    input_:
    mov ah,1
    int 21h
    cmp al,13
    je output_
    and al,0fh ;sub al,30h
    
    shl bx,1
    or bl,al
    loop input_
    
    output_: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,b
    int 21h 
    
    mov cx,16
    
    output_1:
    shl bx,1
    jnc zero
    mov ah,2
    mov dl,31h
    int 21h
    jmp output_loop
    
    zero:
    mov ah,2
    mov dl,30h
    int 21h
    
    output_loop:
    loop output_1
    
    mov ah,4ch
    int 21h
    main endp
end
    