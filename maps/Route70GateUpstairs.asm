const_value = 1

Route70GateUpstairs_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloBinoculars1:
	jumptext PummeloBinoculars1Text

PummeloBinoculars1Text:
	text "Hay algunas islas"
	line "deshabitadas al"
	cont "norte."
	done

PummeloBinoculars2:
	jumptext PummeloBinoculars2Text

PummeloBinoculars2Text:
	text "Hay una cabaña en"
	line "una isla pequeña."
	done

Route70GateUpstairs_MapEventHeader::

.Warps: db 1
	warp_def 3, 0, 5, PUMMELO_ROUTE_70_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 4, 4, SIGNPOST_UP, PummeloBinoculars1
	signpost 4, 6, SIGNPOST_UP, PummeloBinoculars2

.ObjectEvents: db 0