const_value = 1
	const ROUTE50_YOUNGSTER1
	const ROUTE50_YOUNGSTER2
	const ROUTE50_BUG_CATCHER
	const ROUTE50_FRUIT_TREE1
	const ROUTE50_FRUIT_TREE2
	const ROUTE50_COOLTRAINER_F
	const ROUTE50_POKE_BALL

Route50_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrainerYoungsterJoey:
	trainer EVENT_BEAT_YOUNGSTER_KOJI, YOUNGSTER, KOJI, YoungsterKojiSeenText, YoungsterKojiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterKojiAfterText
	waitbutton
	closetext
	end

TrainerYoungsterTouya:
	trainer EVENT_BEAT_YOUNGSTER_TOUYA, YOUNGSTER, TOUYA, YoungsterTouyaSeenText, YoungsterTouyaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterTouyaAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherKatta:
	trainer EVENT_BEAT_BUG_CATCHER_KATTA, BUG_CATCHER, KATTA, Bug_catcherKattaSeenText, Bug_catcherKattaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bug_catcherKattaAfterText
	waitbutton
	closetext
	end

Route50CooltrainerFScript:
	jumptextfaceplayer Route50CooltrainerFText

Route50Sign:
	jumptext Route50SignText

Route50TrainerTips:
	jumptext Route50TrainerTipsText

Route50Antidote:
	itemball ANTIDOTE

Route50FruitTree1:
	fruittree FRUITTREE_ROUTE_50_1

Route50FruitTree2:
	fruittree FRUITTREE_ROUTE_50_2

Route50HiddenPotion:
	dwb EVENT_ROUTE_50_HIDDEN_POTION, POTION

YoungsterKojiSeenText:
	text "Ey, ¿estás con"
	line "el desafío del"
	cont "ORANGE CREW?"

	para "¡Un novato como"
	line "tu no tiene opción"
	cont "de completarlo!"
	done

YoungsterKojiBeatenText:
	text "¿Soy mas débil?"
	done

YoungsterKojiAfterText:
	text "¡Maldición!"
	line "Tendre que entre-"
	cont "nar mas para"
	cont "tener opciones."
	done

YoungsterTouyaSeenText:
	text "¿Eres entrenador"
	line "#MON?"

	para "¡No tienes"
	line "pinta!"
	done

YoungsterTouyaBeatenText:
	text "¡Eres muy muy"
	line "fuerte!"
	done

YoungsterTouyaAfterText:
	text "Convertirse en"
	line "un buen entre-"
	cont "nador no es fácil."
	done

Bug_catcherKattaSeenText:
	text "¡Mas plegarias por"
	line "mis #MON bicho!"
	done

Bug_catcherKattaBeatenText:
	text "¡Aiyaa!"
	done

Bug_catcherKattaAfterText:
	text "En vez de eso,"
	line "rezaré por los"
	cont "tuyos."
	done

Route50CooltrainerFText:
	text "Puedes cruzar"
	line "RUTA 51 para"
	cont "entrar a JUNGLA"
	cont "TANGELO."
	done

Route50SignText:
	text "RUTA 50"
	done

Route50TrainerTipsText:
	text "TRAINER TIPS"

	para "¡No robar #MON "
	line "de otra gente!"

	para "¡Las # BALLS"
	line "solo se tiran a"
	cont "#MON salvajes!"
	done

Route50_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 3
	signpost 47, 3, SIGNPOST_READ, Route50Sign
	signpost 28, 12, SIGNPOST_READ, Route50TrainerTips
	signpost 2, 6, SIGNPOST_ITEM, Route50HiddenPotion

.ObjectEvents: db 7
	person_event SPRITE_YOUNGSTER, 29, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterJoey, -1
	person_event SPRITE_YOUNGSTER, 15, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterTouya, -1
	person_event SPRITE_BUG_BOY, 11, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherKatta, -1
	person_event SPRITE_FRUIT_TREE, 10, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route50FruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 33, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route50FruitTree2, -1
	person_event SPRITE_COOLTRAINER_F, 38, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route50CooltrainerFScript, -1
	person_event SPRITE_POKE_BALL, 11, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route50Antidote, EVENT_ROUTE_50_ANTIDOTE

