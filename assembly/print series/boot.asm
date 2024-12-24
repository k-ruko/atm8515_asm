mov ah, 0x0e    ;switch to tty
mov al, 'a'      ;print char
int 0x10        ;call interrupt
jmp lower
lower:
	inc al
	cmp al, 'z' + 1
	jmp reset
	int 0x10
	jmp lower
upper:
	inc al
	cmp al, 'Z' + 1
	jmp exit
	int 0x10
	jmp upper
reset:
	mov al, 0x0e
	mov al, 'A'
	int 0x10
	jmp upper

exit:
    jmp $
;boot sector
times 510-($-$$) db 0
db 0x55, 0xaa
