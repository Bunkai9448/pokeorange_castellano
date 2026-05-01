const_value = 1
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_OFFICER2
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7

Route36NationalParkgate_MapScriptHeader:
.MapTriggers: db 3
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	dbw MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.Trigger2:
	priorityjump .LeftTheContestEarly
.Trigger0:
.Trigger1:
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	dotrigger $0
	return

.BugContestIsRunning:
	dotrigger $2
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .SetContestOfficer
	if_equal THURSDAY, .SetContestOfficer
	if_equal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	return

.LeftTheContestEarly:
	spriteface PLAYER, UP
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar $1
	RAM2MEM $0
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special Special_FadeInQuickly
	jumpstd bugcontestresults

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, $21, $12
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, _ContestNotOn
	if_equal MONDAY, _ContestNotOn
	if_equal WEDNESDAY, _ContestNotOn
	if_equal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36Parkgate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special Special_GiveParkBalls
	spriteface PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, $21, $12
	end

.LeaveMonsWithOfficer:
	checkcode VAR_PARTYCOUNT
	if_less_than $6, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	if_equal $0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	if_equal $1, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

OfficerScript_0x6acf4:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route36Parkgate_DayToText:
	jumpstd daytotext
	end

YoungsterScript_0x6ad06:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad14
	writetext UnknownText_0x6b399
	waitbutton
	closetext
	end

UnknownScript_0x6ad14:
	writetext UnknownText_0x6b3c4
	waitbutton
	closetext
	end

YoungsterScript_0x6ad1a:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad28
	writetext UnknownText_0x6b40f
	waitbutton
	closetext
	end

UnknownScript_0x6ad28:
	writetext UnknownText_0x6b440
	waitbutton
	closetext
	end

RockerScript_0x6ad2e:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad3c
	writetext UnknownText_0x6b462
	waitbutton
	closetext
	end

UnknownScript_0x6ad3c:
	writetext UnknownText_0x6b496
	waitbutton
	closetext
	end

PokefanMScript_0x6ad42:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad50
	writetext UnknownText_0x6b4da
	waitbutton
	closetext
	end

UnknownScript_0x6ad50:
	writetext UnknownText_0x6b50a
	waitbutton
	closetext
	end

YoungsterScript_0x6ad56:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad64
	writetext UnknownText_0x6b54e
	waitbutton
	closetext
	end

UnknownScript_0x6ad64:
	writetext UnknownText_0x6b57c
	waitbutton
	closetext
	end

YoungsterScript_0x6ad6a:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad78
	writetext UnknownText_0x6b5b0
	waitbutton
	closetext
	end

UnknownScript_0x6ad78:
	writetext UnknownText_0x6b5dd
	waitbutton
	closetext
	end

LassScript_0x6ad7e:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ad8c
	writetext UnknownText_0x6b64b
	waitbutton
	closetext
	end

UnknownScript_0x6ad8c:
	writetext UnknownText_0x6b698
	waitbutton
	closetext
	end

YoungsterScript_0x6ad92:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6ada0
	writetext UnknownText_0x6b6b8
	waitbutton
	closetext
	end

UnknownScript_0x6ada0:
	writetext UnknownText_0x6b6e9
	waitbutton
	closetext
	end

YoungsterScript_0x6ada6:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6adb4
	writetext UnknownText_0x6b71b
	waitbutton
	closetext
	end

UnknownScript_0x6adb4:
	writetext UnknownText_0x6b740
	waitbutton
	closetext
	end

YoungsterScript_0x6adba:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_1
	iffalse UnknownScript_0x6adc8
	writetext UnknownText_0x6b76f
	waitbutton
	closetext
	end

UnknownScript_0x6adc8:
	writetext UnknownText_0x6b7af
	waitbutton
	closetext
	end

MovementData_0x6add1:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "Hoy es @"
	text_from_ram StringBuffer3
	text "."
	line "Significa que el"

	para "concurso Caza-"
	line "bichos es hoy."

	para "Las reglas son"
	line "simples."

	para "Usando uno de"
	line "tus #MON, caza"

	para "un #MON nicho"
	line "para evaluarlo."

	para "¿Te gustaria"
	line "intentarlo?"
	done

UnknownText_0x6ae87:
	text "Aqui tienes las"
	line "PARQUE BALLS"
	cont "para el concurso."
	done

