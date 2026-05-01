Route69North_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route69ZenHeadbuttTutor:
	faceplayer
	opentext
	writetext GivePlayerZenHeadbuttText
	yesorno
	iffalse .TutorRefused
	writebyte ZEN_HEADBUTT
	writetext Text_ZenHeadbuttTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_ZenHeadbuttTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_ZenHeadbuttTutorTaught
	waitbutton
	closetext
	end

GivePlayerZenHeadbuttText:
	text "¿Que estoy"
	line "haciendo?"
	
	para "Encontrando mi"
	line "propio equili-"
	cont "brio ¡Eso es!"
	
	para "Dar cabezazos a "
	line "estas montañas"
	cont "esta abriendo mi"
	cont "mente."
	
	para "No es para huma-"
	line "nos, creo."
	cont "Puedo enseñarlo a"
	cont "tu #MON."
	
	para "¿Les gustaría "
	line "CABEZAZO ZEN?"
	done
	
Text_ZenHeadbuttTutorTaught:
	text "CABEZAZO ZEN es un"
	line "ataque psíquico"
	cont "que puede hacer "
	cont "retroceder al"
	
	para "enemigo"
	done
	
Text_ZenHeadbuttTutorRefused:
	text "¡Avisame si"
	line "abres tu mente!"
	done
	
Text_ZenHeadbuttTutorClear:
	text ""
	done

Route69North_MapEventHeader::

.Warps: db 2
	warp_def 27,  5, 1, ROUTE_69_GATE
	warp_def 27,  6, 2, ROUTE_69_GATE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_M, 14,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route69ZenHeadbuttTutor, -1
