.model small
.stack 100h

.data
    input_msg db 10, 13, "Enter a character: $"
    output_vowel db 10, 13, "The character is a vowel.$"
    output_not_vowel db 10, 13, "The character is not a vowel.$"
    char db ?

.code
main:
    
    mov ax, @data
    mov ds, ax

    ; Display message to enter a character
    mov ah, 09h
    lea dx, input_msg
    int 21h

    ; Read character input from the user
    mov ah, 01h
    int 21h
    mov char, al

    ; Check if the character is a vowel
    mov ah, 0
    mov al, char
    cmp al, 'A'   
    jl not_vowel
    cmp al, 'Z'   
    jg check_lower
    ; If it's within range of uppercase letters, convert to lowercase
    add al, 32
    ; fall through to check lowercase

check_lower:
    cmp al, 'a'   
    jl not_vowel
    cmp al, 'z'   
    jg not_vowel
    ; If it's within range of lowercase letters, proceed to check vowels

    ; Check if the character is a vowel
    cmp al, 'a'
    je is_vowel
    cmp al, 'e'
    je is_vowel
    cmp al, 'i'
    je is_vowel
    cmp al, 'o'
    je is_vowel
    cmp al, 'u'
    je is_vowel

not_vowel:
    ; Display message that character is not a vowel
    mov ah, 09h
    lea dx, output_not_vowel
    int 21h
    jmp end_program

is_vowel:
    ; Display message that character is a vowel
    mov ah, 09h
    lea dx, output_vowel
    int 21h

end_program:
    mov ah, 4Ch
    int 21h

end main
