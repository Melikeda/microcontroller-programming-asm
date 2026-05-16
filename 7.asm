;================= PROG7.ASM =================
LIST P=16F628A                  ; Kullanılan mikrodenetleyici (PIC16F628A)
INCLUDE "P16F628A.INC"         ; Register ve sabit tanımları dahil edilir

__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF
; Konfigürasyon ayarları

COUNTER EQU 0x20                ; COUNTER için RAM adresi tanımlanır

;---------------------------------------------
ORG 0x0000                      ; Program başlangıç adresi

BANKSEL TRISB                   ; TRISB’nin bulunduğu bankaya geç
CLRF TRISB                      ; TRISB = 0 → PORTB pinleri çıkış (output)

BANKSEL PORTB                   ; Tekrar PORTB bankasına dön
CLRF PORTB                      ; PORTB’yi temizle (tüm bitler 0)

STARTLABEL                      ; Program başlangıç etiketi

CLRF PORTB                      ; PORTB’yi tekrar temizle
CLRF COUNTER                    ; COUNTER = 0

LOOPLABEL                       ; Döngü başlangıcı

MOVF COUNTER, W                 ; COUNTER değerini W’ye al
MOVWF PORTB                     ; W değerini PORTB’ye yaz

INCF COUNTER, F                 ; COUNTER = COUNTER + 1

MOVLW 0xF5                      ; W = 0xF5
SUBWF COUNTER, W                ; W = COUNTER - W  → COUNTER - 0xF5

BTFSS STATUS, 2                 ; Z flag = 1 mi? (sonuç 0 mı?)
GOTO LOOPLABEL                  ; Hayırsa döngüye devam et

FINALLABEL                      ; Evetse sonsuz döngüye gir
GOTO FINALLABEL                 ; Program burada kalır

END                             ; Program sonu
