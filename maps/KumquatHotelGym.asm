KumquatHotelGym_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

LuanaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUANA
	iftrue .FightDone
	writetext LuanaText
	waitbutton
	closetext
	winlosstext LuanaWinLossText, 0
	loadtrainer LUANA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LUANA
	opentext
	writetext BeatLuanaText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_JADE_STAR_BADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_PSYCHIC
	iftrue .SpeechAfterTM
;	setevent event_beat_gym_trainers
	writetext LuanaPsychicText
	buttonsound
	verbosegiveitem TM_PSYCHIC_M
	iffalse .NoRoomForPsychic
	setevent EVENT_GOT_TM_PSYCHIC
	writetext LuanaPsychicExplanationText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext LuanaAlreadyGotTMText
	waitbutton
.NoRoomForPsychic:
	closetext
	end
	
LuanaText:
	text "Bien, lo haré."
	
	para "Puede que seas"
	line "tan fuerte como"
	cont "mi niño."
	
	para "Derrotarme te"
	line "otorgará la"
	cont "medalla ESTRELLA"
	cont "DE JADE."
	
	para "Enséñame tu"
	line "poder."
	done
	
LuanaWinLossText:
	text "No eres tan niño"
	
	para "Y despues de todo"
	line "no eres mi niño,"
	cont "<PLAYER>."
	
	para "¡Grandísimo"
	line "combate! Toma la"
	cont "medalla ESTRELLA"
	cont "DE JADE y ve"
	cont "directo a POMELO."
	done

BeatLuanaText:
	text "<PLAYER> obtuvo"
	line "la medalla "
	cont "ESTRELLA de JADE."
	done

LuanaPsychicText:
	text "Tan precioso."

	para "Esta medalla"
	line "hará que #MON"
	cont "de todos los"
	cont "los niveles te"
	cont "obedezcan."

	para "Puedes coger"
	line "esto."
	done

LuanaPsychicExplanationText:
	text "Esta MT es"
	line "PSIQUICO."
	cont "Estoy segura de"
	cont "que te será de"
    cont "ayuda."
	done

LuanaAlreadyGotTMText:
	text "Mi chico..."
	line "Nos vemos."
	done

KumquatHotelGym_MapEventHeader::

.Warps: db 1
	warp_def  0,  7, 1, KUMQUAT_HOTEL_ELEVATOR

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LUANA,  5,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuanaScript, -1
