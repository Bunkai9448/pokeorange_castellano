const_value = 1
	const MIKANISLANDROUTE53GATE_OFFICER
	const MIKANISLANDROUTE53GATE_YOUNGSTER

MikanIslandRoute53Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

OfficerScript_0x69a2d:
	jumptextfaceplayer UnknownText_0x69a36

YoungsterScript_0x69a33:
	jumptextfaceplayer UnknownText_0x69abd
	end

Guard_Stop1:
	applymovement PLAYER, Movement_Hey
	opentext
	writetext Text_WaitPlayer2
	waitbutton
	closetext
	applymovement PLAYER, Movement_Go_Away
	end

Text_WaitPlayer2:
	text "¡Ey!"

	para "Me preocupa, no"
	line "puedo dejarte"
	cont "pasar."

	para "Hay gente sospe-"
	line "chosa en la "
	cont "RUTA 53."

	para "Parece que hay"
	line "informes de una"
	cont "pareja usando"
	cont "uniformes del"

	para "difunto TEAM"
	line "ROCKET."
	done

UnknownText_0x69a36:
	text "Desde aquí tienes"
	line "acceso a dos"
	cont "islas."

	para "SON MANDARINA"
	line "NORTE e isla"
	cont "SUNBURST."
	done

UnknownText_0x69abd:
	text "He oido que el"
	line "TEAM ROCKET se"
	cont "disolvió hace"
	cont "poco."

	para "Quizás algunos"
	line "rezagados no"
	cont "tengan buenas"
	cont "intenciones."
	done

Movement_Hey:
	turn_head UP
	step_end

Movement_Go_Away:
	step LEFT
	step_end

MikanIslandRoute53Gate_MapEventHeader::

.Warps: db 5
	warp_def 4, 0, 6, MIKAN_ISLAND
	warp_def 5, 0, 7, MIKAN_ISLAND
	warp_def 4, 9, 1, ROUTE_53
	warp_def 5, 9, 2, ROUTE_53
	warp_def 2, 1, 1, ROUTE_53_GATE_UPSTAIRS

.CoordEvents: db 2
	xy_trigger 0, 4, 5, Guard_Stop1
	xy_trigger 0, 5, 5, Guard_Stop1

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x69a2d, -1
	person_event SPRITE_YOUNGSTER, 6, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x69a33, -1
