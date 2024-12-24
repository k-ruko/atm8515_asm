mov ah, 0x0e
mov bl, 'B'
mov dl, 'a'
jmp main
main:
	mov al, dl
	int 0x10
	mov al, bl
	int 0x10
	add dl, 2
	add bl, 2
	cmp bl, 'Z' + 2
	je exit
	jmp main
exit:
	jmp $

times 510-($-$$) db 0
db 0x55, 0xaa

