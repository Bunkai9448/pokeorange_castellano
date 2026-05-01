MoroIslandMuseum_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MoroTrophyScript:
	jumptext MoroTrophyText

MoroTrophyText:
	text "Aunque es muy viejo"
	line "y oxidado, da"
	cont "uns sensación de"
	cont "orgullo."
	done

MoroMuseumShip:
	jumptext MoroMuseumShipText

MoroMuseumShipText:
	text "Una versión a"
	line "escala del S.S."
	cont "ORANGE, que hara"
	cont "su debut en"
	cont "ISLA HAMLIN."
	done

MoroMuseumKabutopsFossil:
	refreshscreen
	pokepic KABUTOPS
	waitbutton
	closepokepic
	writetext MoroMuseumKabutopsFossilText
	waitbutton
	closetext
	end

MoroMuseumKabutopsFossilText:
	text "KABUTOPS"

	para "Solo investiga-"
	line "ciones recientes"
	cont "han permitido"
	cont "revivir a estos"
	cont "antiguos #MON."

	para "Se sumergía en"
	line "el agua para"
	cont "cazar a su presa."
	done

MoroMuseumOmastarFossil:
	refreshscreen
	pokepic OMASTAR
	waitbutton
	closepokepic
	writetext MoroMuseumOmastarFossilText
	waitbutton
	closetext
	end

MoroMuseumOmastarFossilText:
	text "OMASTAR"

	para "Solo investiga-"
	line "ciones recientes"
	cont "han permitido"
	cont "revivir a estos"
	cont "antiguos #MON."

	para "Usaba sus tentá-"
	line "culos para cazar"
	cont "a su presa."
	done

MoroMuseumMewTablet:
	jumptext MoroMuseumMewTabletText

MoroMuseumMewTabletText:
	text "La tablilla muestra"
	line "un #MON mítico."

	para "Está en un lenguaje"
	line "desconocido lo que"
	cont "imposibilita su"
	cont "lectura."
	done

MoroMuseumTrophySign:
	jumptext MoroMuseumTrophySignText

MoroMuseumTrophySignText:
	text "Este trofeo fue"
	line "encontrado en los"
	cont "restos de un"
	cont "naufragio frente"
	cont "a la costa de la"
	cont "isla."

	para "Se cree que perte-"
	line "neció al CAMPEON"
	cont "DE LA LIGA NARANJA"
	cont "de hace unos 300"
	cont "años."
	done

MoroMuseumSign:
	jumptext MoroMuseumSignText

MoroMuseumSignText:
	text "¡Por favor, NO"
	line "TOCAR la pantalla!"
	done

MoroMuseumStone:
	jumptext MoroMuseumStoneText

MoroMuseumStoneText:
	text "PIEDRA HIELO"

	para "Se ha descubierto"
	line "recientemente."
	cont "Permite evolucionar"
	cont "a ciertos tipos"
	cont "de #MON."
	done

MoroMuseumCuratorScript:
	checkevent EVENT_MORO_TROPHY_FOUND
	iftrue .CuratorTrophyFound
	opentext
	writetext CuratorTrophyMissingText
	waitbutton
	closetext
	end

.CuratorTrophyFound:
	opentext
	writetext CuratorTrophyFoundText
	waitbutton
	closetext
	end

CuratorTrophyMissingText:
	text "CUSTODIO: Hola."
	line "Siento decirte"
	cont "que alguien"
	cont "ha robado el"
	cont "trofeo de la"
	cont "LIGA NARANJA."

	para "Espero que la"
	line "policía lo"
	cont "encuentre pronto."
	done

CuratorTrophyFoundText:
	text "CUSTODIO:"
	line "Bienvenido al"
	cont "MUSEO DE MORO"
	cont "donde exhibimos"
	cont "tesoros encon-"
	cont "trados bajo el"
	cont "agua."

	para "¡Por favor dis-"
	line "frútelo a su"
	cont "gusto!"
	done

MoroMuseumPoliceScript:
	faceplayer
	checkevent EVENT_MORO_TROPHY_FOUND
	iftrue .NoMorePolice
	checkitem MORO_TROPHY
	iftrue .MoroTrophyFound
	opentext
	writetext PoliceTrophyMissingText
	waitbutton
	closetext
	end

