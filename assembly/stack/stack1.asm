
mov bh, 30
push bx

;now 30 is in stack
;| 30 |  | 

mov ah, 0x0e
mov al, bh
int 0x10

;do something, example addition using bh
mov bh, 50
add bh, 10
mov ch, bh

mov ah, 0x0e
mov al, ch
int 0x10
pop bx
;restore previous value 30

mov ah, 0x0e
mov al, bh
int 0x10

exit:
	jmp $
times 510-($-$$) db 0
db 0x55, 0xaa