UnknownText_0x6aeb1:
	text "<PLAYER> obtuvo"
	line "20 PARQUE BALLS."
	done

UnknownText_0x6aecc:
	text "Quien logre el"
	line "#MON bicho mas"
	cont "fuerte sera el"
	cont "ganador."

	para "Tienes 20"
	line "minutos."

	para "Si te quedas sin"
	line "PARQUE BALLS,"
	cont "se acabó."

	para "Puedes quedarte"
	line "el último #MON"
	cont "que atrapaste."

	para "¡Ve y atrapa el"
	line "#MON bicho mas"

	para "fuerte que"
	line "encuentres!"
	done

UnknownText_0x6afb0:
	text "Uh-oh<...>"

	para "Tienes mas de"
	line "un #MON."

	para "Tendras que usar"
	line "@"
	text_from_ram StringBuffer3
	text ", el"

	para "primer #MON"
	line "de tu equipo."

	para "¿Te parece"
	line ""bien?"
	done

UnknownText_0x6b021:
	text "Bien,guardaremos"
	line "tus otros #MON"
	cont "mientras compites."
	done

UnknownText_0x6b055:
	text "<PLAYER> #MON"
	line "se quedaron con"
	cont "el AYUDANTE."
	done

UnknownText_0x6b081:
	text "Por favor, elige"
	line "el #MON que"

	para "usarás, luego"
	line "ven a verme."
	done

UnknownText_0x6b0c6:
	text "OK. Esperamos"
	line "que participes"
	cont "en el futuro."
	done

UnknownText_0x6b0f2:
	text "Uh-oh<...>"
	line "El primer #MON"

	para "de tu equipo no"
	line "puede combatir."

	para "Por favor, cambia"
	line "ese #MON por"

	para "él que quieras"
	line "usar y vuelve."
	done

UnknownText_0x6b166:
	text "Uh-oh<...>"
	line "Tu equipo y"

	para "la CAJA DEL PC"
	line "están completos."

	para "No tienes espacio"
	line "para poner el"
	cont "#MON bicho que"
	cont "has atrapado."

	para "Por favor, haz"
	line "hueco en tu"

	para "equipo o pc y"
	line "vuelve a verme."
	done

UnknownText_0x6b209:
	text "Uh-oh<...>"
	line "Tienes un huevo"

	para "como primer #MON"
	line "en tu equipo."

	para "Por favor, cambia-"
	line "por el #MON"

	para "que quieras usar"
	line "y vuelve a verme."
	done

UnknownText_0x6b284:
	text "Todavia quedan @"
	text_from_ram StringBuffer3
	text ""
	line "minutos."

	para "¿Quieres acabar"
	line "ya?"
	done

UnknownText_0x6b2c5:
	text "OK. Espera"
	line "aqui el"

	para "anuncio de los"
	line "ganadores."
	done

UnknownText_0x6b300:
	text "OK. Vuelve fuera"
	line "y acaba el"
	cont "concurso."
	done

UnknownText_0x6b32b:
	text "El concurso de"
	line "hoy se acabo."

	para "Esperamos volver"
	line "a veros."
	done

UnknownText_0x6b370:
	text "Algunos MON"
	line "solo se encuentran"
	cont "en el parque."
	done

UnknownText_0x6b399:
	text "DON: Wow, me"
	line "ganaste. Eres"
	cont "muy bueno."
	done

UnknownText_0x6b3c4:
	text "DON: La suerte"
	line "también juega."

	para "Nunca sabes"
	line "que #MON"
	cont "aparecerá."
	done

UnknownText_0x6b40f:
	text "ED: Te envidio."
	line "No pude lograrlo"
	cont "esta vez."
	done

UnknownText_0x6b440:
	text "ED: ¿Quizas"
	line "ganaste con un"
	cont "gran #MON?"
	done

UnknownText_0x6b462:
	text "NICK: ¡Bien hecho!"
	line "Entrenare mejor"
	cont "a mi #MON."
	done

UnknownText_0x6b496:
	text "NICK: Quizas"
	line "lograste una"

	para "gran puntuación"
	line "por un #MON de"
	cont "un color inusual."
	done

UnknownText_0x6b4da:
	text "WILLIAM: ¿Eres"
	line "el ganador?"
	cont "¿Que atrapaste?"
	done

