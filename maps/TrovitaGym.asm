const_value = 1
	const TROVITA_GYM_RUDY
	const TROVITA_GYM_GUY
	const TROVITA_GYM_MORIKO
	const TROVITA_GYM_AIRI
	const TROVITA_GYM_KATSUO
	const TROVITA_GYM_SON
	const PIA_CARROT_BETA

TrovitaGym_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TROVITA
	return

RudyScript:
	blackoutmod TROVITOPOLIS
	faceplayer
	opentext
	checkevent EVENT_BEAT_RUDY
	iftrue .FightDone
	writetext RudyText
	waitbutton
	closetext
	winlosstext RudyWinLossText, 0
	loadtrainer RUDY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RUDY
	opentext
	writetext BeatRudyText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SPIKE_SHELL_BADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_DOUBLE_TEAM
	iftrue .SpeechAfterTM
;	setevent event_beat_gym_trainers
	writetext RudyDoubleTeamText
	buttonsound
	verbosegiveitem TM_DOUBLE_TEAM
	iffalse .NoRoomForDoubleTeam
	setevent EVENT_GOT_TM_DOUBLE_TEAM
	writetext RudyDoubleTeamExplanationText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext RudyAlreadyGotTMText
	waitbutton
.NoRoomForDoubleTeam:
	closetext
	end

TrovitaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RUDY
	iftrue .TrovitaGymGuyWinScript
	writetext TrovitaGymGuyText
	waitbutton
	closetext
	end

.TrovitaGymGuyWinScript:
	writetext TrovitaGymGuyWinText
	waitbutton
	closetext
	end

TrovitaGymStatue:
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext RUDY, 1, $1
	jumpstd gymstatue2

CooltrainerMorikoScript:
	trainer EVENT_BEAT_COOLTRAINERF_MORIKO, COOLTRAINERF, MORIKO, CooltrainerMorikoSeenText, CooltrainerMorikoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMorikoAfterText
	waitbutton
	closetext
	end

CooltrainerMorikoSeenText:
	text "¡RUDY no tiene"
	line "tiempo para un"
	cont "perdedor como"
	cont "tu!"
	done

CooltrainerMorikoBeatenText:
	text "¿Qué?"
	done

CooltrainerMorikoAfterText:
	text "Justo me pillaste"
	line "con la guardia"
	cont "baja."
	done

CooltrainerAiriScript:
	trainer EVENT_BEAT_COOLTRAINERF_AIRI, COOLTRAINERF, AIRI, CooltrainerAiriSeenText, CooltrainerAiriBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerAiriAfterText
	waitbutton
	closetext
	end

CooltrainerAiriSeenText:
	text "Um<...>"
	
	para "Tengamos una"
	line "lucha justa."
	done

CooltrainerAiriBeatenText:
	text "¡Buaaa!"
	done

CooltrainerAiriAfterText:
	text "Snifff<...>"
	
	para "Perdí de ma-"
	line "nera justa."
	done

CooltrainerKatsuoScript:
	trainer EVENT_BEAT_COOLTRAINERM_KATSUO, COOLTRAINERM, KATSUO, CooltrainerKatsuoSeenText, CooltrainerKatsuoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerKatsuoAfterText
	waitbutton
	closetext
	end

CooltrainerKatsuoSeenText:
	text "Me maravilla como"
	line "las poses y la"
	cont "danzas #MON"
	cont "los potencian."
	done

CooltrainerKatsuoBeatenText:
	text "¡Guau, que"
	line "movimientos!"
	done

CooltrainerKatsuoAfterText:
	text "RUDY dice que"
	line "las danzas hacen"
	cont "a los #MON mas"
	cont "ágiles."
	done

CooltrainerSonScript:
	trainer EVENT_BEAT_COOLTRAINERM_SON, COOLTRAINERM, SON, CooltrainerSonSeenText, CooltrainerSonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerSonAfterText
	waitbutton
	closetext
	end

CooltrainerSonSeenText:
	text "¡Siento que soy"
	line "uno con el viento"
	cont "cuando danzo con"
	cont "mis #MON!"
	done

CooltrainerSonBeatenText:
	text "¡Estoy anonadado!"
	done

CooltrainerSonAfterText:
	text "¡Perturbas mi"
	line "pacífico día!"
	done

RudyText:
	text "Hola, ASPIRANTE."
	
	para "Soy RUDY del"
	line "ORANGE CREW, y me"
	cont "especializo en "
	cont "las habilidades"
	
	para "evasivas de los"
	line "#MON. ¡No podras"
	cont "alcanzarnos!"
	done
	
RudyWinLossText:
	text "¡Tus movimientos"
	line "son demasiado"
	cont "para mi!"
	done

BeatRudyText:
	text "<PLAYER> obtuvo"
	line "la MEDALLA CONCHA"
	cont "PUNTIAGUDA."
	done

RudyDoubleTeamText:
	text "Bien hecho."

	para "Con esta medalla"
	line "cualquier #MON"
	cont "de nivel 70 o"
	cont "mas te obedecera."

	para "Toma esto"
	line "tambien."
	done

RudyDoubleTeamExplanationText:
	text "Esta MT contiene"
	line "DOBLE EQUIPO. Usa-"
	cont "lo para evitar"
	cont "el peligro."
	
	para "¡Si no te puede"
	line "golpear, no te"
	cont "pueden ganar!"
	done

RudyAlreadyGotTMText:
	text "¡Hasta que nos"
	line "volvamos a ver!"
	done

TrovitaGymGuyText:
	text "Hola, Campeón"
	line "en ciernes."
	
	para "Mejor que seas"
	line "rapido si quieres"
	cont "derrotar a RUDY."
	cont "Usa DOUBLE EQUIPO"
	
	para "e incrementa la"
	line "evasión."
	done

TrovitaGymGuyWinText:
	text "¡Fue una gran"
	line "pelea!"
	
	para "¡Chico, solo te"
	line "queda una meda-"
	cont "lla."
	done
	
PiaCarrotText:
	text "PIA CARROT: Gracias"
	line "por jugar esta"
	cont "beta."
	
	para "No hay mucho"
	line "mas por hacer,"
	cont "pero aun puedes"
	cont "divertirte."
	done

TrovitaGym_MapEventHeader::

.Warps: db 2
	warp_def 13, 4, 2, TROVITA_ISLAND
	warp_def 13, 5, 2, TROVITA_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 7, SIGNPOST_READ, TrovitaGymStatue
	signpost 11, 2, SIGNPOST_READ, TrovitaGymStatue

.ObjectEvents: db 7
	person_event SPRITE_RUDY, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RudyScript, -1
	person_event SPRITE_GYM_GUY, 11, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitaGymGuyScript, -1
	person_event SPRITE_COOLTRAINER_F, 7, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerMorikoScript, -1
	person_event SPRITE_COOLTRAINER_F, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerAiriScript, -1
	person_event SPRITE_COOLTRAINER_M, 5, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerKatsuoScript, -1
	person_event SPRITE_COOLTRAINER_M, 7, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerSonScript, -1
