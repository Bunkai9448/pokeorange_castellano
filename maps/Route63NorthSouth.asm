const_value = 1
	const ROUTE_63_NORTH_SOUTH_ITEMBALL_NUGGET
	const ROUTE_63_NORTH_SOUTH_FISHER_YAMATO
	const ROUTE_63_NORTH_SOUTH_COOLTRAINERM_YUUJI
	const ROUTE_63_NORTH_SOUTH_COOLTRAINERF_REIKA
	const ROUTE_63_NORTH_SOUTH_SIGHTSEER_F_ARASHI
	const ROUTE_63_NORTH_SOUTH_SIGHTSEER_M_HYOU
	const ROUTE_63_NORTH_SOUTH_OTAKU_NIRO
	const ROUTE_63_NORTH_SOUTH_OTAKU_GODO
	const ROUTE_63_NORTH_SOUTH_COOLTRAINERM_SEI
	const ROUTE_63_NORTH_SOUTH_ITEMBALL_LEAF_STONE	

Route63NorthSouth_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrainerOtakuNiro:
	trainer EVENT_BEAT_OTAKU_NIRO, OTAKU, NIRO, OtakuNiroSeenText, OtakuNiroBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuNiroAfterText
	waitbutton
	closetext
	end

OtakuNiroSeenText:
	text "¡Guau! Mi colección"
	line "perfecta de"
	cont "#MON te enseñará"
	cont "cómo se hace."
	done

OtakuNiroBeatenText:
	text "¡Ah! ¡No!"
	done

OtakuNiroAfterText:
	text "¿Me preguntas si"
	line "siempre hablo con"
	cont "voz nasal?"
	cont "¡Qué grosero!"
	done

TrainerFisherYamato:
	trainer EVENT_BEAT_FISHER_YAMATO, FISHER, YAMATO, FisherYamatoSeenText, FisherYamatoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherYamatoAfterText
	waitbutton
	closetext
	end

FisherYamatoSeenText:
	text "Si me ganas"
	line "te contaré un"
	cont "buen secreto."
	done

FisherYamatoBeatenText:
	text "Bien hecho."
	done

FisherYamatoAfterText:
	text "Hay una isla al"
	line "oeste de aquí. Es"
	cont "el único lugar"
	cont "donde puedes "
	cont "pescar MAGIKARP."
	
	para "Bueno, al menos"
	line "en esta época del"
	cont "del año."
	done

TrainerOtakuGodo:
	trainer EVENT_BEAT_OTAKU_GODO, OTAKU, GODO, OtakuGodoSeenText, OtakuGodoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuGodoAfterText
	waitbutton
	closetext
	end

OtakuGodoSeenText:
	text "¡Si gano,"
	line "tienes que ver mi"
	cont "colección KATANAS!"
	done

OtakuGodoBeatenText:
	text "¡Waaaah!"
	done

OtakuGodoAfterText:
	text "Mi KATANA puede"
	line "cortar acero duro"
	cont "porque ha sido"
	cont "doblada 1000"
	cont "veces."
	done

TrainerCooltrainerFReika:
	trainer EVENT_BEAT_COOLTRAINERF_REIKA, COOLTRAINERF, REIKA, CooltrainerFReikaSeenText, CooltrainerFReikaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerFReikaAfterText
	waitbutton
	closetext
	end

CooltrainerFReikaSeenText:
	text "¡Entreno todos los"
	line "días para obtener"
	cont "los mejores"
	cont "resultados!"
	done

CooltrainerFReikaBeatenText:
	text "Vaya, ¡debes estar"
	line "entrenando mucho!"
	done

CooltrainerFReikaAfterText:
	text "¡Tu #MON"
	line "necesita estar en"
	cont "plena forma para"
	cont "tener éxito!"
	done
	
TrainerCooltrainerMYuuji:
	trainer EVENT_BEAT_COOLTRAINERM_YUUJI, COOLTRAINERM, YUUJI, CooltrainerMYuujiSeenText, CooltrainerMYuujiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMYuujiAfterText
	waitbutton
	closetext
	end

CooltrainerMYuujiSeenText:
	text "¡Nuestro líder"
	line "creó este grupo"
	cont "para que pudiéramos"
	cont "entrenar para el"
	cont "ORANGE CREW!"
	done

CooltrainerMYuujiBeatenText:
	text "¿Cuántas insignias"
	line "podrías tener?"
	done

