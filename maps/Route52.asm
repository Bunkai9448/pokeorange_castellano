const_value = 1
	const ROUTE52_FISHER1
	const ROUTE52_FISHER2
	const ROUTE52_FISHER3
	const ROUTE52_YOUNGSTER1
	const ROUTE52_YOUNGSTER2
	const ROUTE52_YOUNGSTER3
	const ROUTE52_LASS1
	const ROUTE52_YOUNGSTER4
	const ROUTE52_POKE_BALL1
	const ROUTE52_FISHER5
	const ROUTE52_POKE_BALL2
	const ROUTE52_THUNDERPUNCH_TUTOR

Route52_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrainerCamperSamm:
	trainer EVENT_BEAT_CAMPER_SAMM, CAMPER, SAMM, CamperSammSeenText, CamperSammBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperSammAfterText
	waitbutton
	closetext
	end

TrainerFisherSojiro:
	trainer EVENT_BEAT_FISHER_SOJIRO, FISHER, SOJIRO, FisherSojiroSeenText, FisherSojiroBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherSojiroAfterText
	waitbutton
	closetext
	end

TrainerFisherFugu:
	trainer EVENT_BEAT_FISHER_FUGU, FISHER, FUGU, FisherFuguSeenText, FisherFuguBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherFuguAfterText
	waitbutton
	closetext
	end


TrainerFisherNobu:
	trainer EVENT_BEAT_FISHER_NOBU, FISHER, NOBU, FisherNobuSeenText, FisherNobuBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherNobuAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfYuka:
	trainer EVENT_BEAT_SWIMMERF_YUKA, SWIMMERF, YUKA, SwimmerfYukaSeenText, SwimmerfYukaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerfYukaAfterText
	waitbutton
	closetext
	end

TrainerSwimmermTheo:
	trainer EVENT_BEAT_SWIMMERM_THEO, SWIMMERM, THEO, SwimmermTheoSeenText, SwimmermTheoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermTheoAfterText
	waitbutton
	closetext
	end

TrainerYoungsterKouta:
	trainer EVENT_BEAT_YOUNGSTER_KOUTA, YOUNGSTER, KOUTA, YoungsterKoutaSeenText, YoungsterKoutaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterKoutaAfterText
	waitbutton
	closetext
	end

TrainerSwimmermAtecain:
	trainer EVENT_BEAT_SWIMMERM_ATECAIN, SWIMMERM, ATECAIN, SwimmermAtecainSeenText, SwimmermAtecainBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermAtecainAfterText
	waitbutton
	closetext
	end

Route52GreatBall:
	itemball GREAT_BALL

Route52Repel:
	itemball REPEL

Route52Sign:
	jumptext Route52SignText

Route52HiddenGreatBall:
	dwb EVENT_ROUTE_52_HIDDEN_GREAT_BALL, GREAT_BALL

Route52HiddenSuperPotion:
	dwb EVENT_ROUTE_52_HIDDEN_SUPER_POTION, SUPER_POTION

FisherSojiroSeenText:
	text "Estoy buscando"
	line "un pez que "
	cont "atrapar. "
	cont "¡Parece que te"
	cont "he atrapado!"
	done

FisherSojiroBeatenText:
	text "¡Viva la pesca!"
	done

FisherSojiroAfterText:
	text "Calma,<...>"
	line "La esencia de la"

	para "pesca y los #-"
	line "MON es la misma."
	done

FisherFuguSeenText:
	text "Los #MON "
	line "pescados molan"
	cont "mucho mas que "
	cont "los de tierra."

	para "¡Te lo mostraré!"
	done

FisherFuguBeatenText:
	text "Maldicion. Debería"
	line "haber usado"
	cont "mi as<...>"
	done

FisherFuguAfterText:
	text "¡Eres bueno, chico!"
	done

FisherNobuSeenText:
	text "¿Mi #MON?"
	line "¡Recién atrapado!"
	done

FisherNobuBeatenText:
	text "El  SUSHI esta"
	line "buenísimo<...>"
	done

FisherNobuAfterText:
	text "El sabor de los"
	line "#MON frescos"
	cont "es excelso."
	done

SwimmermTheoSeenText:
	text "Tio, me muero de"
	line "hambre. Me co-"
	cont "mería un donut"
	cont "de medusa."
	done

