const_value = 1
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkgate_MapScriptHeader:

.MapTriggers: db 3
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks: db 2
	dbw MAPCALLBACK_NEWMAP, Route35NationalParkgate_CheckIfStillInContest
	dbw MAPCALLBACK_OBJECTS, Route35NationalParkgate_CheckIfContestDay

.Trigger2:
	priorityjump Route35NationalParkGate_LeavingContestEarly
.Trigger0:
.Trigger2:
	end

Route35NationalParkgate_CheckIfStillInContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkgate_Yes
	dotrigger $0
	return

Route35NationalParkgate_Yes:
	dotrigger $2
	return

Route35NationalParkgate_CheckIfContestDay:
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, Route35NationalParkgate_IsContestDay
	if_equal THURSDAY, Route35NationalParkgate_IsContestDay
	if_equal SATURDAY, Route35NationalParkgate_IsContestDay
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkgate_Yes
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

Route35NationalParkgate_IsContestDay:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

Route35NationalParkGate_LeavingContestEarly:
	applymovement PLAYER, MovementData_0x6a2e2
	spriteface ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar $1
	RAM2MEM $0
	writetext UnknownText_0x6a79a
	yesorno
	iffalse Route35NationalParkgate_GoBackIn
	writetext UnknownText_0x6a7db
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

Route35NationalParkgate_GoBackIn:
	writetext UnknownText_0x6a823
	waitbutton
	closetext
	scall Route35NationalParkgate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

OfficerScript_0x6a204:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, Route35NationalParkgate_NoContestToday
	if_equal MONDAY, Route35NationalParkgate_NoContestToday
	if_equal WEDNESDAY, Route35NationalParkgate_NoContestToday
	if_equal FRIDAY, Route35NationalParkgate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkgate_ContestIsOver
	scall Route35NationalParkgate_GetDayOfWeek
	writetext UnknownText_0x6a2eb
	yesorno
	iffalse Route35NationalParkgate_DeclinedToParticipate
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, Route35NationalParkgate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkgate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6a39d
	buttonsound
	writetext UnknownText_0x6a3c7
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6a3e2
	waitbutton
	closetext
	special Special_GiveParkBalls
	scall Route35NationalParkgate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

Route35NationalParkgate_EnterContest:
	checkcode VAR_FACING
	if_equal LEFT, Route35NationalParkgate_FacingLeft
	applymovement PLAYER, MovementData_0x6a2e5
	end

Route35NationalParkgate_FacingLeft:
	applymovement PLAYER, MovementData_0x6a2e9
	end

Route35NationalParkgate_LeaveTheRestBehind:
	checkcode VAR_PARTYCOUNT
	if_less_than 6, Route35NationalParkgate_LessThanFullParty
	checkcode VAR_BOXSPACE
	if_equal 0, Route35NationalParkgate_NoRoomInBox

Route35NationalParkgate_LessThanFullParty: ; 6a27d
	special CheckFirstMonIsEgg
	if_equal $1, Route35NationalParkgate_FirstMonIsEgg
	writetext UnknownText_0x6a4c6
	yesorno
	iffalse Route35NationalParkgate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkgate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6a537
	buttonsound
	writetext UnknownText_0x6a56b
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump Route35NationalParkgate_OkayToProceed

Route35NationalParkgate_DeclinedToParticipate:
	writetext UnknownText_0x6a5dc
	waitbutton
	closetext
	end

Route35NationalParkgate_DeclinedToLeaveMonsBehind:
	writetext UnknownText_0x6a597
	waitbutton
	closetext
	end

Route35NationalParkgate_FirstMonIsFainted:
	writetext UnknownText_0x6a608
	waitbutton
	closetext
	end

Route35NationalParkgate_NoRoomInBox:
	writetext UnknownText_0x6a67c
	waitbutton
	closetext
	end

Route35NationalParkgate_FirstMonIsEgg:
	writetext UnknownText_0x6a71f
	waitbutton
	closetext
	end

Route35NationalParkgate_ContestIsOver:
	writetext UnknownText_0x6a84f
	waitbutton
	closetext
	end

Route35NationalParkgate_NoContestToday:
	jumptextfaceplayer UnknownText_0x6a894

OfficerScript_0x6a2ca:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkgate_ContestIsOver
	writetext UnknownText_0x6a894
	waitbutton
	closetext
	end

MapRoute36NationalParkgateSignpost0Script:
	jumptext UnknownText_0x6a90e

Route35NationalParkgate_GetDayOfWeek:
	jumpstd daytotext
	end

MovementData_0x6a2e2:
	step DOWN
	turn_head LEFT
	step_end

MovementData_0x6a2e5:
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x6a2e9:
	step UP
	step_end

