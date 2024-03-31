.model small
.stack 100h

.data
    msg db 10, 13, 'ASCII Value: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 256

    mov dl, 0 
      
   Printloop: 
   
    mov ah, 2h  
    int 21h     

    inc dl      
    loop Printloop 

    mov ah, 4Ch
    int 21h     

end main
