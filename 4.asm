;================= PROG4.ASM =================
LIST P=16F628A                  ; Kullanılan mikrodenetleyici (PIC16F628A)
INCLUDE "P16F628A.INC"         ; Register ve sabit tanımları dahil edilir

__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF
; Konfigürasyon ayarları

;---------------------------------------------
ORG 0x0000                      ; Program başlangıç adresi

CLRF PORTB                      ; PORTB’yi temizle (tüm bitler 0)

BANKSEL TRISB                   ; TRISB’nin bulunduğu bankaya geç
CLRF TRISB                      ; TRISB = 0 → PORTB pinleri çıkış (output)

MOVLW 0xFF                      ; W = 0xFF
MOVWF TRISA                     ; TRISA = 0xFF → PORTA pinleri giriş (input)

BANKSEL PORTB                   ; PORTB/CMCON bankasına dön

MOVLW 0x07                      ; Comparator kapatma/dijital giriş için değer
MOVWF CMCON                     ; CMCON = 0x07 → RA0-RA3 dijital yapılır

TEST_PORTA                      ; Ana döngü etiketi

BTFSS PORTA, 0                  ; RA0 biti 1 ise sonraki komutu atla
BCF PORTB, 0                    ; RA0 = 0 ise RB0 bitini 0 yap (LED söndür)

BTFSS PORTA, 4                  ; RA4 biti 1 ise sonraki komutu atla
BSF PORTB, 0                    ; RA4 = 0 ise RB0 bitini 1 yap (LED yak)

GOTO TEST_PORTA                 ; Sonsuz döngü ile PORTA’yı sürekli kontrol et

END                             ; Program sonu
