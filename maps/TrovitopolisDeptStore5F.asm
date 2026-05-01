const_value = 1
	const TROVITOPOLISDEPTSTORE5F_CLERK
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_1
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_2
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_3
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_4

TrovitopolisDeptStore5F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisDeptStore5FDirectory:
	jumptext TrovitopolisDeptStore5FDirectoryText

TrovitopolisDeptStore5FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisDeptStore5FDirectoryText:
	text "Personaliza tu"
	line "#MON"

	para "5F SECCION MT"
	done
	
TrovitopolisTMMartScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TROVITOPOLIS_TM
	closetext
	end
	
Route52IcepunchTutor:
	faceplayer
	opentext
	writetext GivePlayerIcepunchText
	yesorno
	iffalse .TutorRefused
	writebyte ICE_PUNCH
	writetext Text_IcepunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_IcepunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_IcepunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerIcepunchText:
	text "¡Hu ha! ¡Somos la"
	line "Orden del PUÑO!"
	
	para "Nuestro líder"
	line "nos enseña téc-"
	cont "nicas, ahora esta"
	cont "de misión en"
	cont "ISLA TANGELO"
	
	para "Puedo enseñar"
	line "a tu #MON,"
	cont "PUÑO HIELO."
	cont "¿Quieres que lo"
	cont "haga?"
	done
	
Text_IcepunchTutorTaught:
	text "PUÑO HIELO es"
	line "ataque de fuego"
	cont "que puede con-"
	cont "gelar al"
	cont "objetivo."
	done
	
Text_IcepunchTutorRefused:
	text "¡Muy bien!"
	done
	
Text_IcepunchTutorClear:
	text ""
	done
	
Route52FirepunchTutor:
	faceplayer
	opentext
	writetext GivePlayerFirepunchText
	yesorno
	iffalse .TutorRefused
	writebyte FIRE_PUNCH
	writetext Text_FirepunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_FirepunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_FirepunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerFirepunchText:
	text "¡Hu ha! ¡Somos la"
	line "Orden del PUÑO!"
	
	para "Nuestro líder"
	line "nos enseña téc-"
	cont "nicas, ahora esta"
	cont "de misión en"
	cont "ISLA TANGELO."
	
	para "Puedo enseñar"
	line "a tu #MON,"
	cont "PUÑO FUEGO."
	cont "¿Quieres que lo"
	cont "haga?"
	done
	
Text_FirepunchTutorTaught:
	text "PUÑO FUEGO es"
	line "ataque de fuego"
	cont "que puede que-"
	cont "mar al objetivo."
	done
	
Text_FirepunchTutorRefused:
	text "¡Muy bien!"
	done
	
Text_FirepunchTutorClear:
	text ""
	done
	
Route52CometpunchTutor:
	faceplayer
	opentext
	writetext GivePlayerCometpunchText
	yesorno
	iffalse .TutorRefused
	writebyte COMET_PUNCH
	writetext Text_CometpunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_CometpunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_CometpunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerCometpunchText:
	text "¡Hu ha! ¡Somos la"
	line "Orden del PUÑO!"
	
	para "Nuestro lider"
	line "nos enseña téc-"
	cont "nicas, ahora esta"
	cont "de misión en"
	cont "ISLA TANGELO."
	
	para "Puedo enseñar"
	line "a tu #MON,"
	cont "PUÑO COMETA."
	cont "¿Quieres que lo"
	cont "haga?"
	done
	
Text_CometpunchTutorTaught:
	text "PUÑO COMETA es"
	line "ataque de tipo"
	cont "normal que puede"
	cont "golpear varias"
	cont "veces."
	done
	
Text_CometpunchTutorRefused:
	text "¡Muy bien!"
	done
	
Text_CometpunchTutorClear:
	text ""
	done
	
Route52DynamicPunchTutor:
	faceplayer
	opentext
	writetext GivePlayerDynamicpunchText
	yesorno
	iffalse .TutorRefused
	writebyte DYNAMICPUNCH
	writetext Text_DynamicpunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_DynamicpunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_DynamicpunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerDynamicpunchText:
	text "¡Hu ha! ¡Somos la"
	line "Orden del PUÑO!"
	
	para "Nuestro líder"
	line "nos enseña téc-"
	cont "nicas, ahora esta"
	cont "de misión en"
	cont "ISLA TANGELO"
	
	para "Puedo enseñar"
	line "a tu #MON,"
	cont "PUÑODINAMICO."
	cont "¿Quieres que lo"
	cont "haga?"
	done
	
Text_DynamicpunchTutorTaught:
	text "PUÑODINAMICO es"
	line "un ataque de "
	cont "lucha que puede"
	cont "confundir al"
	cont "rival."
	done
	
Text_DynamicpunchTutorRefused:
	text "¡Muy bién!"
	done
	
Text_DynamicpunchTutorClear:
	text ""
	done

TrovitopolisDeptStore5F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, TROVITOPOLIS_DEPT_STORE_4F
	warp_def $0, $f, 1, TROVITOPOLIS_DEPT_STORE_6F
	warp_def $0, $2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore5FElevatorButton

.PersonEvents: db 5
	person_event SPRITE_CLERK, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisTMMartScript, -1
	person_event SPRITE_BLACK_BELT,  5, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route52IcepunchTutor, -1
	person_event SPRITE_BLACK_BELT,  2, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1,  (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route52FirepunchTutor, -1
	person_event SPRITE_BLACK_BELT,  2,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route52CometpunchTutor, -1
	person_event SPRITE_BLACK_BELT,  5,  3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route52DynamicPunchTutor, -1
