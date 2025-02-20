;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Wed Nov 1 2023
; Processor: ATmega8515
; Compiler:  AVRASM (Proteus)
;====================================================================

;====================================================================
; DEFINITIONS
;====================================================================
.def	RegA = R17
.def	RegB = R18
;====================================================================
; VARIABLES
;====================================================================

;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
      rjmp  Start

;====================================================================
; CODE SEGMENT
;====================================================================

Start:
      ; Write your code here
      ldi RegA, 0b00001001 ; -9
      ldi RegB, 0b10000010 ; 2 --> 9 + -2 = 7 (0b00000111)
      
      add	RegA, RegB
      neg	RegA
Loop:
      rjmp  Loop

;====================================================================
