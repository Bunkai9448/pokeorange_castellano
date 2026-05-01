const_value = 1
	const TANGELOISLAND_LAPRAS
	const TANGELOISLAND_TRACEY
	const TANGELOISLAND_TEACHER
	const TANGELOISLAND_YOUNGSTER
	const TANGELOISLAND_POKE_BALL

TangeloIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TANGELO
	return

TangeloIslandLaprasScript:
	faceplayer
	opentext
	writetext LaprasIntroText
	yesorno
	iftrue .Yes
	waitbutton
	closetext
	end
.Yes:
	writetext GotLaprasText
	playsound SFX_GET_BADGE
	waitsfx
	givepoke LAPRAS, 10, BERRY, 0
	disappear TANGELOISLAND_LAPRAS
	special Special_FadeInQuickly
	writetext LaprasSurf
	waitbutton
	verbosegiveitem HM_SURF
	waitsfx
	closetext
	end

TangeloTraceyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GS_BALL_FROM_TRACEY
	iftrue .GotGSBall
	writetext UnknownText_0x19c4e2
	pause 10
	verbosegiveitem GS_BALL
	waitsfx
	closetext
	setevent EVENT_GOT_GS_BALL_FROM_TRACEY
	end

.GotGSBall:
	checkevent EVENT_SHOWED_GS_BALL_TO_IVY
	iftrue .TraceyBattle
	writetext TraceyRelievedText
	waitbutton
	closetext
	end

.TraceyBattle:
	playmusic MUSIC_TRACEY_ENCOUNTER
	writetext TraceyBattleText
	waitbutton
	closetext
	winlosstext TraceyWinLoss, 0
	loadtrainer TRACEY, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyLeavingTangelo
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovement
	applymovement TANGELOISLAND_TRACEY, Tracey_Movement
	disappear TANGELOISLAND_TRACEY
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

TangeloTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TANGELO_HEAL_BALL
	iftrue .AlreadyGotHealBall
	writetext TangeloTeacherText
	waitbutton
	verbosegiveitem HEAL_BALL
	closetext
	setevent EVENT_TANGELO_HEAL_BALL
	end
	
.AlreadyGotHealBall
	writetext TangeloTeacherText2
	waitbutton
	closetext
	end

TangeloYoungsterScript:
	jumptextfaceplayer TangeloYoungsterText

TangeloIslandRareCandy:
	itemball RARE_CANDY

TangeloIslandSign:
	jumptext TangeloIslandSignText

TangeloCenterSign:
	jumptext TangeloCenterSignText

TraceyBattleText:
	text "¿Así que lo"
	line "entregaste?"

	para "¿Qué? ¿Vas a"
	line "por el"
	cont "ORANGE CREW?"

	para "Es realmente"
	line "interesante."

	para "Oye, ¿Y si"
	line "combatimos?"
	cont "¡Soy fuerte!"
	done

TraceyLeavingTangelo:
	text "Oye, ¿Por que"
	line "no coges este"
	cont "LAPRAS?"

	para "Fue separado de"
	line "de su familia,"
	cont "y necesita un"
	cont "buen entrenador."

	para "¡Oh, que duro!"
	line "Mi nombre es"
	cont "TRACEY SKETCHIT."
	cont "Soy un OBSER-"
	cont "VADOR."

	para "De todas formas,"
	line "me voy. ¡Nos"
	cont "vemos!"
	done

LaprasIntroText:
	text "El LAPRAS parece"
	line "querer unirse a"
	cont "ti."

	para "¿Coges a LAPRAS?"
	done

GotLaprasText:
	text "LAPRAS se unio"
	line "a tu equipo."
	done

UnknownText_0x19c4e2:
	text "Este pobre LAPRAS"
	line "estaba varado en"
	cont "RUTA 50. Lo salvé."

	para "<...><...>"

	para "¿Que es eso? ¿Eres"
	line "de VALENCIA?"

	para "Ya veo. Digamos"
	line "que estaba de"
	cont "camino para"

	para "entregar algo a"
	line "la PROF.IVY de"
	cont "parte de un amigo."

	para "¿Podrias llevar-"
	line "selo por mi?"
	done

TraceyRelievedText:
	text "¿Podrias llevar"
	line "esta GS BALL "
	cont "por mi?"
	done

TraceyWinLoss:
	text "¡Wow, podrías"
	line "tener una"
	cont "oportunidad."
	done

TangeloTeacherText:
	text "Si quieres que"
	line "un #MON atra-,"
	cont "pado tenga sus PS,"
	cont "usa una SANA BALL."
	done
	
TangeloTeacherText2:
	text "La SANA BALL"
	line "devolverá a un"
	cont "#MON salavaje"
	cont "todos sus PS."
	done

TangeloYoungsterText:
	text "A algunas per-"
	line "sonas no les"
	cont "gusta salir"
	cont "durante el día."
	
	para "Algunas pre-"
	line "fieren la noche."
	cont "En ese caso, son"
	cont "como los #MON."
	done

TangeloIslandSignText:
	text "ISLA TANGELO"
	done

TangeloCenterSignText:
	text "CENTRO TANGELO"
	done

LaprasSurf:
	text "Hay algo"
	line "flotando en"
	cont "el agua."
	done

PlayerMovement:
	step RIGHT
	turn_head LEFT
	step_end

Tracey_Movement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TangeloIsland_MapEventHeader::

.Warps: db 5
	warp_def 9, 11, 2, TANGELO_MART
	warp_def 9, 15, 1, TANGELO_POKECENTER_1F
	warp_def 19, 19, 1, TANGELO_GYM_SPEECH_HOUSE
	warp_def 19, 29, 1, TANGELO_EVOLUTION_SPEECH_HOUSE
	warp_def 11, 31, 2, TANGELO_PORT

.CoordEvents: db 0

.BGEvents: db 2
	signpost 20, 24, SIGNPOST_READ, TangeloIslandSign
	signpost 7, 21, SIGNPOST_READ, TangeloCenterSign

.ObjectEvents: db 5
	person_event SPRITE_SURF, 5, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloIslandLaprasScript, EVENT_TANGELO_ISLAND_LAPRAS
	person_event SPRITE_TRACEY, 7, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TangeloTraceyScript, EVENT_TANGELO_ISLAND_TRACEY
	person_event SPRITE_COOLTRAINER_M, 22, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 12, 27, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TangeloYoungsterScript, -1
	person_event SPRITE_POKE_BALL, 23, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloIslandRareCandy, EVENT_TANGELO_ISLAND_RARE_CANDY

