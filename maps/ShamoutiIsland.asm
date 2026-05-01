const_value = 1

ShamoutiIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SHAMOUTI
	return
	
ShamoutiKimonoGirl1Script:
	jumptextfaceplayer ShamoutiKimonoGirl1ScriptText
	
ShamoutiKimonoGirl1ScriptText:
	text "Estas luces son"
	line "en honor al"
	cont "guardián del mar."
	done
	
ShamoutiKimonoGirl2Script:
	jumptextfaceplayer ShamoutiKimonoGirl2ScriptText
	
ShamoutiKimonoGirl2ScriptText:
	text "Cada verano, "
	line "rendimos honores a"
	cont "las deidades guar-"
	cont "dianas de SHAMOUTI."
	done
	
ShamoutiKimonoGirl3Script:
	jumptextfaceplayer ShamoutiKimonoGirl3ScriptText


ShamoutiKimonoGirl3ScriptText:
	text "ARTICUNO, ZAPDOS,"
	line "MOLTRES."
	
	para "Son los dioses"
	line "del hielo, trueno,"
	cont "y fuego."
	
	para "Hay un cuarto"
	line "dios, pero no"
	cont "recuerdo su"
	cont "nombre."
	done
	
ShamoutiSage1Script:
	jumptextfaceplayer ShamoutiSage1ScriptText

ShamoutiSage1ScriptText:
	text "¡Las hojas de bambú"
	line "susurran, movien-"
	cont "dose en la lejanía!"
	
	para "¡Hic! Las estre-"
	line "llas brillan, gra-"
	cont "nos de oro y plata"
	cont "en la arena<...>"
	
	para "ZZZ<...>"
	
	para "Parece haberse"
	line "quedado dormido"
	cont "mientras cantaba."
	done
	
ShamoutiSage2Script:
	jumptextfaceplayer ShamoutiSage2ScriptText

ShamoutiSage2ScriptText:
	text "Prepare un lote"
	line "especial de Sake "
	cont "para este"
	cont "festival<...>"
	
	para "¡Hic!"
	
	para "Que bueno<...>"
	done	

ShamoutiSage3Script:
	jumptextfaceplayer ShamoutiSage3ScriptText

ShamoutiSage3ScriptText:
	text "¡Un turista en"
	line "esta época del"
	cont "año!"
	
	para "¡Llegas a tiempo"
	line "para el festival"
	cont "de LEYENDAS!"
	
	para "Estamos buscando"
	line "un entrenador que"
	cont "cumpla el rol de"
	cont "nuestra tra-"
	cont "dición."
	
	para "¿Te interesa?"
	line "Ve a casa del"
	cont "jefe en la parte"
	cont "norte de la"
	cont "isla."
	done
	
ShamoutiBlackbelt1Script:
	jumptextfaceplayer ShamoutiBlackbelt1ScriptText

ShamoutiBlackbelt1ScriptText:
	text "Esta cueva per-"
	line "tenece al San-"
	cont "tuario de"
	cont "SHAMOUTI."
	
	para "Presenta tus"
	line "respetos si te"
	cont "da tiempo."
	done
	
ShamoutiBlackbelt2Script:
	jumptextfaceplayer ShamoutiBlackbelt2ScriptText
	end

ShamoutiBlackbelt2ScriptText:
	text "¡Demasiadas"
	line "luces! Hacemos"
	cont "miles de"
	cont "faroles de papel"
	cont "cada año!"
	done
	
ShamoutiIslandSign:
	jumptext ShamoutiIslandSignText
	
ShamoutiIslandSignText:
	text "ISLA SHAMOUTI"
	
	para "Dando vida a las"
	line "leyendas para que"
	cont "sean recordadas."
	done
	
MelodyHouseSign:
	jumptext MelodyHouseSignText
	
MelodyHouseSignText:
	text "CASA DE MELODY"
	done
	
ChiefHouseSign:
	jumptext ChiefHouseSignText
	
ChiefHouseSignText:
	text "CASA DEL JEFE"
	done

ShamoutiIsland_MapEventHeader::

.Warps: db 5
	warp_def $b, $19, 1, SHAMOUTI_HOUSE
	warp_def $b, $13, 1, SHAMOUTI_CENTER
	warp_def $b, $9, 1, SHAMOUTI_MART
	warp_def $5, $1b, 1, CHIEFS_HOUSE
	warp_def $7, $10, 1, SHAMOUTI_CAVE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 14, 16, SIGNPOST_READ, ShamoutiIslandSign
	signpost 11, 27, SIGNPOST_READ, MelodyHouseSign
	signpost  5, 25, SIGNPOST_READ, ChiefHouseSign

.ObjectEvents: db 8
	person_event SPRITE_KIMONO_GIRL,  8, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiKimonoGirl1Script, -1
	person_event SPRITE_KIMONO_GIRL, 13, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiKimonoGirl2Script, -1
	person_event SPRITE_KIMONO_GIRL, 13, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiKimonoGirl3Script, -1
	person_event SPRITE_SAGE,  6, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiSage1Script, -1
	person_event SPRITE_SAGE,  6, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiSage2Script, -1
	person_event SPRITE_BLACK_BELT, 10, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiBlackbelt1Script, -1
	person_event SPRITE_BLACK_BELT, 14,  8, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiBlackbelt2Script, -1
	person_event SPRITE_SAGE, 15, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiSage3Script, -1
