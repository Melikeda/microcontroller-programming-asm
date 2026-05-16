;===PROG2.ASM=====================================

LIST P=16F628A
INCLUDE "P16F628A.INC"

; Mikrodenetleyici konfigürasyon ayarları yapılır
__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF

ORG h'0000'          ; Program 0x0000 adresinden başlar

CLRF PORTB           ; PORTB tüm bitleri 0 yapılır

BANKSEL TRISB        ; TRISB register bankına geçilir
CLRF TRISB           ; PORTB pinlerinin hepsi çıkış yapılır (0 = output)

BANKSEL PORTB        ; PORTB register bankına geri dönülür

STARTLABEL           ; Ana program başlangıcı

MOVLW h'55'          ; W register’a 0x55 (01010101) yüklenir
MOVWF PORTB          ; Bu değer PORTB’ye yazılır

LOOPLABEL            ; Sonsuz döngü etiketi
GOTO LOOPLABEL       ; Program burada sonsuza kadar kalır

END                  ; Program sonu
