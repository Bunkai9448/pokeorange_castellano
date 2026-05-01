const_value = 1
	const TROVITOPOLIS_EEVEE_LASS
	const TROVITOPOLIS_EEVEE_BALL
	
TrovitopolisHouse4_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

EeveeGiftScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue GotEeveeAlreadyScript
	writetext WantThisEeveeText
	yesorno
	iffalse DontWantEeveeScript
	writetext YouDoWantEeveeText
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	if_equal $6, NotEnoughRoomScript
	writetext UnknownText_0x54dae
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	disappear TROVITOPOLIS_EEVEE_BALL
	writetext AlreadyGotEeveeText
	waitbutton
	closetext
	end

NotEnoughRoomScript:
	writetext NotEnoughRoomForEeveeText
	waitbutton
	closetext
	end

DontWantEeveeScript:
	writetext DontWantEeveeText
	waitbutton
	closetext
	end

GotEeveeAlreadyScript:
	writetext AlreadyGotEeveeText
	waitbutton
	closetext
	end
	
EeveeBall:
	jumptext EeveeBallText
	
EeveeBallText:
	text "¡Hay un #MON"
	line "dentro!"
	done
	
UnknownText_0x54dae:
	text "<PLAYER> obtuvo"
	line "EEVEE."
	done
	
NotEnoughRoomForEeveeText:
	text "No tienes hueco"
	line "suficiente para"
	cont "EEVEE."
	
	para "Vuelve cuando"
	line "tengas espacio"
	cont "en tu equipo."
	done

YouDoWantEeveeText:	
	text "¡Sabía que eras"
	line "el indicado!"

	para "OK, cuento"
	line "contigo."

	para "Cuídalo bien,"
	line "por favor."
	done
	
WantThisEeveeText:
	text "¡Hola!"
	
	para "Pareces un entre-"
	line "nador #MON"
	cont "decente."
	
	para "Encontré a EEVEE"
	line "en un callejón."
	
	para "No puedo hacerme"
	line "cargo de él."
	cont "¡Quizas tu si!"
	cont "¡Necesita un "
	cont "hogar!"
	done
	
DontWantEeveeText:
	text "¿No lo quieres?"
	line "Lo entiendo."
	
	para "Es una petición"
	line "ilógica."
	done
	
AlreadyGotEeveeText:
	text "Cuida de este"
	line "EEVEE. He escu-"
	cont "chado que puede"
	cont "evolucionar en"
	cont "muchos #MON."
	done

TrovitopolisHouse4_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 10, TROVITOPOLIS
	warp_def 7, 3, 10, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EeveeGiftScript, -1
	person_event SPRITE_POKE_BALL, 3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EeveeBall, EVENT_GOT_EEVEE