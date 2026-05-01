const_value = 1

ShamoutiNorthBeach_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ShamoutiBeachGuard:
	jumptextfaceplayer ShamoutiBeachGuardText
	
ShamoutiBeachGuardText:
	text "Lo siento, pero"
	line "nadie puede "
	cont "pasar hasta que"
	cont "el jefe lo diga."
	done

ShamoutiNorthBeach_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_BLACK_BELT, 23, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiBeachGuard, EVENT_SHAMOUTI_QUEST_STARTED
