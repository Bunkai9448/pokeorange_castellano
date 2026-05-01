const_value = 1

Route53GateUpstairs_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MikanBinoculars1:
	jumptext MikanBinoculars1Text

MikanBinoculars1Text:
	text "¡Wow! Un montón"
	line "de MAGIKARP se"
	cont "ven en el agua."
	done

MikanBinoculars2:
	jumptext MikanBinoculars2Text

MikanBinoculars2Text:
	text "Hmm<...>"

	para "Este no"
	line "funciona."
	done

Route53GateUpstairs_MapEventHeader::

.Warps: db 1
	warp_def 3, 0, 5, MIKAN_ISLAND_ROUTE_53_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 4, 4, SIGNPOST_UP, MikanBinoculars1
	signpost 4, 6, SIGNPOST_UP, MikanBinoculars2

.ObjectEvents: db 0
