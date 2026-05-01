const_value = 1

MoroSouthHouse_MapScriptHeader:
.MapTriggers: db 0

.MapCallbacks: db 0

MoroFarfetchdFan:
	jumptextfaceplayer MoroFarfetchdFanText

MoroFarfetchdFanText:
	text "Te contaré un"
	line "secreto."

	para "En la RUTA 61,"
	line "si continúas al"
	cont "sur, llegarás"
	cont "a unas islas"
	cont "habitadas por"
	cont "FARFETCH'D."
	done

MoroSouthHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, MORO_ISLAND
	warp_def 7, 3, 4, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroFarfetchdFan, -1