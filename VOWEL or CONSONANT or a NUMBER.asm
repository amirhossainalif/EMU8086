;  Write an assembly program to find whether a character (user input) is VOWEL or CONSONANT or a NUMBER? If user gives any wrong input, show ERROR message.

.model small
.stack 100h

.data
    message1 db 10, 13, "Enter a character: $"
    message2 db 10, 13, "Vowel.$"
    message3 db 10, 13, "Consonant.$"
    message4 db 10, 13, "Number.$"
    message5 db 10, 13, "Error: Invalid input.$"
    newl db 10,13, '$'

.code
main:
    mov ax, @data
    mov ds, ax 
    
Start: 

    mov ah, 09h
    lea dx, message1
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al 

    cmp bl, 'A'
    jl not_letter
    cmp bl, 'Z'
    jg check_lower
 
    cmp bl, 'A'
    je vowel
    cmp bl, 'E'
    je vowel
    cmp bl, 'I'
    je vowel
    cmp bl, 'O'
    je vowel
    cmp bl, 'U'
    je vowel
    jmp consonant

check_lower:
    cmp bl, 'a'
    jl not_letter
    cmp bl, 'z'
    jg not_letter

    cmp bl, 'a'
    je vowel
    cmp bl, 'e'
    je vowel
    cmp bl, 'i'
    je vowel
    cmp bl, 'o'
    je vowel
    cmp bl, 'u'
    je vowel
    jmp consonant

vowel:

    mov ah, 09h
    lea dx, message2
    int 21h
    
    mov ah, 09h
    lea dx, newl
    int 21h

    jmp Start

consonant:
    
    mov ah, 09h
    lea dx, message3
    int 21h   
    
    mov ah, 09h
    lea dx, newl
    int 21h
    
    jmp Start

not_letter:
   
    cmp bl, '0'
    jl error
    cmp bl, '9'
    jg error
   
    mov ah, 09h
    lea dx, message4
    int 21h   
    
    mov ah, 09h
    lea dx, newl
    int 21h

    jmp Start

error:
  
    mov ah, 09h
    lea dx, message5
    int 21h

end_program:
    mov ah, 4Ch 
    int 21h
end main
