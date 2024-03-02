.MODEL SMALL
.DATA
    msg1 DB 10, 13, "Enter a character: $"
    newline DB 10, 13, '$'
    char_input DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        ; Display message to enter a character
        LEA DX, msg1
        MOV AH, 09H
        INT 21H

        ; Read character input
        MOV AH, 01H
        INT 21H
        MOV char_input, AL
                             
        LEA DX, newline
        MOV AH, 09H
        INT 21H                     
        ; Display the character 50 times
        MOV CX, 50          ; Set loop counter to 50
        MOV AH, 02H         ; Function to display character
        MOV DL, char_input ; Load the character to display

    DISPLAY_LOOP:
        INT 21H             ; Display the character
        DEC CX              ; Decrement loop counter
        JNZ DISPLAY_LOOP    ; Continue loop until CX becomes zero

        ; Display newline
        LEA DX, newline
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH         ; Exit program
        INT 21H

    MAIN ENDP
END MAIN
