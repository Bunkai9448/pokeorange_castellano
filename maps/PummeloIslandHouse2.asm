const_value = 1

PummeloIslandHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloHouse2GrampsScript:
	jumptextfaceplayer PummeloHouse2GrampsScriptText

PummeloHouse2LassScript:
	jumptextfaceplayer PummeloHouse2LassScriptText
	
PummeloHouse2GrampsScriptText:
	text "Cuando era joven,"
	line "iba a la deriva"
	cont "en el mar cuando"
	cont "acabe en una"
	
	para "isla misteriosa"
	line "con una extraña"
	cont "torre. La gente"
	cont "de alli me salvo"
	
	para "y por eso,estoy"
	line "hoy aqui."
	done

PummeloHouse2LassScriptText:
	text "El abuelo "
	line "cuenta muchas"
	cont "historias. No"
	cont "le importa que"
	cont "sean fantasias."
	done

PummeloIslandHouse2_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 6, PUMMELO_ISLAND
	warp_def $7, $4, 6, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 2
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloHouse2GrampsScript, -1
		person_event SPRITE_LASS, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloHouse2LassScript, -1