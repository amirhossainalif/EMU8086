;  Procedural function

.model small
.data


.code
main proc
    
    call input
    call newline
    call output
    mov ah,4ch
    int 21h
    ret
    
input proc
    
    mov ah,1
    int 21h
    mov bl,al
    ret
    input endp
    
newline proc
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    ret
    newline endp

output proc
    mov ah,2
    mov dl,bl
    int 21h
    ret
    output endp


end
    