const_value = 1
	const MORO_FISHING_GURU

MoroFishingHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroFishingGuruScript:
	faceplayer
	opentext
	checkitem GOOD_ROD
	iftrue .AlreadyGotGoodRod
	writetext WantAGoodRodText
	yesorno
	iftrue .GimmeGoodRod
	writetext OhWellGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotGoodRod:
	writetext AlreadyGotGoodRodText
	waitbutton
	closetext
	end

.GimmeGoodRod:
	verbosegiveitem GOOD_ROD
	writetext GoodRodHappyFishingText
	waitbutton
	closetext
	end

WantAGoodRodText:
	text "¡Bienvenido!"

	para "Veo que eres un"
	line "talentoso "
	cont "entrenador "
	cont "#MON."

	para "Esta CAÑA BUENA"
	line "podria ayudarte"
	cont "con la #DEX."

	para "¿La quieres?"
	done

OhWellGoodRodText:
	text "Ah, bien."

	para "Si cambias de"
	line "opinión, estare"
	cont "aqui."
	done

AlreadyGotGoodRodText:
	text "¿Como va la"
	line "pesca?"
	done

GoodRodHappyFishingText:
	text "¡Feliz pesca!"
	done

MoroFishingHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 3, MORO_ISLAND
	warp_def 7, 3, 3, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_FISHING_GURU, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroFishingGuruScript, -1
