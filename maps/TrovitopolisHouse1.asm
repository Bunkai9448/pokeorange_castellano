const_value = 1
	
TrovitopolisHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisBlackBeltScript:
	jumptextfaceplayer TrovitopolisBlackBeltText
	
TrovitopolisBlackBeltText:
	text "Si pretendes"
	line "desafiar a RUDY,"
	cont "el lider del GIM"
	cont "de Trovita, debo"
	cont "advertirte."
	
	para "Su equipo esta muy"
	line "equilibrado."
	
	para "Sus #MON estan"
	line "entrenados con"
	cont "danzas. Quizás"
	cont "puedas tener"
	cont "problemas para"
	
	para "golpearle en una"
	line "batalla larga. Te"
	cont "recomiendo llevar"
	cont "PRECISION X."
	done
	
TrovitopolisPokeFanFScript:
	jumptextfaceplayer TrovitopolisPokeFanFText
	
TrovitopolisPokeFanFText:
	text "Mi marido entrena"
	line "con el lider del"
	cont "GIM de Trovita,"
	cont "RUDI."
	
	para "¿No es guay?"
	done

TrovitopolisHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 7, TROVITOPOLIS
	warp_def 7, 3, 7, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_BLACK_BELT, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrovitopolisBlackBeltScript, -1
	person_event SPRITE_POKEFAN_F, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeFanFScript, -1
