\ some definitions that may be useful

\ dump free ressources
: .res ( -- ) 
    base @ >r
    decimal
    ver ."  running at " f_cpu 1000 um/mod . drop ." kHz " cr
    s" mcu-info" environment? if
       2 + @i dp -
	." free FLASH cells        " u. cr
	else 
	  ." no flash size information available " cr 
	then
	." free RAM bytes          " unused u. cr
	." used EEPROM bytes       " edp u. cr
	." used data stack cells   " depth u. cr
	." used return stack cells " rp0 rp@ - 1- 1- 2/ u. cr
	." free return stack cells " rp@ sp0 - 1+ 1+ 2/ u. cr
    r> base !
;


\ calculates the baudrate register values
\ the two bytes of the result should be
\ transferred in high - low order

\ ( baudrate -- baud-rate-register)
: calc-baudrate
    f_cpu
    d2/ d2/ d2/ d2/
    rot um/mod
    swap drop 1-
;

\ print current BASE in decimal, keep BASE intact
: .base ( -- )
    base @ dup decimal . base !
;  
