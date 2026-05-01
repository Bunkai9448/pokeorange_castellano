const_value = 1
	const TROVITOPOLIS_PORT_SAILOR_1
	const TROVITOPOLIS_PORT_LORELEI
	const TROVITOPOLIS_PORT_LANCE
	const TROVITOPOLIS_PORT_TRACEY

TrovitopolisPort_MapScriptHeader:

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump LoreleiLanceTraceyPortScript
	end

.Trigger1:
	end

LoreleiLanceTraceyPortScript:
	applymovement PLAYER, PlayerTrovitopolisPortMovement
	opentext
	writetext LoreleiLancePortText1
	waitbutton
	closetext
	spriteface TROVITOPOLIS_PORT_LORELEI, DOWN
	applymovement TROVITOPOLIS_PORT_LANCE, LanceTrovitopolisPortMovement1
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, TROVITOPOLIS_PORT_LANCE, 15
	opentext
	writetext LancePortText
	waitbutton
	closetext
	applymovement TROVITOPOLIS_PORT_LANCE, LanceTrovitopolisPortMovement2
	playsound SFX_EXIT_BUILDING
	disappear TROVITOPOLIS_PORT_LANCE
	spriteface PLAYER, UP
	opentext
	writetext LoreleiPortText1
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	clearevent EVENT_TRACEY_TROVITOPOLIS_PORT
	appear TROVITOPOLIS_PORT_TRACEY
	spriteface PLAYER, DOWN
	showemote EMOTE_QUESTION, TROVITOPOLIS_PORT_LORELEI, 15
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement TROVITOPOLIS_PORT_TRACEY, TraceyTrovitopolisPortMovement1
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyPortText1
	waitbutton
	closetext
	applymovement TROVITOPOLIS_PORT_LORELEI, LoreleiTrovitopolisPortMovement1
	opentext
	writetext LoreleiPortText2
	waitbutton
	spriteface TROVITOPOLIS_PORT_TRACEY, RIGHT
	writetext TraceyPortText2
	waitbutton
	closetext 
	applymovement TROVITOPOLIS_PORT_LORELEI, LoreleiTraceyPortMovement
	disappear TROVITOPOLIS_PORT_LORELEI
	playsound SFX_EXIT_BUILDING
	spriteface TROVITOPOLIS_PORT_TRACEY, UP
	opentext
	writetext TraceyPortText3
	waitbutton
	closetext
	applymovement TROVITOPOLIS_PORT_TRACEY, LoreleiTraceyPortMovement
	disappear TROVITOPOLIS_PORT_TRACEY
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setevent EVENT_TRACEY_TROVITOPOLIS_PORT
	setevent EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	domaptrigger TROVITOPOLIS_PORT, $1
	end

TrovitopolisPortSailorScript:
	faceplayer
	opentext
	checkevent EVENT_TROVITOPOLIS_SAVED
	iftrue .TrovitopolisSaved
	writetext TrovitopolisPortNotWorkingText
	waitbutton
	closetext
	end

.TrovitopolisSaved:
	writetext TrovitopolisPortSailorText
	yesorno
	iftrue .ToTrovita
	closetext
	end
	
.ToTrovita:
	writetext TrovitopolisSailorAhoyText
	waitbutton
	closetext
	spriteface TROVITOPOLIS_PORT_SAILOR_1, UP
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear TROVITOPOLIS_PORT_SAILOR_1
	waitsfx
	applymovement PLAYER, TrovitopolisSailorMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear TROVITOPOLIS_PORT_SAILOR_1
	warp TROVITA_PORT, 11, 7 ;TROVITA_PORT
	end

TrovitopolisSailorMovement:
	step UP
	step_end
	
LoreleiLancePortText1:
	text "<...> <...> <...>"
	
	para "???: Lo siento,"
	line "LANCE. Mi decisión"
	cont "es inamovible."
	
	para "LANCE: No puedes"
	line "dejar sin motivo"
	cont "la ELITE FOUR."
	cont "¡Dame una buena"
	
	para "razón,"
	line "LORELEI!"
	
	para "LORELEI: <...>"
	line "Estaré por MAN-"
	cont "DARINA SUR unos"
	cont "días, antes de"
	
	para "volver a mi casa,"
	line "en ISLA CUATRO."
	cont "Adios, LANCE."
	
	para "LANCE: Sigh<...>"
	done
	
LancePortText:
	text "LANCE: <...>"
	line "Ese brillo en "
	cont "tus ojos<...>"
	
	para "No importa. Lo"
	line "siento. Solo es"
	cont "que me recordas-"
	cont "te a alguien."
	done
	
