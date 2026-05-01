const_value = 1
	const ROUTE_62_ITEMBALL1
	const ROUTE_62_ITEMBALL2
	const ROUTE_62_ITEMBALL3
	const ROUTE_62_ITEMBALL4
	const ROUTE_62_LASS
	const ROUTE_62_YOUNGSTER
	const ROUTE_62_TRACEY

Route62_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route62XSpecialAttack:
	itemball X_SPCL_ATK
	
Route62TMEarthquake:
	itemball TM_EARTHQUAKE
	
Route62Blackglasses:
	itemball BLACKGLASSES
	
Route62PPUp:
	itemball PP_UP

; YOUNGSTER_HIRUMA
TrainerYoungsterHiruma:
	trainer EVENT_BEAT_YOUNGSTER_HIRUMA, YOUNGSTER, HIRUMA, YoungsterHirumaSeenText, YoungsterHirumaWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterHirumaAfterText
	waitbutton
	closetext
	end
	
YoungsterHirumaSeenText:
	text "¡Oye, te conozco!"

	para "Eres <PLAYER>"
	line "de la ISLA"
	cont "VALENCIA. ¡Nos"
	cont "fuimos casi al"
	cont "mismo tiempo!"
	done
	
YoungsterHirumaWinText:
	text "Debería haber"
	line "visto más"
	cont "#MON por"
	cont "el camino."
	done
	
YoungsterHirumaAfterText:
	text "No está mal."
	line "¡Tengo que"
	cont "entrenar duro!"
	done
	

; LASS_FUYUMI
TrainerLassFuyumi:
	trainer EVENT_BEAT_LASS_FUYUMI, LASS, FUYUMI, LassFuyumiSeenText, LassFuyumiWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassFuyumiAfterText
	waitbutton
	closetext
	end
	
LassFuyumiSeenText:
	text "¿Donde vas?"
	
	para "¡Juega conmigo un"
	line "minuto!"
	done
	
LassFuyumiWinText:
	text "Resoplido<...>"
	done
	
LassFuyumiAfterText:
	text "¡No dije que"
	line "pudieras noquear"
	cont "a todos mis"
	cont "#MON!"
	
	para "¡Eres malo!"
	done
	
Route62Sign:
	jumptext R62SignText
	
R62SignText:
	text "RUTA 62"
	line "al DESIERTO"
	cont "MANDARÍN"
	done
	
Route62ClimbSign:
	jumptext R62ClimbSignText
	
R62ClimbSignText:
	text "Escondido en la"
	line "montaña se"
	cont "encuentra la"
	cont "CUEVA SUNRAY."
	
	para "En la cima, el"
	line "arcoíris"
	cont "aguarda."
	done
	
Route62TraceyScript:
	faceplayer
	showemote EMOTE_SHOCK, ROUTE_62_TRACEY, 15
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyRoute62Text
	waitbutton
	closetext
	winlosstext TraceyRoute62WinLoss, 0
	loadtrainer TRACEY, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyRoute62LeavingNowText
	waitbutton
	closetext
	applymovement ROUTE_62_TRACEY, Tracey62_Movement
	disappear ROUTE_62_TRACEY
	playsound SFX_ENTER_DOOR
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_ROUTE_62
	pause 10
	setevent EVENT_ROUTE_62_TRACEY
	end
	
TraceyRoute62Text:
	text "TRACEY: ¡Vaya,"
	line "mira quién"
	cont "está aquí!"
	
	para "<PLAYER>, ¿qué"
	line "tal? ¡Apuesto a"
	cont "que te has vuelto"
	cont "mucho más fuerte"
	cont "desde la RUTA 56!"
	
	para "¿Por qué no"
	line "ponemos a prueba"
	cont "mi teoría en una"
	cont "batalla?"
	done
	
TraceyRoute62WinLoss:
	text "¡Increíble!"
	done
	
TraceyRoute62LeavingNowText:
	text "TRACEY: ¡Me dirijo"
	line "a Trovitópolis!"
	
	para "He oído que tienen"
	line "un gran problema"
	cont "debido a su"
	cont "alcalde."
	
	para "¡Voy a ir a ver si"
	line "puedo ayudarlos!"
	
	para "¡Nos vemos,"
	line "<PLAYER>!"
	done
	
Tracey62_Movement:
	step UP
	step RIGHT
	step UP
	step_end

Route62_MapEventHeader::

.Warps: db 1
	warp_def 7, 6, 3, ROUTE_62_MANDARIN_DESERT_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 14, 62, SIGNPOST_READ, Route62Sign
	signpost  8, 46, SIGNPOST_READ, Route62ClimbSign

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 10, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62XSpecialAttack, EVENT_ROUTE_62_X_SPCL_ATK
	person_event SPRITE_POKE_BALL, 25, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62TMEarthquake, EVENT_ROUTE_62_TM_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 39, 64, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62Blackglasses, EVENT_ROUTE_62_BLACKGLASSES
	person_event SPRITE_POKE_BALL, 12, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62PPUp, EVENT_ROUTE_62_PP_UP
	person_event SPRITE_LASS, 23, 37, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassFuyumi, -1
	person_event SPRITE_YOUNGSTER, 22, 23, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterHiruma, -1
	person_event SPRITE_TRACEY, 9, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route62TraceyScript, EVENT_ROUTE_62_TRACEY
