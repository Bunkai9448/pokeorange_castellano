const_value = 1
	const ROUTE_56_FISHER_ISAO
	const ROUTE_56_RUNNER_KAITO
	const ROUTE_56_SWIMMERF_SAKAKO
	const ROUTE_56_SWIMMERM_NAOYA
	const ROUTE_56_TRACEY
	const ROUTE_56_ITEMBALL1
	const ROUTE_56_ITEMBALL2

Route56West_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route56Sign:
	jumptext Route56SignText

Route56SignText:
	text "RUTA 56"
	line "ESTE hacia"
	cont "ISLA KINNOW"
	done

TrainerFisherIsao:
	trainer EVENT_BEAT_FISHER_ISAO, FISHER, ISAO, FisherIsaoSeenText, FisherIsaoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherIsaoAfterText
	waitbutton
	closetext
	end

FisherIsaoSeenText:
	text "Jeje. Te"
	line "sorprenderías si"
	cont "pudieras pescar"
	cont "con una"
	cont "CAÑA BUENA."
	done

FisherIsaoBeatenText:
	text "¡Me he enganchado!"
	done

FisherIsaoAfterText:
	text "He oído que se"
	line "puede conseguir"
	cont "una CAÑA BUENA"
	cont "en la ISLA MORO."
	done

TrainerAthleteKaito:
	trainer EVENT_BEAT_ATHLETE_KAITO, ATHLETE, KAITO, AthleteKaitoSeenText, AthleteKaitoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteKaitoAfterText
	waitbutton
	closetext
	end

AthleteKaitoSeenText:
	text "¡Mis #MON se"
	line "centran en la"
	cont "velocidad!"
	done

AthleteKaitoBeatenText:
	text "¡Eso fue rápido!"
	done

AthleteKaitoAfterText:
	text "¡Eso pasó en un"
	line "abrir y cerrar"
	cont "de ojos!"
	done

TrainerSwimmerSakako:
	trainer EVENT_BEAT_SWIMMERF_SAKAKO, SWIMMERF, SAKAKO, SwimmerSakakoSeenText, SwimmerSakakoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerSakakoAfterText
	waitbutton
	closetext
	end

SwimmerSakakoSeenText:
	text "¡Kyaa! ¡Aléjate!"
	done

SwimmerSakakoBeatenText:
	text "¡Pensé que eras"
	line "un SHARPEDO!"
	done

SwimmerSakakoAfterText:
	text "Algunos #MON"
	line "son muy"
	cont "peligrosos."

	para "¡Puedes lastimarte"
	line "si no tienes"
	cont "cuidado!"
	done

TrainerSwimmerNaoya:
	trainer EVENT_BEAT_SWIMMERM_NAOYA, SWIMMERM, NAOYA, SwimmerNaoyaSeenText, SwimmerNaoyaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerNaoyaAfterText
	waitbutton
	closetext
	end

SwimmerNaoyaSeenText:
	text "¡Acabo de usar una"
	line "PIEDRA para"
	cont "evolucionar a mi"
	cont "SHELLDER!"
	done

SwimmerNaoyaBeatenText:
	text "Los SCIZOR no"
	line "temen a la"
	cont "SEGADORA<...>"
	done

SwimmerNaoyaAfterText:
	text "Por cierto, mi"
	line "grupo favorito es"
	cont "BLUE CLOYSTER"
	cont "CULT."
	done

TraceyScript1:
	playmusic MUSIC_TRACEY_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE_56_TRACEY, 15
	opentext
	writetext TraceyYoText
	waitbutton
	spriteface PLAYER, RIGHT
	applymovement ROUTE_56_TRACEY, MovementYo1
	writetext TraceyLetsBattleText
	waitbutton
	closetext
	winlosstext TraceyRoute56WinLoss, 0
	loadtrainer TRACEY, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyLeavingNowText
	waitbutton
	verbosegiveitem EXP_ALL
	closetext
	applymovement ROUTE_56_TRACEY, Tracey56_Movement
	disappear ROUTE_56_TRACEY
