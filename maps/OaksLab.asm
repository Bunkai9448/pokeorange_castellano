const_value = 1
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Oak:
	faceplayer
	opentext
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakLabDexCheckText:
	text "¿Como va tu #-"
	line "DEX ?"

	para "Veamos<...>"
	done

OakLabGoodbyeText:
	text "Si estas por"
	line "aquí, espero"
	cont "que me visites."
	done

OaksAssistant1Text:
	text "El progama de"
	line "radio del"
	cont "PROF's #MON"

	para "no se emite"
	line "en KANTO."

	para "Es una pena, me"
	line "gustaría oirlo."
	done

OaksAssistant2Text:
	text "Gracias por tu"
	line "trabajo en la #-"
	cont "DEX, la busqueda"

	para "del profesor esta"
	line "alcanzando grandes"
	cont "cotas."
	done

OaksAssistant3Text:
	text "No se lo cuentes"
	line "a nadie, pero el"

	para "progama de radio"
	line "del PROF. no es"
	cont "en directo."
	done

OaksLabPoster1Text:
	text "Pulsa START para"
	line "abrir el menú."
	done

OaksLabPoster2Text:
	text "GUARDAR es una"
	line "opcion del MENU."

	para "Usala de manera"
	line "recurrente."
	done

OaksLabTrashcanText:
	text "No hay nada"
	line "aquí<...>"
	done

OaksLabPCText:
	text "Hay un E-mail"
	line "en el PC."

	para "<...>"

	para "PROF.OAK,¿Como"
	line "va progresando"
	cont "tu investigación?"

	para "Yo sigo traba-"
	line "jando sin parar."

	para "He oido rumores"
	line "de que <PLAYER>"

	para "esta labrandose"
	line "una gran repu-"
	cont "tación."

	para "Me alegra escu-"
	line "char eso."

	para "ELM en NEW BARK"
	line "TOWN 8-)"
	done

OaksLab_MapEventHeader:

.Warps: db 0

.XYTriggers: db 0

.Signposts: db 16
	signpost 1, 6, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 7, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 8, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 9, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 0, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 1, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 2, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 3, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 6, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 7, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 8, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 9, SIGNPOST_READ, OaksLabBookshelf
	signpost 0, 4, SIGNPOST_READ, OaksLabPoster1
	signpost 0, 5, SIGNPOST_READ, OaksLabPoster2
	signpost 3, 9, SIGNPOST_READ, OaksLabTrashcan
	signpost 1, 0, SIGNPOST_READ, OaksLabPC

.PersonEvents: db 4
	person_event SPRITE_OAK, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Oak, -1
	person_event SPRITE_SCIENTIST, 8, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	person_event SPRITE_SCIENTIST, 9, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	person_event SPRITE_SCIENTIST, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant3Script, -1
