;================= PROG6.ASM =================
LIST P=16F628A                  ; Kullanılan mikrodenetleyici (PIC16F628A)
INCLUDE "P16F628A.INC"         ; Register ve sabit tanımları dahil edilir

__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF
; Konfigürasyon ayarları

;---------------------------------------------
ORG 0x0000                      ; Program başlangıç adresi

BANKSEL TRISB                   ; TRISB’nin bulunduğu bankaya geç
CLRF TRISB                      ; TRISB = 0 → PORTB pinleri çıkış (output)

BANKSEL PORTB                   ; Tekrar PORTB bankasına dön
CLRF PORTB                      ; PORTB’yi temizle (tüm bitler 0)

START                           ; Program başlangıç etiketi

MOVLW 0x04                      ; W = 0x04
SUBLW 0x05                      ; W = 0x05 - W → sonuç = 0x01

MOVF STATUS, W                  ; STATUS register içeriğini W’ye al (flag’leri oku)
MOVWF PORTB                     ; STATUS değerini PORTB’ye yaz (LED’lerde göster)

FINALLABEL                      ; Sonsuz döngü etiketi
GOTO FINALLABEL                 ; Program burada sürekli döner

END                             ; Program sonu