SwimmermTheoBeatenText:
	text "¿O era una bola"
	line "de arroz?"
	done

SwimmermTheoAfterText:
	text "Mmm<...> DONUTS<...>"
	done

YoungsterKoutaSeenText:
	text "Hay algunos"
	line "#MON raros en"
	cont "esta hierba."
	done

YoungsterKoutaBeatenText:
	text "¡Pero mi #MON"
	line "es raro!"
	done

YoungsterKoutaAfterText:
	text "TANGELA todavía"
	line "es um muy buen"
	cont "#MON."
	done

CamperSammSeenText:
	text "¿Quieres el item?"
	line "Tendrás que"
	cont "derrotarme antes."
	done

CamperSammBeatenText:
	text "Ugh. Tómalo."
	done

CamperSammAfterText:
	text "No es muy buen"
	line "objeto."
	done

SwimmerfYukaSeenText:
	text "CISSY es una"
	line "entrenadora de"
	cont "tipo agua. Si"
	cont "no puedes ba-"
	cont "tirme, no"
	cont "tendrás ningu-"
	cont "na opción."
	done

SwimmerfYukaBeatenText:
	text "¡Ooh, vas a"
	line "tener opciones!"
	done

SwimmerfYukaAfterText:
	text "¡Buena suerte!"
	done

SwimmermAtecainSeenText:
	text "Buceo buscando"
	line "rubies para"
	cont "crear THONSUS."

	para "Es una nueva"
	line "invención para"
	cont "imbuir de poder"
	cont "místico una"
	cont "flauta."
	done

SwimmermAtecainBeatenText:
	text "No me digas que"
	line "no tienes dinero."
	done

SwimmermAtecainAfterText:
	text "Paro ya, que se"
	line "esta nublando."
	done

Route52SignText:
	text "RUTA 52"

	para "TANGELO-"
	line "MIKAN"
	done
	
Route52ThunderpunchTutor:
	faceplayer
	opentext
	writetext GivePlayerThunderpunchText
	yesorno
	iffalse .TutorRefused
	writebyte THUNDERPUNCH
	writetext Text_ThunderpunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_ThunderpunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_ThunderpunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerThunderpunchText:
	text "¿Ya estas cansado"
	line "del agua?"
	
	para "Ja. Has venido al"
	line "sitio correcto."
	cont "¿Quieres que en-"
	cont "señe a tu #MON"
	
	para "PUÑO TRUENO?"
	done
	
Text_ThunderpunchTutorTaught:
	text "PUÑO TRUENO es"
	line "un ataque elec-"
	cont "trico que a veces"
	cont "puede paralizar."
	done
	
Text_ThunderpunchTutorRefused:
	text "Mejor toma el"
	line "camino prin-"
	cont "cipal."
	done
	
Text_ThunderpunchTutorClear:
	text ""
	done

Route52_MapEventHeader::

.Warps: db 3
	warp_def 69, 13, 1, ROUTE_52_POKECENTER_1F
	warp_def 75, 7, 1, ROUTE_52_TANGELO_JUNGLE_GATE
	warp_def 75, 8, 2, ROUTE_52_TANGELO_JUNGLE_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 72, 8, SIGNPOST_READ, Route52Sign
	signpost 73, 4, SIGNPOST_ITEM, Route52HiddenGreatBall
	signpost 41, 16, SIGNPOST_ITEM, Route52HiddenSuperPotion

.ObjectEvents: db 11
	person_event SPRITE_FISHER, 33, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherSojiro, -1
	person_event SPRITE_FISHER, 22, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherFugu, -1
	person_event SPRITE_FISHER, 29, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherNobu, -1
	person_event SPRITE_SWIMMER_GUY, 8, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermTheo, -1
	person_event SPRITE_YOUNGSTER, 48, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterKouta, -1
	person_event SPRITE_YOUNGSTER, 8, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerCamperSamm, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSwimmerfYuka, -1
	person_event SPRITE_SWIMMER_GUY, 35, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmermAtecain, -1
	person_event SPRITE_POKE_BALL, 6, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52GreatBall, EVENT_ROUTE_52_GREAT_BALL
	person_event SPRITE_POKE_BALL, 50, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52Repel, EVENT_ROUTE_52_REPEL
	person_event SPRITE_BLACK_BELT, 62, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route52ThunderpunchTutor, -1
