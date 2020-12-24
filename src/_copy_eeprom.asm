.export _copy_eeprom

.importzp ptr1

.proc _copy_eeprom
    sei
    sta  ptr1
    stx  ptr1+1

    lda  $321
    and  #%11111000
    sta  $321

    ldx  #$00
@L2:    
    ldy  #$00
@L1:    
    lda  (ptr1),y
@myinc:    
    sta  $E000,y
    iny
    bne  @L1
    inc  @myinc+2
    inc  ptr1+1
    inx
    cpx  #32
    bne  @L2


    jmp  $eb7e

.endproc