LoreleiPortText1:
	text "LORELEI: Hola.Mis"
	line "disculpas por los"
	cont "problemas que he"
	cont "causado."
	
	para "¿Tu nombre?"
	
	para "<...> <...> <...>"
	
	para "LORELEI: Así que"
	line "eres <PLAYER>."
	cont "Bien, soy LORELEI"
	cont "de la ELITE FOUR."
	
	para "Bueno, estoy"
	line "oficialmente"
	cont "retirada. JaJa."
	
	para "De todas formas,"
	line "si necesitas "
	cont "algo, puedes"
	cont "pasarte por la"
	
	para "ESCUELA DE"
	line "ENTRENADORES de"
	cont "la ciudad, ahí"
	cont "estare."
	done
	
TraceyPortText1:
	text "TRACEY: ¡<PLAYER>!"
	
	para "¡Por fin te"
	line "encuentro!¡Hay un"
	cont "gran problema en"
	cont "la ciudad!"
	done
	
LoreleiPortText2:
	text "LORELEI: ¿Que"
	line "esta pasando aquí?"
	done
	
TraceyPortText2:
	text "TRACEY: ¡El TEAM"
	line "ROCKET!"
	
	para "<...>"
	
	para "Espera...¿Eres"
	line "LORELEI de la "
	cont "ELITE FOUR de "
	cont "KANTO? ¡Es un"
	cont "honor!"
	
	para "LORELEI: Chico,"
	line "dejate de topicos."
	
	para "TRACEY: ¡Oh!"
	line "El TEAM ROCKET"
	cont "esta trabajando"
	cont "con el ALCALDE"
	
	para "en aras de"
	line "imponer impuestos"
	cont "a los ciudadanos"
	cont "para sufragar"
	cont "sus fechorías."
	
	para "¡Los pararemos!"
	
	para "LORELEI: Okey."
	line "Los pararé,"
	cont "aquí y ahora."
	
	para "Vosotros dos,"
	line "chavalillos, no"
	cont "interfirais si"
	cont "se pone peligroso."
	done
	
TraceyPortText3:
	text "TRACEY: ¡Asi sera!"
	
	para "¡Vamos!"
	line "<PLAYER>! No"
	cont "podemos dejar que"
	cont "el TEAM ROCKET"
	cont "se salga con"
	cont "la suya."
	
	para "Roban #MON"
	line "y empobrecen a" 
	cont "la gente."
	
	para "No se porque"
	line "estan aqui,"
	cont "¡Pero debemos"
	cont "detenerlos!"
	done
	
TrovitopolisPortNotWorkingText:
	text "Lo siento, el"
	line "FERRY no esta"
	cont "operativo."
	
	para "El ALCALDE puso"
	line "una nueva tasa."
	cont "Debemos pagar"
	cont "para navegar."
	
	para "No solo eso,"
	line "se han visto a los"
	cont "del TEAM ROCKET"
	cont "merodeando."
	
	para "¿Que esta pasan-"
	line "do en esta"
	cont "ciudad?"
	done

TrovitopolisPortSailorText:
	text "Ahora que no"
	line "hay que pagar la"
	cont "la tasa por"
	cont "navegar, puedo"
	
	para "llevarte a"
	line "ISLA TROVITA."
	cont "¿Zarpamos?"
	done

TrovitopolisSailorAhoyText:
	text "¡Muy bien! ¡Nos"
	line "vamos!"
	done
	
PlayerTrovitopolisPortMovement:
	step UP
	step UP
	step UP
	step_end
	
LanceTrovitopolisPortMovement1:
	step DOWN
	turn_head LEFT
	step_end
	
LanceTrovitopolisPortMovement2:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
TraceyTrovitopolisPortMovement1:
	step UP
	step UP
	step_end
	
LoreleiTrovitopolisPortMovement1:
	step RIGHT
	step DOWN
	step DOWN
	turn_head LEFT
	step_end

LoreleiTraceyPortMovement:
	step DOWN
	step DOWN
	step_end

TrovitopolisPort_MapEventHeader::

.Warps: db 2
	warp_def 19, 10, 11, TROVITOPOLIS
	warp_def 19, 11, 11, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_SAILOR, 6, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPortSailorScript, -1
	person_event SPRITE_LORELEI, 15, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	person_event SPRITE_LANCE, 15, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	person_event SPRITE_TRACEY, 19, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRACEY_TROVITOPOLIS_PORT

