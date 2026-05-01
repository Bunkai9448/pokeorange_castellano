const_value = 1

MurcottHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottRockerScript:
	jumptextfaceplayer MurcottRockerText
	
MurcottRockerText:
	text "Hablé con mi"
	line "hermano en ciudad"
	cont "CARMIN."
	
	para "Cambio un"
	line "FARFETCH'D por"
	cont "un SPEAROW, ¡Que"
	cont "cosas!"
	done

MurcottHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 2, MURCOTT_ISLAND
	warp_def 7, 3, 2, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_ROCKER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MurcottRockerScript, -1