;	special Special_FadeInQuickly
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	domaptrigger ROUTE_56_WEST, $1
	end

TraceyScript2:
	playmusic MUSIC_TRACEY_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE_56_TRACEY, 15
	opentext
	writetext TraceyYoText
	waitbutton
	spriteface PLAYER, RIGHT
	applymovement ROUTE_56_TRACEY, MovementYo2
	writetext TraceyLetsBattleText
	waitbutton
	closetext
	winlosstext TraceyRoute56WinLoss, 0
	loadtrainer TRACEY, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyLeavingNowText
	waitbutton
	verbosegiveitem EXP_ALL
    writetext TraceyReallyLeavingNowText
	waitbutton
	closetext
	applymovement ROUTE_56_TRACEY, Tracey56_Movement
	disappear ROUTE_56_TRACEY
;	special Special_FadeInQuickly
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	domaptrigger ROUTE_56_WEST, $1
	end

TraceyYoText:
	text "¡<PLAYER>!"
	done

TraceyLetsBattleText:
	text "¡Mucho tiempo sin"
	line "verlo!"

	para "¡Parece que te has"
	line "vuelto mucho más"
	cont "fuerte!"

	para "He observado muchos"
	line "#MON diferentes."

	para "¡Veamos quién"
	line "consiguió el más"
	cont "fuerte!"
	done

TraceyRoute56WinLoss:
	text "¡Eres muy fuerte,"
	line "<PLAYER>!"
	done

TraceyLeavingNowText:
	text "¡Realmente necesito"
	line "concentrarme en el"
	cont "entrenamiento si"
	cont "quiero ser"
	cont "asistente del"
	cont "del PROF.OAK!"

	para "Oh, sí."
	
	para "¡Esto te ayudará!"
	line "¡Te facilitará el"
	cont "entrenamiento!"
	done

TraceyReallyLeavingNowText:
	text "<PLAYER>, si vas"
	line "a la ISLA KINNOW,"
	cont "¡asegúrate de"
	cont "visitar la TIENDA"
	cont "DE SKATE!"

	para "¡Nos vemos por"
	cont "ahí!"
	done

MovementYo1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementYo2:
	step LEFT
	step LEFT
	step LEFT
	step_end

Tracey56_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Route56WestHPUp:
	itemball HP_UP

Route56WestUltraBall:
	itemball ULTRA_BALL

Route56WestHiddenUltraBall:
	dwb EVENT_ROUTE_56_WEST_HIDDEN_ULTRA_BALL, ULTRA_BALL

Route56West_MapEventHeader::

.Warps: db 1
	warp_def 7, 35, 1, ROUTE_56_POKE_CENTER

.CoordEvents: db 2
	xy_trigger 0, 20, 50, TraceyScript1
	xy_trigger 0, 20, 51, TraceyScript2

.BGEvents: db 2
	signpost 9, 37, SIGNPOST_READ, Route56Sign
	signpost 25, 43, SIGNPOST_ITEM, Route56WestHiddenUltraBall

.ObjectEvents: db 7
	person_event SPRITE_FISHER, 22, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherIsao, -1
	person_event SPRITE_COOLTRAINER_M, 8, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerAthleteKaito, -1
	person_event SPRITE_SWIMMER_GIRL, 18, 25, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerSakako, -1
	person_event SPRITE_SWIMMER_GUY, 24,  5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerNaoya, -1
	person_event SPRITE_TRACEY, 20, 55, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_56_TRACEY
	person_event SPRITE_POKE_BALL,  9, 53, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route56WestHPUp, EVENT_ROUTE_56_WEST_HP_UP
	person_event SPRITE_POKE_BALL, 27, 52, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route56WestUltraBall, EVENT_ROUTE_56_WEST_ULTRA_BALL
