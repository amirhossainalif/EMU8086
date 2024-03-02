.MODEL SMALL
.DATA
    msg1 DB 10, 13, "Enter a character: $"
    msg_capital DB 10, 13, "It's a capital letter.$"
    msg_small DB 10, 13, "It's a small letter.$"
    msg_other DB 10, 13, "Others.$"
    char_input DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX   
        
        
        
        LEA DX, msg1
        MOV AH, 09H
        INT 21H   
        
         MOV AH, 01H
        INT 21H
        MOV char_input, AL  
                              
      
        MOV BL, char_input
        CMP BL, 'A'
        JB  not_capital
        CMP BL, 'Z'
        JBE capital

    not_capital:
        ; Check if it's a small letter (a-z)
        CMP BL, 'a'
        JB  not_small
        CMP BL, 'z'
        JA  not_small

    small:
        ; Display message if it's a small letter
        LEA DX, msg_small
        JMP display_message

    not_small:
        ; Display message if it's neither capital nor small letter
        LEA DX, msg_other

    display_message:
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH     
        INT 21H

    capital:
        ; Display message if it's a capital letter
        LEA DX, msg_capital
        JMP display_message

    MAIN ENDP
END MAIN