UnknownText_0x6b50a:
	text "WILLIAM: Bueno,"
	line "estoy satisfecho."

	para "Atrape un #MON"
	line "que buscaba."
	done

UnknownText_0x6b54e:
	text "BENNY: ¡Feli-"
	line "cidades! Tienes"
	cont "mi respeto."
	done

UnknownText_0x6b57c:
	text "BENNY: Atrapé"
	line "un SCYTHER antes,"
	cont "pero no gané."
	done

UnknownText_0x6b5b0:
	text "BARRY: El #-"
	line "MON que atra-"
	cont "paste es"
	cont "increible."
	done

UnknownText_0x6b5dd:
	text "BARRY: Es mas"
	line "fácil ganar con"

	para "#MON bicho"
	line "de gran nivel."

	para "Pero pienso que"
	line "hay que considerar"
	cont "otros aspectos."
	done

UnknownText_0x6b64b:
	text "CINDY: ¿Ganaste?"
	line "¡Genial!"

	para "¿Te apetece"
	line "buscar un #MON"
	cont "conmigo?"
	done

UnknownText_0x6b698:
	text "CINDY: ¡Amo"
	line "los #MON bicho!"
	done

UnknownText_0x6b6b8:
	text "JOSH: I<...> No"
	line "puedo creer mi"
	cont "derrota<...>"
	done

UnknownText_0x6b6e9:
	text "JOSH: ¡He oido"
	line "que alguien gano"
	cont "con un CATERPIE!"
	done

UnknownText_0x6b71b:
	text "SAMUEL: Ganaré"
	line "a la siguiente."
	done

UnknownText_0x6b740:
	text "SAMUEL: Joba."
	line "Pensaba que"
	cont "tendría una"
	cont "puntuación"
	cont "mayor<...>"
	done

UnknownText_0x6b76f:
	text "KIPP: Could you"
	line "give me some tips?"

	para "I want to study"
	line "your style."
	done

UnknownText_0x6b7af:
	text "KIPP: Estudie"
	line "mucho, pero no"

	para "lo suficiente"
	line "para ganar."
	done

UnknownText_0x6b910:
	text "Uh-oh<...> Tu"
	line "mochila esta llena."

	para "Te guardaremos"
	line "el premio pero"
	cont "solo por hoy."

	para "Haz hueco y"
	line "ven a verme."
	done

UnknownText_0x6b97f:
	text "¿<PLAYER>?"

	para "Este es el"
	line "premio que"
	cont "te guardabamos."
	done

Route36NationalParkgate_MapEventHeader:

.Warps: db 2
	warp_def $4, $0, 1, NATIONAL_PARK
	warp_def $5, $0, 2, NATIONAL_PARK

.XYTriggers: db 0

.Signposts: db 1
	signpost 0, 6, SIGNPOST_READ, MapRoute36NationalParkgateSignpost0Script

.PersonEvents: db 12
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	person_event SPRITE_OFFICER, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x6acf4, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	person_event SPRITE_YOUNGSTER, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6ad06, EVENT_BUG_CATCHING_CONTESTANT_1B
	person_event SPRITE_YOUNGSTER, 5, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6ad1a, EVENT_BUG_CATCHING_CONTESTANT_2B
	person_event SPRITE_ROCKER, 6, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RockerScript_0x6ad2e, EVENT_BUG_CATCHING_CONTESTANT_3B
	person_event SPRITE_POKEFAN_M, 5, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x6ad42, EVENT_BUG_CATCHING_CONTESTANT_4B
	person_event SPRITE_YOUNGSTER, 7, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6ad56, EVENT_BUG_CATCHING_CONTESTANT_5B
	person_event SPRITE_YOUNGSTER, 6, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6ad6a, EVENT_BUG_CATCHING_CONTESTANT_6B
	person_event SPRITE_LASS, 6, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LassScript_0x6ad7e, EVENT_BUG_CATCHING_CONTESTANT_7B
	person_event SPRITE_YOUNGSTER, 7, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6ad92, EVENT_BUG_CATCHING_CONTESTANT_8B
	person_event SPRITE_YOUNGSTER, 7, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6ada6, EVENT_BUG_CATCHING_CONTESTANT_9B
	person_event SPRITE_YOUNGSTER, 6, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6adba, EVENT_BUG_CATCHING_CONTESTANT_10B
