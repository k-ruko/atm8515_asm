;boot, show user input and print user input
string:
	times 10 db 0 ;define 10 char

mov bx, 0
jmp input
xor eax, e
input:
	mov ah, 0
	int 0x16
	mov [string + bx], al ;input

	mov ah, 0x0e
	mov al, [string + bx] ;print input
	int 0x10

	inc bx
	cmp bx, 10
	je reset
	jmp input

reset:
	;set bx to 0 and print newline
	mov ah, 0x0e
	mov al, 10
	int 0x10
	mov bx, 0
	jmp print

print:
	mov ah, 0x0e
	mov al, [string + bx]
	int 0x10

	inc bx
	cmp bx, 10
	je exit
	jmp print

exit:
	jmp $
times 510-($-$$) db 0
db 0x55, 0xaa