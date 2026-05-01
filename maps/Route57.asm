const_value = 1
	const ROUTE_57_ITEMBALL
	const ROUTE_57_SWIMMER_GIRL
	const ROUTE_57_SIGHTSEERF
	const ROUTE_57_BUGCATCHERF
	const ROUTE_57_FISHER

Route57_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route57SwimmerGirlScript:
	jumptextfaceplayer R57SwimmerGirlText

R57SwimmerGirlText:
	text "¿Qué? ¿Pensabas"
	line "que yo era"
	cont "entrenador?"

	para "¡A algunas"
	line "personas"
	cont "simplemente les"
	cont "gusta nadar!"
	done

TrainerSightSeerAsami:
	trainer EVENT_BEAT_SIGHTSEERF_ASAMI, SIGHTSEERF, ASAMI, SightSeerAsamiSeenText, SightSeerAsamiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightSeerAsamiAfterText
	waitbutton
	closetext
	end

SightSeerAsamiSeenText:
	text "¡Las ISLAS"
	line "NARANJAS son"
	cont "maravillosas!"

	para "Playas preciosas,"
	line "chicos guapos y,"
	cont "por supuesto,"
	cont "¡entrenadores"
	cont "débiles!"
	done

SightSeerAsamiBeatenText:
	text "¡Kyaa!"
	done

SightSeerAsamiAfterText:
	text "Supongo que"
	line "algunos de"
	cont "ustedes son"
	cont "fuertes después"
	cont "de todo."
	done

TrainerBugCatcherFAlia:
	trainer EVENT_BEAT_BUG_CATCHERF_ALIA, BUG_CATCHER_F, ALIA, BugCatcherFAliaSeenText, BugCatcherFAliaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BugCatcherFAliaAfterText
	waitbutton
	closetext
	end

BugCatcherFAliaSeenText:
	text "No veo a muchas"
	line "otras chicas a"
	cont "las que les"
	cont "guste los"
	cont "#MON de"
	cont "tipo BICHO."

	para "¿Es realmente"
	line "tan extraño?"
	done

BugCatcherFAliaBeatenText:
	text "¡Mis lindos BICHOS!"
	done

BugCatcherFAliaAfterText:
	text "Espero poder"
	line "conocer a muchos"
	cont "coleccionistas de"
	cont "tipo BICHO."
    done

TrainerFisherYuuta:
	trainer EVENT_BEAT_FISHER_YUUTA, FISHER, YUUTA, FisherYuutaSeenText, FisherYuutaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherYuutaAfterText
	waitbutton
	closetext
	end

FisherYuutaSeenText:
	text "¡La pesca de"
	line "altura te dará"
	cont "grandes capturas!"
	done

FisherYuutaBeatenText:
	text "¡Aniquilados!"
	done

FisherYuutaAfterText:
	text "Nada mal."

	para "Percibo en ti un"
	line "gran espíritu"
	cont "PESCADOR."
	done
	
Route57Sign:
	jumptext Route57SignText
	
Route57SignText:
	text "RUTA 57"
	line "al este de las"
	cont "7 ISLAS"
	cont "POMELO"
	done

Route57HardStone:
	itemball HARD_STONE

Route57_MapEventHeader::

.Warps: db 2
	warp_def 34, 4, 3, KINNOW_ISLAND_ROUTE_57_GATE
	warp_def 35, 4, 4, KINNOW_ISLAND_ROUTE_57_GATE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 21, 17, SIGNPOST_READ, Route57Sign

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 19, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route57HardStone, EVENT_ROUTE_57_HARD_STONE
	person_event SPRITE_SWIMMER_GUY, 30, 18, SPRITEMOVEDATA_SWIM_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route57SwimmerGirlScript, -1
	person_event SPRITE_SIGHTSEER_F, 33, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerSightSeerAsami, -1
	person_event SPRITE_SIGHTSEER_F, 21, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerBugCatcherFAlia, -1
	person_event SPRITE_FISHER,  7,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherYuuta, -1
