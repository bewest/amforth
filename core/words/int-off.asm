; ( -- sreg ) 
; Interrupt
; turns off all interrupts and leaves SREG in TOS
VE_INTOFF:
    .dw $ff04
    .db "-int"
    .dw VE_HEAD
    .set VE_HEAD = VE_INTOFF
XT_INTOFF:
    .dw PFA_INTOFF
PFA_INTOFF:
    savetos
    clr tosh
    in tosl, SREG
    cli
    jmp_ DO_NEXT
