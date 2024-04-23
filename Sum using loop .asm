; Put the sum 100 + 95 + 90 + ... + 5 in AX. Hints: Employ LOOP instructions to do the following.

.model small
.stack 100h

.data
    sum dw ?

.code
main:
    mov ax, @data
    mov ds, ax
    
    mov ax, 0    
    mov cx, 20  

    mov bx, 100  
    mov dx, 5     

sum_loop:
    add ax, bx    
    sub bx, dx    
    loop sum_loop 
    
    mov sum, ax

    mov ah, 4Ch
    int 21h
end main
