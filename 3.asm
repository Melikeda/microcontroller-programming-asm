;===PROG3.ASM=====================================

LIST P=16F628A
INCLUDE "P16F628A.INC"

; Mikrodenetleyici konfigürasyon ayarları yapılır
__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF

ORG h'0000'          ; Program 0x0000 adresinden başlar

CLRF PORTB           ; PORTB tüm bitleri 0 yapılır

BANKSEL TRISB        ; TRISB register bankına geçilir
CLRF TRISB           ; PORTB pinlerinin hepsi çıkış yapılır

MOVLW h'FF'          ; W register’a 0xFF yüklenir
MOVWF TRISA          ; PORTA pinlerinin hepsi giriş yapılır (1 = input)

BANKSEL PORTB        ; PORTB register bankına geri dönülür

MOVLW h'07'          ; W register’a 0x07 yüklenir
MOVWF CMCON          ; Karşılaştırıcılar kapatılır, PORTA dijital giriş/çıkış gibi ayarlanır

STARTLABEL           ; Ana program başlangıcı

MOVF PORTA, W        ; PORTA’daki değer W register’a alınır
MOVWF PORTB          ; W’deki değer PORTB’ye yazılır

GOTO STARTLABEL      ; Program başa dönerek sürekli aynı işlemi tekrar eder

END                  ; Program sonu
