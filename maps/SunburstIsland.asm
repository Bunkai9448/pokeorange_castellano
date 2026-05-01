const_value = 1
	const SUNBURST_VENDOR1
	const SUNBURST_VENDOR2
	const SUNBURST_VENDOR3
	const SUNBURST_GRAMPS
	const SUNBURST_COOLTRAINERF
	const SUNBURST_FISHER2
	const SUNBURST_SUNNY_DAY

SunburstIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SUNBURST
	return

SunburstFatManScript:
	jumptextfaceplayer SunburstFatManText

SunburstCooltrainerFScript:
	jumptextfaceplayer SunburstCooltrainerFText

SunburstGrampsScript:
	jumptextfaceplayer SunburstGrampsText

SunburstBlueSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST1
	closetext
	end

SunburstRedSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST2
	closetext
	end

SunburstGreenSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST3
	closetext
	end

SunburstSign:
	jumptext SunburstSignText

BazaarSign:
	jumptext BazaarSignText

IslandSign:
	jumptext IslandSignText

CenterSign:
	jumptext CenterSignText

CaveSign:
	jumptext CaveSignText

SunburstHiddenIron:
	dwb EVENT_SUNBURST_ISLAND_HIDDEN_IRON, IRON

SunburstHiddenMoonStone:
	dwb EVENT_SUNBURST_ISLAND_HIDDEN_MOON_STONE, MOON_STONE

SunburstTMSunnyDay:
	itemball TM_SUNNY_DAY

SunburstFatManText:
	text "Es la cueva"
	line "Cristal."

	para "La leyenda dice"
	line "que hay un ONIX "
	cont "hecho de los "
	cont "cristales de la"
	cont "cueva."

	para "Hablando de ONIX,"
	line "un lider de Gim"
	cont "de KANTO vino"
	cont "antes."
	done

SunburstCooltrainerFText:
	text "¡Cielos!"

	para "Vi a BROCK, el"
	line "lider de Gim"
	cont "de CIUDAD"
	cont "PLATEADA,"
	cont "KANTO."
	done

SunburstGrampsText:
	text "Esto solía ser"
	line "una ciudad adi-"
	cont "nerada como"
	cont "MANDARINA NORTE."

	para "Ultimamente el"
	line "turismo ha ido"
	cont "muriendo, y lo"
	cont "estamos notando."
	done

SunburstSignText:
	text "ISLA SUNBURST"

	para "La isla donde"
	line "el cristal "
	cont "brilla fuerte."
	done

BazaarSignText:
	text "BAZAR SUNBURST"
	done

IslandSignText:
	text "TIENDA CRISTAL"

	para "CERRADO"
	done

CenterSignText:
	text "ISLA SUNBURST"
	line "CENTRO #MON "
	done

CaveSignText:
	text "CUEVA CRISTAL"

	para "Sigue recto "
	line "hacia RUTA 55."
	done
	
SunburstHiddenNugget:
	dwb EVENT_ROUTE_SUNBURST_ISLAND_HIDDEN_NUGGET, NUGGET

SunburstIsland_MapEventHeader::

.Warps: db 6
	warp_def 41, 30, 1, CRYSTAL_CAVE_1F
	warp_def 27, 27, 1, SUNBURST_POKECENTER
	warp_def 9, 7, 1, SUNBURST_CRYSTAL_SHOP
	warp_def 11, 21, 1, SUNBURST_SMALL_HOUSE
	warp_def 17, 27, 1, SUNBURST_LARGE_HOUSE
	warp_def 33, 7, 1, SUNBURST_SOUTH_HOUSE

.CoordEvents: db 0

.BGEvents: db 8
	signpost 18, 30, SIGNPOST_READ, SunburstSign
	signpost 26, 18, SIGNPOST_READ, BazaarSign
	signpost 9, 5, SIGNPOST_READ, IslandSign
	signpost 27, 28, SIGNPOST_READ, CenterSign
	signpost 42, 28, SIGNPOST_READ, CaveSign
	signpost 28, 14, SIGNPOST_ITEM, SunburstHiddenIron
	signpost 29, 19, SIGNPOST_ITEM, SunburstHiddenMoonStone
	signpost 41, 10, SIGNPOST_ITEM, SunburstHiddenNugget

.ObjectEvents: db 7
	person_event SPRITE_GRAMPS, 22,  7, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunburstGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 26, 15, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunburstBlueSalesmanScript, -1
	person_event SPRITE_YOUNGSTER, 24, 21, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunburstRedSalesmanScript, -1
	person_event SPRITE_YOUNGSTER, 24, 16, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunburstGreenSalesmanScript, -1
	person_event SPRITE_COOLTRAINER_F, 13, 31, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunburstCooltrainerFScript, -1
	person_event SPRITE_FISHER, 42, 25, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunburstFatManScript, -1
	person_event SPRITE_POKE_BALL, 7, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SunburstTMSunnyDay, EVENT_SUNBURST_TM_SUNNY_DAY
