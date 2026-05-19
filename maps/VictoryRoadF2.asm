const_value = 1
	const VR_F2_CAMPER_1
	const VR_F2_CAMPER_2
	const VR_F2_CATMAN
	const VR_F2_FISHER
	const VR_F2_COOLTRAINER
	const VR_F2_YOUNGSTER
	const VR_F2_POKEBALL_1
	const VR_F2_POKEBALL_2
	const VR_F2_OFFICER

VictoryRoadF2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

;=================================
;=================================
		
TrainerCamperNeb:
	trainer EVENT_BEAT_CAMPER_NEB, CAMPER, NEB, CamperNebSeenText, CamperNebBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperNebAfterText
	waitbutton
	closetext
	end

CamperNebSeenText:
	text "Mi novio y yo"
	line "somos imparables."
	done

CamperNebBeatenText:
	text "¡Yikes!"
	done

CamperNebAfterText:
	text "¡No me lo creo!"
	done
	
;=================================
;=================================
		
TrainerCamperSnyd:
	trainer EVENT_BEAT_CAMPER_SNYD, CAMPER, SNYD, CamperSnydSeenText, CamperSnydBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperSnydAfterText
	waitbutton
	closetext
	end

CamperSnydSeenText:
	text "¿Podrías perder"
	line "por  mi?"
	done

CamperSnydBeatenText:
	text "¿Por qué?"
	done

CamperSnydAfterText:
	text "Estaba intentando"
	line "verme bien para"
	cont "NEB."
	done
	
;=================================
;=================================
		
TrainerFisherStephen:
	trainer EVENT_BEAT_FISHER_STEPHEN, FISHER, STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherStephenAfterText
	waitbutton
	closetext
	end

FisherStephenSeenText:
	text "Una buena arte-"
	line "sanía. Una buena"
	cont "pelea tampoco"
	cont "debe apresurarse."
	done

FisherStephenBeatenText:
	text "Estaba escrito."
	done

FisherStephenAfterText:
	text "Buena suerte."
	done
	
;=================================
;=================================
		
TrainerCatmanMayo:
	trainer EVENT_BEAT_CATMAN_MAYO, CATMAN, MAYO, CatmanMayoSeenText, CatmanMayoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CatmanMayoAfterText
	waitbutton
	closetext
	end

CatmanMayoSeenText:
	text "¡Hola, meow!"
	done

CatmanMayoBeatenText:
	text "¡Hiss!"
	done

CatmanMayoAfterText:
	text "Deje la villa"
	line "para encontrar un"
	cont "MEOWTH."
	
	para "Y me he perdido."
	done

;=================================
;=================================	
TrainerCooltrainerMMike:
	trainer EVENT_BEAT_COOLTRAINERM_MIKE, COOLTRAINERM, MICHAEL, CooltrainerMMikeSeenText, CooltrainerMMikeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMMikeAfterText
	waitbutton
	closetext
	end

CooltrainerMMikeSeenText:
	text "¿Te acabas de"
	line "acercar a mi?"
	
	para "¿No tienes nada"
	line "mejor que hacer?"
	done

CooltrainerMMikeBeatenText:
	text "Hmph."
	done

CooltrainerMMikeAfterText:
	text "¡Déjame solo!"
	done

;=================================
;=================================	
TrainerYoungsterEve:
	trainer EVENT_BEAT_YOUNGSTER_EVE, YOUNGSTER, EVE, YoungsterEveSeenText, YoungsterEveBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterEveAfterText
	waitbutton
	closetext
	end

YoungsterEveSeenText:
	text "¿Eres de ISLA"
	line "VALENCIA?"
	
	para "Me sorpende los"
	line "#MON que llevas."
	done

YoungsterEveBeatenText:
	text "¡Bien hecho!"
	done

YoungsterEveAfterText:
	text "Amo a mi VENU-"
	line "SAUR. A su"
	cont "vez yo soy la"
	cont "principal motiva-"
	
	para "ción de el."
	done
	
VictoryRoadF2Elixer:
	itemball ELIXER
	
VictoryRoadF2Everstone:
	itemball EVERSTONE
	
VictoryRoadF2HiddenTradeStone:
	dwb EVENT_VICTORY_ROAD_F2_HIDDEN_TRADE_STONE, TRADE_STONE

VictoryRoadF2OfficerScript:
	faceplayer
	opentext
	writetext VictoryRoadF2OfficerText
	waitbutton
	closetext
	end

VictoryRoadF2OfficerText:
	text "Es la CUEVA"
	line "NARANJA. Hay"
	cont "#MON fuertes y"
	cont "horribles que"
	cont "viven aqui."

	para "El CAMPEON de"
	line "la LIGA NARANJA"
	cont "es el único que"
	cont "se aloja ahí."
	done

VictoryRoadF2_MapEventHeader::

.Warps: db 6
	warp_def 33, 45, 4, ROUTE_69_SOUTH
	warp_def 27,  9, 5, ROUTE_69_SOUTH
	warp_def  7, 43, 6, ROUTE_69_SOUTH
	warp_def 17, 24, 4, VICTORY_ROAD_F1
	warp_def 19, 20, 5, VICTORY_ROAD_F1
	warp_def  1, 49, 2, VICTORY_ROAD_EAST


.CoordEvents: db 0

.BGEvents: db 1
	signpost 13, 44, SIGNPOST_ITEM, VictoryRoadF2HiddenTradeStone

.ObjectEvents: db 9
	person_event SPRITE_YOUNGSTER, 10, 10, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCamperNeb, -1
	person_event SPRITE_YOUNGSTER, 10,  7, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCamperSnyd, -1
	person_event SPRITE_CAT_MAN, 10, 47, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCatmanMayo, -1
	person_event SPRITE_FISHER, 18, 31, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherStephen, -1
	person_event SPRITE_COOLTRAINER_M, 29, 14, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 0, TrainerCooltrainerMMike, -1
	person_event SPRITE_YOUNGSTER,  6, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterEve, -1
	person_event SPRITE_POKE_BALL, 16, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF2Elixer, EVENT_VICTORY_ROAD_F2_ELIXER
	person_event SPRITE_POKE_BALL, 17,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF2Everstone, EVENT_VICTORY_ROAD_F2_EVERSTONE
	person_event SPRITE_OFFICER,  2, 49, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VictoryRoadF2OfficerScript, EVENT_BEAT_ORANGE_LEAGUE
