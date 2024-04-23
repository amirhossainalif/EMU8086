;Write an assembly program to create a simple calculator that will facilitate the features like Addition, Subtraction. Also, if a user gives a wrong input, show the ERROR message, and ask for input again

.model small
.stack 100h

.data
    message1 db 10, 13, "Enter first number: $"
    message2 db 10, 13, "Enter second number: $"
    message3 db 10, 13, "Enter operation (+, -, *, /): $"
    message4 db 10, 13, "Result: $"
    error_message db 10, 13, "Error: Invalid input.$" 
    newl db 10,13, '$'
    num1 db ?
    num2 db ?
    operation db ?
    result db ?

.code
main:
    mov ax, @data
    mov ds, ax

input_numbers:
    
    mov ah, 09h
    lea dx, message1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h 
    mov num1, al

    mov ah, 09h
    lea dx, message2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h 
    mov num2, al

input_operation:

    mov ah, 09h
    lea dx, message3
    int 21h

    mov ah, 01h
    int 21h
    mov operation, al

    cmp operation, '+'
    je addition
    cmp operation, '-'
    je subtraction
    cmp operation, '*'
    je multiplication
    cmp operation, '/'
    je division
    jmp error

addition:
    mov al, num1
    add al, num2
    mov result, al
    jmp display_result

subtraction:
    mov al, num1
    sub al, num2
    mov result, al
    jmp display_result

multiplication:
    mov al, num1
    mul num2
    mov result, al
    jmp display_result

division:
    mov al, num1
    xor ah, ah
    mov bl, num2
    div bl
    mov result, al
    jmp display_result

display_result:
    
    mov ah, 09h
    lea dx, message4
    int 21h

    mov dl, result
    add dl, 30h 
    mov ah, 02h
    int 21h  
    
    mov ah, 09h
    lea dx, newl
    int 21h

    jmp input_numbers

error:

    mov ah, 09h
    lea dx, error_message
    int 21h
    jmp input_operation 
    
Exit_program:

    mov ah, 4Ch
    int 21h
    

end main
