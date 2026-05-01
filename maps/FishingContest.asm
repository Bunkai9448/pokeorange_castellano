const_value = 1
	const FISHING_CONTEST_GRAMPS
	const FISHING_CONTEST_SCIENTIST

FishingContest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FishingContestSign:
	jumptext FishingContestSignText
	
FishingContestSignText:
	text "¡AVISO!"
	
	para "Por favor, captura"
	line "con mesura."
	
	para "Hay #MON"
	line "que solo habitan"
	cont "este área."
	done
	
FishingContestNatPagleScript:
	jumptextfaceplayer FishingContestNatPagleText
	
FishingContestNatPagleText:
	text "Si me preguntas,"
	line "la mejor parte de"
	cont "pescar es la paz"
	cont "que da. Otorga"
	
	para "tiempo para pensar"
	line "en el hoy, para"
	cont "reflejarte en el"
	cont "pasado..."
	
	para "¡Ah!¡Y es una gran"
	line "excusa para beber."
	cont "¡Beber!"
	done
	
UnnamedIslandTMScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_UNNAMED_ISLAND_2_TM
	closetext
	end

FishingContest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 15, 11, SIGNPOST_READ, FishingContestSign

.ObjectEvents: db 2
	person_event SPRITE_GRAMPS, 14, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FishingContestNatPagleScript, -1
	person_event SPRITE_SUPER_NERD, 12,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, UnnamedIslandTMScript, -1

