const_value = 1
 const ROUTE_57_BUG_BOY

Route57GateUpstairs_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route57GateBugBoy:
	jumptextfaceplayer Route57BugBoyText

Route57BugBoyText:
	text "Me encantaría que"
	line "hubiera"
	cont "#MON"
	cont "rarísimos que solo"
	cont "estuvieran aquí."

	para "Recuerdo una vez"
	line "que vi mi propia"
	cont "SOMBRA moverse."
	done

KinnowBinoculars1:
	jumptext KinnowBinoculars1Text

KinnowBinoculars1Text:
	text "Hmm<...>"

	para "Desde aquí"
	line "pueden verse"
	cont "playas increibles."
	done

KinnowBinoculars2:
	jumptext KinnowBinoculars2Text

KinnowBinoculars2Text:
	text "Hay una isla al"
	line "norte, parece"
	cont "deshabitada."
	done

Route57GateUpstairs_MapEventHeader::

.Warps: db 1
	warp_def 3, 0, 5, KINNOW_ISLAND_ROUTE_57_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 4, 4, SIGNPOST_UP, KinnowBinoculars1
	signpost 4, 6, SIGNPOST_UP, KinnowBinoculars2

.ObjectEvents: db 1
	person_event SPRITE_BUG_CATCHER, 2, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route57GateBugBoy, -1
