const_value = 1
	const ROUTE_65_HIKER_DALE
	const ROUTE_65_YOUNGSTER_ORO
	const ROUTE_65_PP_UP

Route65_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route65PPUp:
	itemball PP_UP

; BLACKBELT_KEN
TrainerBlackbeltKen:
	trainer EVENT_BEAT_BLACKBELT_KEN, BLACKBELT_T, KEN, BlackbeltKenSeenText, BlackbeltKenWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltKenAfterText
	waitbutton
	closetext
	end
	
BlackbeltKenSeenText:
	text "¡Ho! ¡Ha! ¡Hee!"
	
	para "¡Wataaaaaa!"
	
	para "¡Ya estas derro-"
	line "tado!"
	done
	
BlackbeltKenWinText:
	text "¿Que?"
	done
	
BlackbeltKenAfterText:
	text "Seguire entre-"
	line "nando para llegar"
	cont "al nivel de la"
	cont "ESTRELLA DEL"
	cont "NORTE."
	done
	
; YOUNGSTER_Oro
TrainerYoungsterOro:
	trainer EVENT_BEAT_YOUNGSTER_ORO, YOUNGSTER, ORO, YoungsterOroSeenText, YoungsterOroWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterOroAfterText
	waitbutton
	closetext
	end
	
YoungsterOroSeenText:
	text "Estoy dandole du-"
	line "ro para subir mis"
	cont "#MON."
	
	para "Quizas la EXP"
	line "gue logre de ti"
	cont "me ayude."
	done
	
YoungsterOroWinText:
	text "¡Parece que fue"
	line "al reves!"
	done
	
YoungsterOroAfterText:
	text "Seguro que te"
	line "lo han dicho, que"
	cont "los #MON de"
	cont "mas nivel que el"
	
	para "tuyo, dan mas exp"
	line "que los que estan"
	cont "por debajo."
	done
	
Route65Sign:
	jumptext Route65SignText
	
Route65SignText:
	text "RUTA 65"
	done

Route65_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 13, 21, SIGNPOST_READ, Route65Sign

.ObjectEvents: db 3
	person_event SPRITE_BLACK_BELT, 14, 15, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBlackbeltKen, -1
	person_event SPRITE_YOUNGSTER, 20, 28, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterOro, -1
	person_event SPRITE_POKE_BALL, 5, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route65PPUp, EVENT_ROUTE_65_PP_UP

