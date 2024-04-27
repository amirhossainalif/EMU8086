;  Hexa to binary

.model small
.data

a db "Enter a Hexa value: $"
b db "Binary Output: $"

.code
main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov bx,0    
    mov cl,4
    mov ah,1
    
    input_:
    int 21h
    cmp al,13
    je output_
    cmp al,41h
    
    jge letter
    and al,0fh
    jmp shift
    
    letter:
    sub al,37h
    
    shift:
    shl bx,cl
    or bl,al
    jmp input_
    
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
    