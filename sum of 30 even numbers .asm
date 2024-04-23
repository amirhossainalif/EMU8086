; Put the sum of 30 even numbers in a variable

.model small
.stack 100h

.data
sum dw ?  

.code
main:
    mov ax, @data
    mov ds, ax

    mov bx, 0   
    mov cx, 30 
    mov ax, 0   

sum_loop:
    add bx, 2  
    add ax, bx  
    loop sum_loop 
    
    mov sum, ax

    mov ax, 4Ch
    int 21h

end main
