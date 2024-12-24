
/*
 * main_asm.s
 *
 * Created: 3/14/2024 11:15:53 PM
 *  Author: mrhitj
 */ 
.equ allout=0xff
.def temp=r16
.cseg
.org 0000
;menyiapkan Stack Pointer
ldi temp,low(ramend)
out spl,temp
ldi temp,high(ramend)
out sph,temp
;-konfigurasi i/o ----
ldi temp,allout
out ddrf,temp
out ddrd,temp
ldi temp,0b00000000
out portf,temp
ldi temp,0b11111111
out portd,temp
main:
	rjmp main
.exit
