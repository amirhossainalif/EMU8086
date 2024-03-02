.model small
.stack 100h

.data
    input_msg db 10, 13, "Enter a number: $"
    less_than_msg db 10, 13, "Less than 5$"
    greater_than_msg db 10, 13, "Greater than 5$"
    equal_to_msg db 10, 13, "Equal to 5$"

.code
main:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Initialize CL with the value 5
    mov cl, 5

input_loop:
    ; Display message to enter a number
    mov ah, 09h
    lea dx, input_msg
    int 21h

    ; Read integer input from the user
    mov ah, 01h
    int 21h
    sub al, 30h ; Convert ASCII character to integer

    ; Compare the user input with the value in CL
    cmp al, cl
    jl less_than
    jg greater_than
    je equal_to

less_than:
    ; Display message: Less than 5
    mov ah, 09h
    lea dx, less_than_msg
    int 21h
    jmp input_loop

greater_than:
    ; Display message: Greater than 5
    mov ah, 09h
    lea dx, greater_than_msg
    int 21h
    jmp input_loop

equal_to:
    ; Display message: Equal to 5
    mov ah, 09h
    lea dx, equal_to_msg
    int 21h
    jmp input_loop

end_program:
    ; Terminate the program
    mov ah, 4Ch
    int 21h

end main
