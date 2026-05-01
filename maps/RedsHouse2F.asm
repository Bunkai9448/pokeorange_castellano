RedsHouse2F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MapRedsHouse2FSignpost0Script:
	jumptext UnknownText_0x19b050

MapRedsHouse2FSignpost1Script:
	jumptext UnknownText_0x19b087

UnknownText_0x19b050:
	text "<PLAYER> jugo"
	line "a la N64."

	para "¡Mejor no"
	line "perder tiempo!"
	done

UnknownText_0x19b087:
	text "Parece que"
	line "lleva tiempo"
	cont "sin usarse...>"
	done

RedsHouse2F_MapEventHeader:

.Warps: db 1
	warp_def $0, $7, 3, REDS_HOUSE_1F

.XYTriggers: db 0

.Signposts: db 2
	signpost 5, 3, SIGNPOST_READ, MapRedsHouse2FSignpost0Script
	signpost 1, 0, SIGNPOST_READ, MapRedsHouse2FSignpost1Script

.PersonEvents: db 0
