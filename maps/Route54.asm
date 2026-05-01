const_value = 1
	const ROUTE54_SWIMMERM1
	const ROUTE54_SWIMMERM2
	const ROUTE54_SWIMMERM3
	const ROUTE54_SWIMMERF1
	const ROUTE54_SWIMMERF2

Route54_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrainerSwimmermHairo:
	trainer EVENT_BEAT_SWIMMERM_HAIRO, SWIMMERM, HAIRO, SwimmermHairoSeenText, SwimmermHairoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermHairoAfterText
	waitbutton
	closetext
	end

TrainerSwimmermDaisuke:
	trainer EVENT_BEAT_SWIMMERM_DAISUKE, SWIMMERM, DAISUKE, SwimmermDaisukeSeenText, SwimmermDaisukeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermDaisukeAfterText
	waitbutton
	closetext
	end

TrainerSwimmermJunpei:
	trainer EVENT_BEAT_SWIMMERM_JUNPEI, SWIMMERM, JUNPEI, SwimmermJunpeiSeenText, SwimmermJunpeiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermJunpeiAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfReina:
	trainer EVENT_BEAT_SWIMMERF_REINA, SWIMMERF, REINA, SwimmerfReinaSeenText, SwimmerfReinaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerfReinaAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfUmiko:
	trainer EVENT_BEAT_SWIMMERF_UMIKO, SWIMMERF, UMIKO, SwimmerfUmikoSeenText, SwimmerfUmikoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerfUmikoAfterText
	waitbutton
	closetext
	end

Route54Sign:
	jumptext Route54SignText

NicoSign:
	jumptext NicoSignText

.Text:

SwimmermHairoSeenText:
	text "¿Has visto a"
	line "esos dos idiotas"
	cont "del TEAM ROCKET"
	cont "merodear?"
	done

SwimmermHairoBeatenText:
	text "¿Me pregunto"
	line "quienes serán?"
	done

SwimmermHairoAfterText:
	text "¿Me pregunto"
	line "donde están?"
	done

SwimmermDaisukeSeenText:
	text "¡Las carreas"
	line "#MON son el"
	cont "mejor ejercicio!"
	done

SwimmermDaisukeBeatenText:
	text "¿Seras mas rá-"
	line "pido que yo?"
	done

SwimmermDaisukeAfterText:
	text "¡Algun día ba-"
	line "tiré el record"
	cont "del mundo!"
	done

SwimmermJunpeiSeenText:
	text "Mis #MON"
	line "han crecido con"
	cont "cariño."

	para "¡Veamos quien"
	line "es mas fuerte!"
	done

SwimmermJunpeiBeatenText:
	text "¡Fue una buena"
	line "pelea!"
	done

SwimmermJunpeiAfterText:
	text "¡No ha estado"
	line "mal!"
	done

SwimmerfReinaSeenText:
	text "Veo que vas"
	line "hacia"
	cont "MANDARINA NORTE."

	para "¿Quieres comba-"
	line "tir antes?"
	done

SwimmerfReinaBeatenText:
	text "¡Oh, ni tan mal!"
	done

SwimmerfReinaAfterText:
	text "¡Ohohoho! STARYU"
	line "no fue rival"
	cont "para ti."
	done

SwimmerfUmikoSeenText:
	text "¡Ouch! Creo que"
	line "un MAREANIE "
	cont "me ha tocado."
	done

SwimmerfUmikoBeatenText:
	text "Gracias a DIOS"
	line "que solo era un"
	cont "alga<...>"
	done

SwimmerfUmikoAfterText:
	text "Gracias a DIOS"
	line "que solo era un"
	cont "alga<...>"
	done

Route54SignText:
	text "RUTA 50 -"
	line "MANDARINA NORTE"
	done

NicoSignText:
	text "ISLA NICO"

	para "¡Nico nico nii!"
	done

Route54_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 20, 8, SIGNPOST_READ, Route54Sign
	signpost 9, 13, SIGNPOST_READ, NicoSign

.ObjectEvents: db 5
	person_event SPRITE_SWIMMER_GUY, 9, 16, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermHairo, -1
	person_event SPRITE_SWIMMER_GUY, 24, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermDaisuke, -1
	person_event SPRITE_SWIMMER_GUY,  5,  3, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermJunpei, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 7, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmerfUmiko, -1
	person_event SPRITE_SWIMMER_GIRL, 27, 16, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerfReina, -1

