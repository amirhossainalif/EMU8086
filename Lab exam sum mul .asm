; Write an assembly program to take two single digit numbers from user. 
; Make sure the inputs are numbers. Now, if the numbers are larger than 3,
; print the summation on the next line, otherwise, print the multiplication on the next line.

; Example:

; Input: 4, 5

; Output: 9       


.model small
.stack 100h

.data
    msg1 db 10, 13, "Enter first single digit number: $" 
    
    msg2 db 10, 13, "Enter second single digit number: $"  
    
    msg3 db 10, 13, "Summation: $"          
    
    msg4 db 10, 13, "Multiplication: $"    
    
    newline db 10, 13, "$"
    buffer db 10     
    num1 db ?         
    num2 db ?         
    result db ?       

.code
main proc
    
    mov ax, @data
    mov ds, ax

    mov dx,offset msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'     
    mov num1, al
                      
                      
    mov dx,offset msg2
    mov ah, 09h
    int 21h

  
    mov ah, 01h
    int 21h
    sub al, '0'   
    mov num2, al
    
    cmp num1, 3
    jbe multiply     
    cmp num2, 3
    jbe multiply   

    mov al, num1
    add al, num2
    mov result, al
    
    mov dx,offset msg3
    mov ah, 09h
    int 21h

    mov dl, result
    add dl, '0' 
    mov ah, 02h
    int 21h

    jmp exit
    
multiply:   
          
    mov al, num1
    mul num2
    mov result, al

    mov dx, offset msg4
    mov ah, 09h
    int 21h

    mov dl, result
    add dl, '0'     
    mov ah, 02h
    int 21h
    
    
exit:
        
    mov dx,offset newline
    mov ah, 09h
    int 21h

    
    mov ah,4ch
    int 21h 
    main endp
end



    
    