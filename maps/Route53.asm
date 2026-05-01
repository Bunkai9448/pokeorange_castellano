const_value = 1
	const ROUTE53_POKEFAN_M
	const ROUTE53_LASS
	const ROUTE53_FRUIT_TREE
	const ROUTE53_SWIMMER1
	const ROUTE53_SWIMMER2

Route53_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route53LassScript:
	jumptextfaceplayer Route53LassText

TrainerFisherNatPagle:
	trainer EVENT_BEAT_FISHER_NAT_PAGLE, FISHER, NAT_PAGLE, FisherNatPagleSeenText, FisherNatPagleBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherNatPagleAfterText
	waitbutton
	closetext
	end

TrainerSwimmermKojuro:
	trainer EVENT_BEAT_SWIMMERM_KOJURO, SWIMMERM, KOJURO, SwimmermKojuroSeenText, SwimmermKojuroBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermKojuroAfterText
	waitbutton
	closetext
	end

TrainerSwimmermYouta:
	trainer EVENT_BEAT_SWIMMERM_YOUTA, SWIMMERM, YOUTA, SwimmermYoutaSeenText, SwimmermYoutaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermYoutaAfterText
	waitbutton
	closetext
	end

Route53Sign:
	jumptext Route53SignText

Route53Tips:
	jumptext Route53TrainerTipsText

Route53FruitTreeScript:
	fruittree FRUITTREE_ROUTE_53

FisherNatPagleSeenText:
	text "Si me preguntas,"
	line "la mejor parte"
	cont "de la pesca, es"
	cont "la tranquilidad"
	cont "y la paz."

	para "Me da tiempo"
	line "para pensar en"
	cont "eventos pasados"
	cont "para planear el"
	cont "futuro."
	done

FisherNatPagleBeatenText:
	text "Me gustaría una"
	line "buena pesca<...>"
	done

FisherNatPagleAfterText:
	text "No te digo que"
	line "tengas que estar"
	cont "pescando 30 años"
	cont "atrapando cada"

	para "pez en el mar"
	line "para convertirte"
	cont "en un maestro"
	cont "pescador."

	para "Reconozco tu"
	line "determinación"
	cont "para echarle"
	cont "horas suficientes."
	done

SwimmermKojuroSeenText:
	text "¿Venciste a "
	line "CISSY?"
	cont "¡Dejame ver de"
	cont "que estas hecho!"
	done

SwimmermKojuroBeatenText:
	text "Frito como un"
	line "pez..."
	done

SwimmermKojuroAfterText:
	text "¡Eres pura"
	line "pasión, chico!"
	done

SwimmermYoutaSeenText:
	text "Un chico vino"
	line "con un MARILL. "

	para "Me ganó, voy"
	line "a pagar mi"
	cont "frustración"
	cont "contigo."
	done

SwimmermYoutaBeatenText:
	text "¡Yaaaah! Estoy"
	line "ido."
	done

SwimmermYoutaAfterText:
	text "¡Dos derrotas"
	line "en un día!"
	done

Route53LassText:
	text "Ey."

	para "Una vez acabes"
	line "esta ruta,"
	cont "habra dos"
	cont "caminos."

	para "El Norte va a"
	line "MANDARINA NORTE,"
	cont "el sur a ISLA"
	cont "SUNBURST."
	done

Route53SignText:
	text "RUTA 53"
	done

Route53TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Ten cuidado con"
	line "los ladroes."

	para "¡Querran robar tus"
	line "#MON!"
	done

Route53_MapEventHeader::

.Warps: db 2
	warp_def 8, 4, 3, MIKAN_ISLAND_ROUTE_53_GATE
	warp_def 9, 4, 4, MIKAN_ISLAND_ROUTE_53_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 10, 8, SIGNPOST_READ, Route53Sign
	signpost 9, 41, SIGNPOST_READ, Route53Tips

.ObjectEvents: db 5
	person_event SPRITE_FISHER, 11, 40, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherNatPagle, -1
	person_event SPRITE_LASS, 6, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route53LassScript, -1
	person_event SPRITE_FRUIT_TREE, 5, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route53FruitTreeScript, -1
	person_event SPRITE_SWIMMER_GUY, 10, 20, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermKojuro, -1
	person_event SPRITE_SWIMMER_GUY, 9, 50, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermYouta, -1
