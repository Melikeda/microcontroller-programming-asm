;===PROG5.ASM=====================================
LIST P=16F628A
INCLUDE "P16F628A.INC"
__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF& _LVP_OFF & _CP_OFF
CLRF PORTB			;portb is cleared.
COUNTER1 EQU h'20'
BANKSEL TRISB		;go to bank1
MOVLW H'FE'			;h'FE'->W
MOVWF TRISB			;W->trisb ---  all the bits except 1 of portb are output.
MOVLW H'FF'			;h'FF'->W
MOVWF TRISA			;W->trisa ---  all the bits of porta are input.
BANKSEL PORTB		;go to bank0
MOVLW h'07'			;b'00000111'->W
MOVWF CMCON			;the inputs of porta are arranged as digital I/O
STARTLABEL
MOVLW H'0A'			;d'10'->W
MOVWF COUNTER1		;W->COUNTER1
TEST
BTFSC PORTA,0		;is the zeroth bit of porta 1?
GOTO TEST			;No, test again.
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
NOP					;wait for one instruction cycle
DECFSZ COUNTER1,F	;COUNTER1=COUNTER1-1, COUNTER1=0?
GOTO TEST		;No, test again
BSF PORTB,0
LOOPLABEL
GOTO LOOPLABEL
END					
;---------------------------
