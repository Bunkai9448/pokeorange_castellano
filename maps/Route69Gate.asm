const_value = 1
	const ROUTE69GATE_OFFIER

Route69Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route69OfficerScript:
	jumptextfaceplayer Route69OfficerText

Route69OfficerText:
	text "¡Wow!¡Felicidades"
	line "por vencer en"
	cont "esta zona! ¡Buena"
	cont "suerte en POMELO!"
	
	para "Aun tendrás un"
	line "poco de SURFEO "
	cont "para llegar."
	
	para "He ordenado a los"
	line "entrenadores locas"
	cont "que no obstaculi-"
	cont "cen a quien cruce"
	cont "por ahi."
	done

Route69Gate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 1, ROUTE_69_NORTH
	warp_def $0, $5, 1, ROUTE_69_NORTH
	warp_def $7, $4, 15, ROUTE_69_SOUTH
	warp_def $7, $5, 15, ROUTE_69_SOUTH

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route69OfficerScript, -1
