;================= PROG1.ASM =================
LIST P=16F628A                  ; Kullanılan mikrodenetleyici (PIC16F628A)
INCLUDE "P16F628A.INC"         ; Register ve sabit tanımları dahil edilir

__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF  
; Konfigürasyon ayarları (osilatör, watchdog vs.)

;---------------------------------------------
ORG 0x0000                      ; Program başlangıç adresi

CLRF PORTB                      ; PORTB’nin tüm bitlerini 0 yap (temizle)

BSF STATUS, RP0                 ; Bank1'e geç (RP0 = 1)
CLRF TRISB                      ; TRISB = 0 → tüm PORTB pinleri çıkış (output)
BCF STATUS, RP0                 ; Tekrar Bank0’a dön (RP0 = 0)

BASLA                           ; Başlangıç etiketi (label)

BSF PORTB, 0                    ; RB0 pinini 1 yap (LED yanar)

DONGU                           ; Sonsuz döngü etiketi
GOTO DONGU                      ; Sürekli aynı yere git (infinite loop)

END                             ; Program sonu (bundan sonrası çalışmaz)
