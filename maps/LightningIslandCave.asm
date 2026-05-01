const_value = 1
	const LIGHTNING_ISLAND_LAWRENCE

LightningIslandCave_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

LawrenceLightningIslandScript:
	opentext
	writetext LawrenceLightningIslandText2
	waitbutton
	closetext
	faceplayer
	showemote EMOTE_QUESTION, LIGHTNING_ISLAND_LAWRENCE, 15
	playmusic MUSIC_CASTLE_ROUTE
	opentext
	writetext LawrenceLightningIslandText
	waitbutton
	closetext
	applymovement LIGHTNING_ISLAND_LAWRENCE, LawrenceLightningIsland_Movement
	disappear LIGHTNING_ISLAND_LAWRENCE
	playsound SFX_ENTER_DOOR
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_ROUTE_37
	pause 10
	setevent EVENT_MET_LAWRENCE_AT_LIGHTNING_ISLAND
	end
	
LawrenceLightningIslandText:
	text "???: ¿Hmm?"
	
	para "¿Dices que estos"
	line "isleños estan al"
	cont "corriente de mis"
	cont "planes?"
	
	para "Mantente fuera"
	line "de mi camino si"
	cont "no quieres saber"
	cont "lo que es bueno."
	
	para "Las leyendas"
	line "dicen que quien"
	cont "obtenga los tres"
	cont "tesoros podrá"
	cont "domar a LUGIA,"
	cont "al que los "
	cont "isleños llaman el"
	cont "DIOS DEL MAR."
	
	para "Los tres tesoros"
	line "se refieren"
	cont "claramente a los"
	cont "tres pájaros"
	cont "legendarios,#MON"
	cont "conocidos como"
	cont "ZAPDOS, MOLTRES,"
	cont "y ARTICUNO."
	
	para "Asi que no te"
	line "preocupes de lo"
	cont "que diga esa"
	cont "estupida profecía."
	cont "Soy el mayor"
	cont "collecionista del"
	cont "mundo #MON,"
	cont "LAWRENCE"
	cont "STEALTHIUS"
	cont "GELARDAN,TERCERO"
	cont "de mi linaje."
	
	para "Supongo<...>"
	line "Que puede ser"
	cont "muy sofisticado"
	cont "para ti."
	
	para "Puedes llamarme"
	line "LAWRENCE III."
	
	para "Adios ,plebeyo."
	done
	
LawrenceLightningIslandText2:
	text "El objetivo parece"
	line "haber dejado la"
	cont "ISLA DEL TRUENO"
	cont "para ir a ISLA"
	cont "DEL FUEGO."
	
	para "<...> <...> <...>"
	
	para "El objetivo Zapdos"
	line "esta actualmente"
	cont "enzarzado en una"
	cont "pelea con el"
	cont "Objetivo 3 en"
	cont "la ISLA DEL "
	cont "HIELO."
	
	para "???: ¿Nos esta-"
	line "mos adelantando,"
	cont "ZAPDOS<...>?"
	done
	
LawrenceLightningIsland_Movement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

LightningIslandCave_MapEventHeader::

.Warps: db 2
	warp_def $3, $11, 1, LIGHTNING_ISLAND
	warp_def $5, $3, 2, LIGHTNING_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1	
	person_event SPRITE_LAWRENCE,  3,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LawrenceLightningIslandScript, EVENT_MET_LAWRENCE_AT_LIGHTNING_ISLAND
