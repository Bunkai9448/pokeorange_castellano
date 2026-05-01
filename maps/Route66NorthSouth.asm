const_value = 1
	const ROUTE_66_NORTH_SOUTH_FRUIT_TREE
	const ROUTE_66_NORTH_SOUTH_ITEMBALL_MAX_POTION
	const ROUTE_66_NORTH_SOUTH_LASS_LOLA
	const ROUTE_66_NORTH_SOUTH_COOLTRAINERM_DAVID
	const ROUTE_66_NORTH_SOUTH_BIRDKEEPER_DWIGHT
	const ROUTE_66_NORTH_SOUTH_SIGHTSEERF_FLORA

Route66NorthSouth_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0
	
;=================================
;=================================
	
Route66FruitTree:
	fruittree FRUITTREE_ROUTE_66
	
;=================================
;=================================
	
Route66NorthSouthMaxPotion:
	itemball MAX_POTION
	
;=================================
;=================================
		
TrainerLassLola:
	trainer EVENT_BEAT_LASS_LOLA, LASS, LOLA, LassLolaSeenText, LassLolaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassLolaAfterText
	waitbutton
	closetext
	end

LassLolaSeenText:
	text "¡Luana nos dio"
	line "una paliza!"
	cont "¡Estamos buscan-"
	cont "do debiluchos"
	cont "para entrenar!"
	done

LassLolaBeatenText:
	text "Otra vez perdí..."
	done

LassLolaAfterText:
	text "Parecias un"
	line "matao<...>"
	done
	
;=================================
;=================================
	
TrainerCooltrainerMDavid:
	trainer EVENT_BEAT_COOLTRAINER_M_DAVID, COOLTRAINERM, DAVID, CooltrainerMDavidSeenText, CooltrainerMDavidBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMDavidAfterText
	waitbutton
	closetext
	end

CooltrainerMDavidSeenText:
	text "¡El ORANGE crew!"
	
	para "Muestrame si"
	line "estas preparado"
	cont "para desafiarlos."
	done

CooltrainerMDavidBeatenText:
	text "¡Prueba superada!"
	done

CooltrainerMDavidAfterText:
	text "¡Prueba superada!"
	done
	
;=================================
;=================================
		
TrainerBirdkeeperDwight:
	trainer EVENT_BEAT_BIRDKEEPER_DWIGHT, BIRDKEEPER, DWIGHT, BirdkeeperDwightSeenText, BirdkeeperDwightBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdkeeperDwightAfterText
	waitbutton
	closetext
	end

BirdkeeperDwightSeenText:
	text "Un pájaro en una"
	line "jaula."
	done

BirdkeeperDwightBeatenText:
	text "Eso<...>"
	done

BirdkeeperDwightAfterText:
	text "Eso<...>"
	
	para "No pudo despe-"
	line "gar sus alas..."
	done
	
;=================================
;=================================
		
TrainerSightseerFFlora:
	trainer EVENT_BEAT_SIGHTSEERF_FLORA, SIGHTSEERF, FLORA, SightseerFFloraSeenText, SightseerFFloraBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerFFloraAfterText
	waitbutton
	closetext
	end

SightseerFFloraSeenText:
	text "¡Vas a ver!"
	
	para "Soy un entrena-"
	line "dor fortísimo."
	cont "¡Tengo 6 medallas!"
	done

SightseerFFloraBeatenText:
	text "No puede ser..."
	done

SightseerFFloraAfterText:
	text "Bueno, solo tengo"
	line "una MEDALLA de"
	cont "las ISLAS"
	cont "NARANJA<...>"
	done

Route66NorthSouth_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_FRUIT_TREE, 29,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route66FruitTree, -1
	person_event SPRITE_POKE_BALL, 33, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route66NorthSouthMaxPotion, EVENT_ROUTE_66_NORTH_SOUTH_MAX_POTION
	person_event SPRITE_LASS, 10, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassLola, -1
	person_event SPRITE_COOLTRAINER_M, 10,  6, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainerMDavid, -1
	person_event SPRITE_COOLTRAINER_M, 12,  9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBirdkeeperDwight, -1
	person_event SPRITE_SIGHTSEER_F, 13, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSightseerFFlora, -1

