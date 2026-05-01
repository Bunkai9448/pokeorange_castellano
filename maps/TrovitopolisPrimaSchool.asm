const_value = 1
	const TROVITOPOLIS_PRIMA_LORELEI
	const TROVITOPOLIS_PRIMA_STUDENT1
	const TROVITOPOLIS_PRIMA_STUDENT2
	const TROVITOPOLIS_PRIMA_TEACHER

TrovitopolisPrimaSchool_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

StudentScript:
	opentext
	writetext StudentStudyingHardText
	waitbutton
	closetext
	end

StudentStudyingHardText:
	text "Parecen estar"
	line "estudiando duro<...>"
	
	para "¡Mejor no molesto!"
	done
	
TeacherSchoolScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_HM_STRENGTH
	iftrue .AlreadyGotStrength
	writetext StrengthQuizWantToTakeText
	yesorno
	iftrue .StrengthQuiz
	writetext PrimaTeacherComeAgainText
	waitbutton
	closetext
	end
	
.AlreadyGotStrength:
	writetext AlreadyGotStrengthText
	waitbutton
	closetext
	end
	
.StrengthQuiz:
	writetext PrimaQuestion1
	yesorno
	iffalse .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion2
	yesorno
	iffalse .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion3
	yesorno
	iftrue .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion4
	yesorno
	iffalse .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion5
	yesorno
	iftrue .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaStrengthHMPrizeText
	waitbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_RECEIVED_HM_STRENGTH
	closetext
	end

.FailQuiz:
	playsound SFX_WRONG
	writetext PrimaThatsWrongText
	waitbutton
	closetext
	end
	
PrimaQuestionCorrectText:
	text "¡Es correcto!"
	done
	
PrimaThatsWrongText:
	text "¡Lo siento!. No"
	line "es correcto."
	done
	
PrimaQuestion1: ;ANSWER IS YES
	text "¿CHATOT puede"
	line "aprender el"
	cont "lenguaje humano?"
	done
	
PrimaQuestion2: ;ANSWER IS YES
	text "¿MAREEP es tipo"
	line "eléctrico?"
	done
	
PrimaQuestion3: ;ANSWER IS NO
	text "¿MAGIKARP se"
	line "encuentra en"
	cont "cualquier zona?"
	done
	
PrimaQuestion4: ;ANSWER IS YES
	text "¿LORELEI usa #MON"
	line "tipo hielo ?"
	done
	
PrimaQuestion5: ;ANSWER IS NO
	text "¿RATTATA aprende"
	line "pistola agua?"
	done

PrimaStrengthHMPrizeText:
	text "¡Buen trabajo!"
	line "Aquí tienes el"
	cont "premio por comple-"
	cont "tar el test."
	done

StrengthQuizWantToTakeText:
	text "Bienvenido a Prima,"
	line "la ESCUELA OFICIAL"
	cont "de entrenadores."
	
	para "Ofrecemos un item"
	line "a los estudiantes"
	cont "que aprueban el"
	cont "test. ¿Pruebas?"
	done
	
PrimaTeacherComeAgainText:
	text "Vuelve si"
	line "cambias de"
	cont "opinión."
	done
	
AlreadyGotStrengthText:
	text "¡Eres un estu-"
	line "diante brillante!"
	done
	
LoreleiSchoolScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LORELEI
	iftrue .AlreadyBeatLoreleiOnce
	writetext DoYouWantToBattleLoreleiText
	yesorno
	iftrue .BattleLoreleiFirstTime
	writetext LoreleiComeBackLaterText
	waitbutton
	closetext
	end

.AlreadyBeatLoreleiOnce:
	;checkevent EVENT_BEAT_DRAKE?
	writetext AlreadyBeatLoreleiOnceText
	waitbutton
	closetext
	end
	
.BattleLoreleiFirstTime:
	writetext BattleLoreleiFirstTimeText
	waitbutton
	closetext
	winlosstext LoreleiWinLossText, 0
	loadtrainer LORELEI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI
	opentext
	writetext AlreadyBeatLoreleiOnceText
	waitbutton
	closetext
	end

DoYouWantToBattleLoreleiText:
	text "LORELEI: <PLAYER>!"
	line "Gracias otra vez"
	cont "por la ayuda."
	cont "Me gusto formar"
	
	para "equipo."
	
	para "¿Te apetece un"
	line "combate entre"
	cont "nosotros?"
	done

LoreleiComeBackLaterText:
	text "LORELEI: ¡Jaja!"
	line "¡Muy bien! Si"
	cont "cambias de"
	cont "opinion, aqui"
	cont "estoy."
	done

AlreadyBeatLoreleiOnceText:
	text "LORELEI: ¡Eres"
	line "todo un entrena-"
	cont "dor <PLAYER>! Me"
	cont "recuerdas al"
	
	para "CAMPEON DE"
	line "KANTO. Cuídate"
	cont "mucho."
	done

BattleLoreleiFirstTimeText:
	text "LORELEI: ¡Okey!"
	line "¡Compruebalo tu"
	cont "mismo, alle voy!"
	done

LoreleiWinLossText:
	text "LORELEI: Estoy"
	line "tiritando de"
	cont "placer."
	done

TrovitopolisPrimaSchool_MapEventHeader::

.Warps: db 2
	warp_def 7, 5, 13, TROVITOPOLIS
	warp_def 7, 6, 13, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_LORELEI, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LoreleiSchoolScript, EVENT_LORELEI_AT_TRAINER_SCHOOL
	person_event SPRITE_YOUNGSTER, 6, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StudentScript, -1
	person_event SPRITE_LASS, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, StudentScript, -1
	person_event SPRITE_SUPER_NERD, 2, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherSchoolScript, -1

