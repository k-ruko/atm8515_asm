[org 0x7c00]
mov ah, 0x0e
mov al, [string]
int 0x10
mov bx, 0 ; use bx as counter
jmp print

string:
	db 'Welcome to Black Mesa OS', 0

print:
	inc bx
	mov al, [string + bx]
	int 0x10
	cmp bx, 24
	je exit
	jmp print

exit:
	jmp $
times 510-($-$$) db 0
db 0x55, 0xaa

