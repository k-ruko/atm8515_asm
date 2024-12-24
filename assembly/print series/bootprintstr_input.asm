; create a bootable that show user input/typing
char:
	db 0
mov cx, 0 ; counter
mov ah, 0 ; set ah to 0 if int 0x16
int 0x16  ; 0x16 is interrupt for input
mov [char], al ; move input to char

mov ah, 0x0e ; set to tty
mov al, [char] ; mov char to al
int 0x10 ; int to print

print:
	inc cx
	mov ah, 0
	int 0x16
	mov [char], al
	
	mov ah, 0x0e
	mov al, [char]
	int 0x10

	cmp cx, 20 ; compare cx and 20, where 20 is limit 
	je exit ; if equal jump to exit
	jne print ; if not equal jump to print

exit:
	jmp $

times 510-($-$$) db 0
db 0x55, 0xaa