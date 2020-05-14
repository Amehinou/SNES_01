.p816
.smart

.include "defines.asm"
.include "macros.asm"
.include "init.asm"




.segment "CODE"

;enters here in forced blank
main:
.a16 ;just a standardized setting from init code
.i16
	phk
	plb
	
	A8
	stz pal_addr ;set color address to 0
	lda #$1f	 ;palette low byte gggrrrrr
	sta pal_data ;1f = all the red bits
	lda #$00	 ;palette high byte -bbbbbgg
	sta pal_data ;store zero for high byte
	
;-bbbbbgg gggrrrrr
;black = $0000
;red = $001f
;green = $03e0
;blue = $7c00
;white = $7fff

;turn the screen on (end forced blank)
	lda #$0f
	sta $2100

;note, nothing is active on the main screen,
;so only the main background color will show.
;$212c is the main screen register	

InfiniteLoop:	
	jmp InfiniteLoop
	
	
	



	
.include "header.asm"	








