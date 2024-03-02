;   Read two character and display it new line

.MODEL SMALL
.DATA
    msg1 DB 10, 13, "Enter two characters: $"
    newline DB 10, 13, '$'
    char_input1 DB ?
    char_input2 DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

     
        LEA DX, msg1
        MOV AH, 09H
        INT 21H

        ; Read first character input
        MOV AH, 01H
        INT 21H
        MOV char_input1, AL

        ; Read second character input
        MOV AH, 01H
        INT 21H
        MOV char_input2, AL 
        
        LEA DX, newline
        MOV AH, 09H
        INT 21H


        ; Display first character
        MOV DL, char_input1
        MOV AH, 02H
        INT 21H

      
       

        ; Display second character
        MOV DL, char_input2
        MOV AH, 02H
        INT 21H
                  
      

        MOV AH, 4CH       
        INT 21H

    MAIN ENDP
END MAIN
