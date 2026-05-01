const_value = 1
	const ROUTE58_SALESMAN

Route58_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route58SalesmanScript:
	opentext
	writetext LastMinuteSuppliesText
	yesorno
	iftrue .SellStuff
	closetext
	end

.SellStuff:
	pokemart MARTTYPE_STANDARD, MART_ROUTE_58
	closetext
	end

LastMinuteSuppliesText:
	text "¿Necesitas algo"
	line "de última hora"
	cont "para ISLA NAVEL?"
	done

CooltrainerMAkira:
	trainer EVENT_BEAT_COOLTRAINERM_AKIRA, COOLTRAINERM, AKIRA, CooltrainerAkiraSeenText, CooltrainerAkiraBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerAkiraAfterText
	waitbutton
	closetext
	end

CooltrainerAkiraSeenText:
	text "ISLA NAVEL es"
	line "un gran volcán"
	cont "dormido."

	para "Es una cueva"
	line "peligrosa con"
	cont "con muchos"
	cont "#MON de hielo."
	done

CooltrainerAkiraBeatenText:
	text "¡Ey,eres guay!"
	done

CooltrainerAkiraAfterText:
	text "Despues de cientos"
	line "de años, el pico"
	cont "de la Isla se"
	cont "ha congelado y se"
	cont "puede esquiar."
	done

Route58Sign:
	jumptext Route58SignText

Route58SignText:
	text "RUTA 58"
	line "Al este NAVEL"
	cont "Sur para las"
	cont "7 ISLAS POMELO."
	done

Route58_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 12, 16, SIGNPOST_READ, Route58Sign

.ObjectEvents: db 2
	person_event SPRITE_FISHER,  6, 17, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route58SalesmanScript, -1
	person_event SPRITE_COOLTRAINER_M, 14, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, CooltrainerMAkira, -1
