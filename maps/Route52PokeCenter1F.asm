const_value = 1
	const ROUTE52POKECENTER1F_NURSE
	const ROUTE52POKECENTER1F_FISHING_GURU
	const ROUTE52POKECENTER1F_COOLTRAINER_F

Route52PokeCenter1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

NurseScript_0x69b52:
	jumpstd pokecenternurse

FishingGuruScript_0x69b55:
	jumptextfaceplayer UnknownText_0x69b83

CooltrainerFScript_0x69b80:
	jumptextfaceplayer UnknownText_0x69cac

UnknownText_0x69b83:
	text "Hay muchos"
	line "entrenadores en"
	cont "RUTA 52."

	para "Todos entrenan"
	line "para desafiar a"
	cont "CISSY del"
	cont "ORANGE CREW."
	done

UnknownText_0x69cac:
	text "El PIKACHU que"
	line "atrape en JUNGLA"
	cont "TANGELO es"
	cont "increible."

	para "IMPACTRUENO es"
	line "un gran ataque"
	cont "contra los"
	cont "#MON de "
	cont "tipo agua."
	done

Route52PokeCenter1F_MapEventHeader::

.Warps: db 3
	warp_def 7, 4, 1, ROUTE_52
	warp_def 7, 5, 1, ROUTE_52
	warp_def 7, 0, 1, POKECENTER_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x69b52, -1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x69b55, -1
	person_event SPRITE_COOLTRAINER_F, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x69b80, -1
