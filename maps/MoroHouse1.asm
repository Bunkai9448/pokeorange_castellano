const_value = 1

MoroHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroHeadbuttScript:
	faceplayer
	opentext
	writetext GivePlayerHeadbuttText
	yesorno
	iffalse .TutorRefused
	writebyte HEADBUTT
	writetext Text_HeadbuttTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_HeadbuttTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_HeadbuttTutorTaught
	waitbutton
	closetext
	end

GivePlayerHeadbuttText:
	text "¿Has visto estas"
	line "ramas?"

	para "A veces,los #MON"
	line "viven en ellas."
	cont "Puedes moverlas "
	cont "para espantarlos."
	
	para "¿Quieres aprender"
	line "GOLPE CABEZA?"
	done
	
Text_HeadbuttTutorTaught:
	text "Si usas GOLPE"
	line "CABEZA en ellas,"
	cont "algunos #MON "
	cont "que duerman en"
	cont "ellas, caerán."
	done
	
Text_HeadbuttTutorRefused:
	text "De acuerdo, pues."
	done
	
Text_HeadbuttTutorClear:
	text ""
	done

MoroHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, MORO_ISLAND
	warp_def 7, 3, 5, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_ROCKER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MoroHeadbuttScript, -1
