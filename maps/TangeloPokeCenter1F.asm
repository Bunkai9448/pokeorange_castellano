const_value = 1
	const TANGELOPOKECENTER1F_NURSE
	const TANGELOPOKECENTER1F_FISHER
	const TANGELOPOKECENTER1F_GENTLEMAN

TangeloPokeCenter1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

NurseScript_0x19696d:
	jumpstd pokecenternurse

FisherScript_0x196970:
	jumptextfaceplayer UnknownText_0x19698a

GentlemanScript_0x196973:
	jumptextfaceplayer UnknownText_0x1969c8

UnknownText_0x19698a:
	text "Es genial. El"
	line "centro #MON"
	cont "te permite"
	cont "pasar la noche."

	para "¡Comida gratis! "
	line "Amo esta vida."
	done

UnknownText_0x1969c8:
	text "Ah<...> Estas"
	line "pequeñas ciudades"
	cont "no son nada"
	cont "comparadas con"
	cont "mi ciudad natal."
	done

TangeloPokeCenter1F_MapEventHeader::

.Warps: db 3
	warp_def 7, 4, 2, TANGELO_ISLAND
	warp_def 7, 5, 2, TANGELO_ISLAND
	warp_def 7, 0, 1, POKECENTER_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x19696d, -1
	person_event SPRITE_FISHER, 3, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x196970, -1
	person_event SPRITE_SIGHTSEER_F, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x196973, -1
