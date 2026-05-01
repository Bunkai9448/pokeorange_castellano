const_value = 1
	const ROUTE52TANGELOJUNGLEGATE_OFFIER

Route52TangeloJungleGate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

OfficerScript_0x62d63:
	jumptextfaceplayer UnknownText_0x62d9d

UnknownText_0x62d9d:
	text "Tienes que cruzar"
	line "el oceano para"
	cont "para llegar a "
	cont "ISLA MIKAN."
	done

Route52TangeloJungleGate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 2, ROUTE_52
	warp_def $0, $5, 3, ROUTE_52
	warp_def $7, $4, 1, TANGELO_JUNGLE
	warp_def $7, $5, 1, TANGELO_JUNGLE

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 2
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x62d63, -1
