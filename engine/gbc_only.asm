GBCOnlyScreen: ; 4ea82
    ld a, [hCGB]
    and a
    ret nz
    ld de, MUSIC_NONE
    call PlayMusic
    call ClearTileMap
    ld de, Font
    ld hl, VTiles1
    lb bc, BANK(Font), $80
    call Get2bpp      ; Load font as 2bpp
    ld de, GBCOnlyString
    hlcoord 1, 1
    call PlaceString
    call WaitBGMap
; better luck next time
.loop
    call DelayFrame
    jr .loop
; 4eac5

GBCOnlyString: ; 4eb38
	db   "  Pokémon Orange"
	next "       ERROR"
	next "------------------"
	next "Este juego solo"
	next "esta diseñado"
	next "para ser usado en"
	next "Game Boy Color."
	next "     -- Pia Carrot@"
; 4eb76
