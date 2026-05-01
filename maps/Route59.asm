const_value = 1
	const ROUTE59_SWIMMERM_KAZUMA
	const ROUTE59_LIGHTBALL

Route59_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route59Sign:
	jumptext Route59SignText

Route59SignText:
	text "RUTA 59"

	para "SUR para ISLA"
	line "MORO."
	done

TrainerSwimmermKazuma:
	trainer EVENT_BEAT_SWIMMERM_KAZUMA, SWIMMERM, KAZUMA, SwimmermKazumaSeenText, SwimmermKazumaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermKazumaAfterText
	waitbutton
	closetext
	end

SwimmermKazumaSeenText:
	text "¡No solo los"
	line "tipo agua "
	cont "pueden nadar!"
	done

SwimmermKazumaBeatenText:
	text "¡Bien hecho!"
	done

SwimmermKazumaAfterText:
	text "#MON como"
	line "RHYDON y"
	cont "SNORLAX pueden"
	cont "aprender SURF."
	done

Route59LightBall:
	itemball LIGHT_BALL

Route59_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 19, 7, SIGNPOST_READ, Route59Sign

.ObjectEvents: db 2
	person_event SPRITE_SWIMMER_GUY, 12, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermKazuma, -1
	person_event SPRITE_POKE_BALL, 24, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route59LightBall, EVENT_ROUTE_53_LIGHT_BALL
