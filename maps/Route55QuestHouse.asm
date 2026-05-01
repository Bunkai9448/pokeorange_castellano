const_value = 1
	const ROUTE55QUESTHOUSE_GRANNY

Route55QuestHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

BaasamaScript:
	jumptextfaceplayer BaasamaText

BaasamaText:
	text "Ah, hola,"
	line "chavalín."

	para "Hace mucho tiempo,"
	line "tuve niños a mi"
	cont "cuidado."

	para "Me pregunto que"
	line "fue de ellos."
	cont "Fue hace tanto<...>"

	para "Ahora, ellos"
	line "deberían ser los"
	cont "que tienen niños."
	done

Route55QuestHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 3, 2, ROUTE_55
	warp_def 7, 4, 2, ROUTE_55

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BaasamaScript, -1