CooltrainerMYuujiAfterText:
	text "Ya te contaré."
	line "¡LUANA es una"
	cont "miembro muy"
	cont "fuerte del"
	cont "ORANGE CREW!"
	done

TrainerSightseerFArashi:
	trainer EVENT_BEAT_SIGHTSEERF_ARASHI, SIGHTSEERF, ARASHI, SightseerFArashiSeenText, SightseerFArashiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerFArashiAfterText
	waitbutton
	closetext
	end

SightseerFArashiSeenText:
	text "¡Oh, oh, oh!"
	
	para "¡Mis queridos"
	line "te vencerán en"
	cont "un instante!"
	done

SightseerFArashiBeatenText:
	text "¡Kyaa!"
	done

SightseerFArashiAfterText:
	text "¡Golpeaste a mis"
	line "pequeños"
	cont "queridos!"
	done

TrainerSightseerMHyou:
	trainer EVENT_BEAT_SIGHTSEERM_HYOU, SIGHTSEERM, HYOU, SightseerMHyouSeenText, SightseerMHyouBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerMHyouAfterText
	waitbutton
	closetext
	end

SightseerMHyouSeenText:
	text "¡En el lugar de"
	line "donde yo vengo,"
	cont "la mayoría de los"
	cont "#MON que hay"
	cont "aquí no se pueden"
	cont "encontrar!"
	done

SightseerMHyouBeatenText:
	text "¡Esos son unos"
	line "#MON"
	cont "geniales!"
	done

SightseerMHyouAfterText:
	text "En mi casa, en la"
	line "región de SINNOH,"
	cont "¡hace mucho frío!"
	done

Route63GauntletSign:
	jumptext Route63GauntletSignText
	
Route63GauntletSignText:
	text "EQUIPO DE"
	line "ENTRENADORES DE"
	cont "ASCORBIA"
	
	para "¡Pon a prueba tu"
	line "poder para ganar"
	cont "un gran premio!"
	done
	
Route63NorthSouthNugget:
	itemball NUGGET
	
Route63NorthSouthLeafStone:
	itemball LEAF_STONE
	
Route63GauntletEventScript:
	spriteface PLAYER, RIGHT
	opentext
	writetext CompletedGauntletText1
	waitbutton
	verbosegiveitem TM_WHIRLPOOL
	closetext
	domaptrigger ROUTE_63_NORTH_SOUTH, $1
	end
	
CompletedGauntletText1:
	text "¡Vaya, gran"
	line "trabajo!"
	
	para "¡Le ganaste a"
	line "todos los"
	cont "entrenadores!"
	cont "¡Aquí está tu"
	cont "gran premio!"
	done
	
CooltrainerRoute63Script:
	jumptextfaceplayer CooltrainerRoute63ScriptText
	
CooltrainerRoute63ScriptText:
	text "¡Seguro que"
	line "eres un chico"
	cont "duro!"
	done

Route63NorthSouth_MapEventHeader::

.Warps: db 1
	warp_def 5, 11, 3, ASCORBIA_ISLAND_ROUTE_63_GATE

.CoordEvents: db 1
	xy_trigger 0, 25, 13, Route63GauntletEventScript

.BGEvents: db 1
	signpost 42, 12, SIGNPOST_READ, Route63GauntletSign

.ObjectEvents: db 10
	person_event SPRITE_POKE_BALL, 25, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route63NorthSouthNugget, EVENT_ROUTE_63_NORTH_SOUTH_NUGGET
	person_event SPRITE_FISHER, 17, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherYamato, -1
	person_event SPRITE_COOLTRAINER_M, 36, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainerMYuuji, -1
	person_event SPRITE_COOLTRAINER_F, 28, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerCooltrainerFReika, -1
	person_event SPRITE_SIGHTSEER_F, 32, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSightseerFArashi, -1
	person_event SPRITE_COOLTRAINER_M, 36, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerSightseerMHyou, -1
	person_event SPRITE_FISHER, 28, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, TrainerOtakuNiro, -1
	person_event SPRITE_FISHER, 32, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, TrainerOtakuGodo, -1
	person_event SPRITE_COOLTRAINER_M, 25, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerRoute63Script, -1
	person_event SPRITE_POKE_BALL, 60, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route63NorthSouthLeafStone, EVENT_ROUTE_63_NORTH_SOUTH_LEAF_STONE