UnknownText_0x6a2eb:
	text "Hoy es @"
	text_from_ram StringBuffer3
	text "."
	line "Eso significa que"

	para "el concurso "
	line "caza-bichos es hoy"

	para "Las reglas son"
	line "simples."

	para "Solo puedes usar"
	line "un #MON, para"

	para "atrapar al"
	line "#MON bicho que"
	cont "sera evaluado."

	para "¿Te gustaría"
	line "intentarlo?"
	done

UnknownText_0x6a39d:
	text "Aqui tienes las"
	line "PARK BALLS para"
	cont "el concurso."
	done

UnknownText_0x6a3c7:
	text "<PLAYER> obtuvo"
	line "20 PARK BALLS."
	done

UnknownText_0x6a3e2:
	text "La persona que"
	line "que logré el"
	cont "#MON bicho"
	cont "mas fuerte, será"
	cont "el ganador."

	para "Dispones de 20"
	line "minutos."

	para "Si te quedas sin"
	line "PARK BALLS, se"
	cont "acabo."

	para "Puedes quedarte"
	line "el último #MON"
	cont "que atrapes."

	para "Ve y captura al"
	line "bicho mas fuerte."

	para "#MON you can"
	line "find!"
	done

UnknownText_0x6a4c6:
	text "Uh-oh<...>"

	para "Tienes mas de"
	line "un #MON."

	para "Tendras que usar"
	line "@"
	text_from_ram StringBuffer3
	text ", el"

	para "primer #MON"
	line "de tu equipo."

	para "¿Irás con "
	line "este?"
	done

UnknownText_0x6a537:
	text "Bien,guardaremos"
	line "tus otros #MON"
	cont "mientras compites."
	done

UnknownText_0x6a56b:
	text "#MON <PLAYER>"
	line "se quedaron con"
	cont "el ayudante."
	done

UnknownText_0x6a597:
	text "Por favor, elige"
	line "el #MON que"
	cont "usarás."

	para "Despues del,"
	line "concurso, ven"
	cont "a verme."
	done

UnknownText_0x6a5dc:
	text "OK. Esperamos"
	line "que participes"
	cont "en el futuro."
	done

UnknownText_0x6a608:
	text "Uh-oh<...>"
	line "Tu primer #MON"

	para "no puede"
	line "combatir."

	para "Por favor, cambia"
	line "de #MON."

	para "Cuando lo hagas,"
	line "vuelve a verme."
	done

UnknownText_0x6a67c:
	text "Uh-oh<...>"
	line "Tu equipo y"

	para "la caja de PC"
	line "estan llenos.."

	para "No tienes espacio"
	line "para los"
	cont "#MON que"
	cont "atrapes."

	para "Por favor, haz"
	line "espacio en tu"

	para "equipo o PC,"
	line "despues vuelve."
	done

UnknownText_0x6a71f:
	text "Uh-oh<...>"
	line "Tienes un huevo"

	para "como primer #MON"
	line "en tu equipo."

	para "Por favor,"
	line "cambialo por un"

	para "#MON que puedas"
	line "usar, despues ven"
	cont "a verme."
	done

UnknownText_0x6a79a:
	text "Todavia quedan @"
	text_from_ram StringBuffer3
	text ""
	line "minuto(s)."

	para "¿Quieres terminar"
	line "ya?"
	done

UnknownText_0x6a7db:
	text "OK. Espera en"
	line "la puerta norte"

	para "para el anunncio"
	line "de los ganadores."
	done

UnknownText_0x6a823:
	text "OK. Por favor,"
	line "ve fuera y"
	cont "termina."
	done

UnknownText_0x6a84f:
	text "Se acabo el "
	line "concurso de hoy."

	para "Esperamos tu"
	line "participación en"
	cont "el futuro."
	done

UnknownText_0x6a894:
	text "Realizamos "
	line "concursos con"

	para "frecuencia en el"
	line "PARQUE. Deberías"
	cont "echarles un"
	cont "vistazo."
	done

UnknownText_0x6a90e:
	text "El concurso de"
	line "Caza de bichos es"

	para "los martes, miér-"
	line "coles y sabados."

	para "No solo ganarás"
	line "un premio por"

	para "participar,también"
	line "puedes quedarte"

	para "al #MON"
	line "bicho que tengas"

	para "al acabar el "
	line "concurso."
	done

Route35NationalParkgate_MapEventHeader:

.Warps: db 2
	warp_def $0, $3, 3, NATIONAL_PARK
	warp_def $0, $4, 4, NATIONAL_PARK

.XYTriggers: db 0

.Signposts: db 1
	signpost 0, 5, SIGNPOST_READ, MapRoute36NationalParkgateSignpost0Script

.PersonEvents: db 2
	person_event SPRITE_OFFICER, 1, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x6a204, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x6a2ca, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
