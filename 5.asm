;===PROG5.ASM=====================================

LIST P=16F628A
INCLUDE "P16F628A.INC"

; Mikrodenetleyici konfigürasyon ayarları yapılır
__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & _LVP_OFF & _CP_OFF

CLRF PORTB           ; PORTB temizlenir, tüm bitler 0 yapılır

COUNTER1 EQU h'20'   ; COUNTER1 ismi, RAM'deki 0x20 adresine atanır

BANKSEL TRISB        ; TRISB register’ının bulunduğu bankaya geçilir

MOVLW H'FE'          ; W register’a 0xFE yüklenir
MOVWF TRISB          ; TRISB = 11111110 yapılır, sadece RB0 çıkış, diğer bitler giriş olur

MOVLW H'FF'          ; W register’a 0xFF yüklenir
MOVWF TRISA          ; TRISA = 11111111 yapılır, PORTA’daki tüm pinler giriş olur

BANKSEL PORTB        ; PORTB’nin bulunduğu bankaya geri dönülür

MOVLW h'07'          ; W register’a 0x07 yüklenir
MOVWF CMCON          ; Karşılaştırıcılar kapatılır, PORTA dijital giriş/çıkış gibi ayarlanır

STARTLABEL           ; Ana program başlangıç etiketi

MOVLW H'0A'          ; W register’a 10 değeri yüklenir
MOVWF COUNTER1       ; COUNTER1 değişkenine 10 değeri yazılır

TEST                 ; Kontrol döngüsü başlangıcı

BTFSC PORTA,0        ; PORTA’nın 0. biti kontrol edilir, bit 0 ise sonraki komut atlanır
GOTO TEST            ; Bit 1 ise tekrar TEST etiketine dönülür ve beklenir

NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir
NOP                  ; 1 komut çevrimi kadar beklenir

DECFSZ COUNTER1,F    ; COUNTER1 bir azaltılır, sonuç 0 ise sonraki komut atlanır
GOTO TEST            ; COUNTER1 sıfır değilse tekrar TEST etiketine dönülür

BSF PORTB,0          ; PORTB’nin 0. biti 1 yapılır

LOOPLABEL            ; Sonsuz döngü etiketi
GOTO LOOPLABEL       ; Program burada sonsuz döngüye girer

END                  ; Program sonu
