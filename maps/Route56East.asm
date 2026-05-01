const_value = 1
	const ROUTE_56_ROCK1
	const ROUTE_56_ROCK2
	const ROUTE_56_ROCK3
	const ROUTE_56_SIGHTSEER_MICHIO
	const ROUTE_56_SWIMMERF_YAEKO
	const ROUTE_56_HIKER_TEPPEI
	const ROUTE_56_ITEMBALL3
	const ROUTE_56_MACH_PUNCH_TUTOR

Route56East_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrainerSightSeerMichio:
	trainer EVENT_BEAT_SIGHTSEERM_MICHIO, SIGHTSEERM, MICHIO, SightSeerMichioSeenText, SightSeerMichioBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightSeerMichioAfterText
	waitbutton
	closetext
	end

SightSeerMichioSeenText:
	text "Estoy totalmente"
	line "perdido! ¿Sabes"
	cont "cómo llegar a la"
	cont "ISLA KINNOW?"
	done

SightSeerMichioBeatenText:
	text "¡Ahora lo recuerdo!"
	done

SightSeerMichioAfterText:
	text "¡Así es!"
	line "¡Está al norte"
	cont "de aquí!"
	done

TrainerSwimmerYaeko:
	trainer EVENT_BEAT_SWIMMERF_YAEKO, SWIMMERF, YAEKO, SwimmerYaekoSeenText, SwimmerYaekoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerYaekoAfterText
	waitbutton
	closetext
	end

SwimmerYaekoSeenText:
	text "¿Estás preparado"
	line "para la mayor"
	cont "sorpresa de tu vida?"
	done

SwimmerYaekoBeatenText:
	text "¡Chocante!"
	done

SwimmerYaekoAfterText:
	text "STUNFISK vive en"
	line "el agua, pero es"
	cont "de tipo TIERRA y"
	cont "ELÉCTRICO."
	done

TrainerHikerTeppei:
	trainer EVENT_BEAT_HIKER_TEPPEI, HIKER, TEPPEI, HikerTeppeiSeenText, HikerTeppeiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext HikerTeppeiAfterText
	waitbutton
	closetext
	end

HikerTeppeiSeenText:
	text "¿Hacer senderismo"
	line "en el mar?"

	para "¡No hay problema!"
	line "¡Mira lo que"
	cont "encontré dando"
	cont "vueltas por aquí!"
	done

HikerTeppeiBeatenText:
	text "¿Qué tan genial"
	line "es eso?"
	done

HikerTeppeiAfterText:
	text "Me pregunto qué"
	line "más puede habitar"
	cont "en esta cueva."
	done

Route56EastTMDragonbreath:
	itemball TM_DRAGONBREATH

Route56Rock:
	jumpstd smashrock
	
Route56EastHiddenHyperPotion:
	dwb EVENT_ROUTE_56_EAST_HIDDEN_HYPER_POTION, HYPER_POTION
	
Route56MachPunchTutor:
	faceplayer
	opentext
	writetext GivePlayerMachPunchText
	yesorno
	iffalse .TutorRefused
	writebyte MACH_PUNCH
	writetext Text_MachPunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_MachPunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_MachPunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerMachPunchText:
	text "Wajajaja!"
	
	para "¡Pareces muy"
	line "ágil, amigo"
	cont "mío!"
	
	para "¡Si quieres,"
	line "puedo enseñarle a"
	cont "tu #MON el"
	cont "movimiento"
	cont "ULTRAPUÑO!"
	
	para "¿Quieres aprender"
	line "ULTRAPUÑO?"
	done
	
Text_MachPunchTutorTaught:
	text "¡ULTRAPUÑO es muy"
	line "rápido! Suele"
	cont "atacar primero."
	done
	
Text_MachPunchTutorRefused:
	text "¡Muy bien!"
	done
	
Text_MachPunchTutorClear:
	text ""
	done

Route56East_MapEventHeader::

.Warps: db 1
	warp_def 21, 12, 1, FUKUHARA_NO_4_BF1

.CoordEvents: db 0

.BGEvents: db 1
	signpost 7, 39, SIGNPOST_ITEM, Route56EastHiddenHyperPotion

.ObjectEvents: db 8
	person_event SPRITE_ROCK, 22, 13, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56Rock, -1
	person_event SPRITE_ROCK, 22, 11, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56Rock, -1
	person_event SPRITE_ROCK, 23, 12, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56Rock, -1
	person_event SPRITE_COOLTRAINER_M, 10, 43, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightSeerMichio, -1
	person_event SPRITE_SWIMMER_GIRL, 19, 46, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerYaeko, -1
	person_event SPRITE_POKEFAN_M, 24, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 1, TrainerHikerTeppei, -1
	person_event SPRITE_POKE_BALL, 13, 44, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route56EastTMDragonbreath, EVENT_ROUTE_56_EAST_TM_DRAGONBREATH
	person_event SPRITE_POKEFAN_M, 6, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 1, Route56MachPunchTutor, -1
