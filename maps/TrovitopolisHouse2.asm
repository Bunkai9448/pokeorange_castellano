const_value = 1
	
TrovitopolisHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisBugBoyScript:
	jumptextfaceplayer TrovitopolisBugBoyText
	
TrovitopolisBugBoyText:
	text "PINSIR es un"
	line "#MON sin igual."
	
	para "Comparado con"
	line "SCYTHER, que"
	cont "PINSIR no"
	cont "evoluciona."
	
	para "Me encantaría que"
	line "algun día alguien"
	cont "descubriera una"
	cont "evolución suya."
	done

TrovitopolisHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 8, TROVITOPOLIS
	warp_def 7, 3, 8, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_BUG_BOY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisBugBoyScript, -1