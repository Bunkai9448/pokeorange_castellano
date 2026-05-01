const_value = 1
	const ROUTE_62_GATE_OFFICER

Route62MandarinDesertGate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

R62MandarinGateOfficerScript:
	jumptextfaceplayer R62MandarinOfficer_Text

R62MandarinOfficer_Text:
	text "¡Hay un montón"
	line "de #MON"
	cont "salvajes en el"
	cont "desierto!"

	para "No hay entrena-"
	line "dores, porque"
	cont "la tormenta de"
	cont "arena es muy"
	cont "peligrosa."
	
	para "¡Ten cuidado!"
	done

Route62MandarinDesertGate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 2, MANDARIN_DESERT
	warp_def $0, $5, 3, MANDARIN_DESERT
	warp_def $7, $4, 1, ROUTE_62
	warp_def $7, $5, 1, ROUTE_62

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, R62MandarinGateOfficerScript, -1