.MoroTrophyFound:
	takeitem MORO_TROPHY
	opentext
	writetext PoliceTrophyReturnedText
	waitbutton
	verbosegiveitem HM_FLY
	clearevent EVENT_MORO_TROPHY_MISSING
	setevent EVENT_MORO_TROPHY_FOUND
	closetext
	end

.NoMorePolice:
	opentext
	writetext PoliceMuseumDoneText
	waitbutton
	closetext
	end

PoliceTrophyMissingText:
	text "¡Esto es increi-"
	line "ble! El trofeo"
	cont "ha sido robado"
	cont "mientras el"
	cont "CUSTODIO no"
	cont "estaba atento."

	para "Desafortunada-"
	line "mente nadie ha"
	cont "visto a los"
	cont "autores."
	done

PoliceTrophyReturnedText:
	text "¿Es eso lo que"
	line "creo que es?"

	para "<...>"

	para "¡No puedo creer"
	line "que hayas encon-"
	cont "trado el trofeo!"

	para "¡Gracias por"
	line "devolverlo!"
	cont "Aquí tienes por"
	cont "las molestias."
	done

PoliceMuseumDoneText:
	text "¡Gracias por"
	line "haber sido"
	cont "un buen sama-"
	cont "ritano."
	done

MoroMuseumBoyScript:
	jumptextfaceplayer MoroMuseumBoyText

MoroMuseumBoyText:
	text "¡Los fósiles son"
	line "muy guays!"

	para "¡Hay uno que"
	line "parece un bicho!"
	done

MoroMuseumLadyScript:
	jumptextfaceplayer MoroMuseumLadyText

MoroMuseumLadyText:
	text "Mi hijo esta"
	line "encantado de"
	cont "estar aquí."

	para "¡Ya lo he perdido"
	line "de vista!"
	done

MoroMuseumGrampsScript:
	jumptextfaceplayer MoroMuseumGrampsText

MoroMuseumGrampsText:
	text "Mm<...>"

	para "Mythic #MON<...>"
	line "Cuando era crío,"
	cont "vi uno."

	para "Negro como una"
	line "SOMBRA, con"
	cont "ardientes ojos"
	cont "rojos."

	para "Me observa desde"
	line "la sombra de un"
	cont "árbol, y luego"
	cont "desaparece."

	para "¿Me pregunto que"
	line "será?"
	done

MoroIslandMuseum_MapEventHeader::

.Warps: db 2
	warp_def 15, 4, 1, MORO_ISLAND
	warp_def 15, 5, 1, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 12
	signpost 8, 5, SIGNPOST_READ, MoroMuseumShip
	signpost 8, 4, SIGNPOST_READ, MoroMuseumShip
	signpost 5, 3, SIGNPOST_READ, MoroMuseumKabutopsFossil
	signpost 5, 2, SIGNPOST_READ, MoroMuseumKabutopsFossil
	signpost 5, 6, SIGNPOST_READ, MoroMuseumOmastarFossil
	signpost 5, 7, SIGNPOST_READ, MoroMuseumOmastarFossil
	signpost 1, 12, SIGNPOST_READ, MoroMuseumMewTablet
	signpost 1, 11, SIGNPOST_READ, MoroMuseumMewTablet
	signpost 8, 11, SIGNPOST_READ, MoroMuseumTrophySign
	signpost 0, 9, SIGNPOST_READ, MoroMuseumSign
	signpost 1, 5, SIGNPOST_READ, MoroMuseumStone
	signpost 1, 4, SIGNPOST_READ, MoroMuseumStone

.ObjectEvents: db 6
	person_event SPRITE_GOLD_TROPHY, 10, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroTrophyScript, EVENT_MORO_TROPHY_MISSING
	person_event SPRITE_OFFICER, 11, 11, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroMuseumPoliceScript, EVENT_MORO_TROPHY_FOUND
	person_event SPRITE_GENTLEMAN, 15, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroMuseumCuratorScript, -1
	person_event SPRITE_BUG_CATCHER, 6, 3, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MoroMuseumBoyScript, EVENT_MORO_TROPHY_MISSING
	person_event SPRITE_POKEFAN_F, 12, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -2, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroMuseumLadyScript, EVENT_MORO_TROPHY_MISSING
	person_event SPRITE_GRAMPS, 3, 12, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MoroMuseumGrampsScript, EVENT_MORO_TROPHY_MISSING
