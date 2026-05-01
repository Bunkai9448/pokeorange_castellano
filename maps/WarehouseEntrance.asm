const_value = 1
	const WAREHOUSEENTRANCE_GRAMPS
	const WAREHOUSEENTRANCE_SUPER_NERD1
	const WAREHOUSEENTRANCE_SUPER_NERD2
	const WAREHOUSEENTRANCE_GRANNY

WarehouseEntrance_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .ResetSwitches
	dbw MAPCALLBACK_OBJECTS, .CheckDayOfWeek

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	return

.CheckDayOfWeek:
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .Monday
	if_equal TUESDAY, .Tuesday
	if_equal WEDNESDAY, .Wednesday
	if_equal THURSDAY, .Thursday
	if_equal FRIDAY, .Friday
	if_equal SATURDAY, .Saturday

.Sunday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	disappear WAREHOUSEENTRANCE_SUPER_NERD5
	appear WAREHOUSEENTRANCE_SUPER_NERD6
	appear WAREHOUSEENTRANCE_GRANNY
	return

.Monday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	checkmorn
	iffalse .NotMondayMorning
	appear WAREHOUSEENTRANCE_GRAMPS
.NotMondayMorning:
	disappear WAREHOUSEENTRANCE_SUPER_NERD5
	disappear WAREHOUSEENTRANCE_SUPER_NERD6
	disappear WAREHOUSEENTRANCE_GRANNY
	return

.Tuesday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	appear WAREHOUSEENTRANCE_SUPER_NERD5
	disappear WAREHOUSEENTRANCE_SUPER_NERD6
	disappear WAREHOUSEENTRANCE_GRANNY
	return

.Wednesday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	disappear WAREHOUSEENTRANCE_SUPER_NERD5
	appear WAREHOUSEENTRANCE_SUPER_NERD6
	disappear WAREHOUSEENTRANCE_GRANNY
	return

.Thursday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	appear WAREHOUSEENTRANCE_SUPER_NERD5
	disappear WAREHOUSEENTRANCE_SUPER_NERD6
	disappear WAREHOUSEENTRANCE_GRANNY
	return

.Friday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	disappear WAREHOUSEENTRANCE_SUPER_NERD5
	appear WAREHOUSEENTRANCE_SUPER_NERD6
	disappear WAREHOUSEENTRANCE_GRANNY
	return

.Saturday:
	disappear WAREHOUSEENTRANCE_GRAMPS
	appear WAREHOUSEENTRANCE_SUPER_NERD5
	disappear WAREHOUSEENTRANCE_SUPER_NERD6
	appear WAREHOUSEENTRANCE_GRANNY
	return

GrannyScript_0x7c132:
	opentext
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .Open
	if_equal SATURDAY, .Open
	jump WarehouseEntranceScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

GrampsScript_0x7c146:
	opentext
	checkflag ENGINE_BARGAINED_TODAY
	iftrue WarehouseEntranceScript_ShopClosed
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .CheckMorn
	jump WarehouseEntranceScript_ShopClosed

.CheckMorn:
	checkmorn
	iffalse WarehouseEntranceScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	opentext
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .DoHaircut
	if_equal THURSDAY, .DoHaircut
	if_equal SATURDAY, .DoHaircut
	jump WarehouseEntranceScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c5f9
	yesorno
	iffalse .Refused
	checkmoney $0, 500
	if_equal $2, .NotEnoughMoney
	writetext UnknownText_0x7c69a
	buttonsound
	special Special_YoungerHaircutBrother
	if_equal $0, .Refused
	if_equal $1, .Refused
	setflag ENGINE_GOT_HAIRCUT
	if_equal $2, .two
	if_equal $3, .three
	jump .else

.two
	setevent EVENT_TEMPORARY_1
	clearevent EVENT_TEMPORARY_2
	clearevent EVENT_TEMPORARY_3
	jump .then

.three
	clearevent EVENT_TEMPORARY_1
	setevent EVENT_TEMPORARY_2
	clearevent EVENT_TEMPORARY_3
	jump .then

.else
	clearevent EVENT_TEMPORARY_1
	clearevent EVENT_TEMPORARY_2
	setevent EVENT_TEMPORARY_3
	jump .then

.then
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c6b8
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7c6d8
	waitbutton
	checkevent EVENT_TEMPORARY_1
	iftrue UnknownScript_0x7c2bb
	checkevent EVENT_TEMPORARY_2
	iftrue UnknownScript_0x7c2c4
	jump UnknownScript_0x7c2cd

.Refused:
	writetext UnknownText_0x7c6ea
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c709
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c72b
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	opentext
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .DoHaircut
	if_equal WEDNESDAY, .DoHaircut
	if_equal FRIDAY, .DoHaircut
	jump WarehouseEntranceScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c75c
	yesorno
	iffalse .Refused
	checkmoney $0, 300
	if_equal $2, .NotEnoughMoney
	writetext UnknownText_0x7c7f1
	buttonsound
	special Special_OlderHaircutBrother
	if_equal $0, .Refused
	if_equal $1, .Refused
	setflag ENGINE_GOT_HAIRCUT
	if_equal $2, .two
	if_equal $3, .three
	jump .else

.two
	setevent EVENT_TEMPORARY_1
	clearevent EVENT_TEMPORARY_2
	clearevent EVENT_TEMPORARY_3
	jump .then

.three
	clearevent EVENT_TEMPORARY_1
	setevent EVENT_TEMPORARY_2
	clearevent EVENT_TEMPORARY_3
	jump .then

.else
	clearevent EVENT_TEMPORARY_1
	clearevent EVENT_TEMPORARY_2
	setevent EVENT_TEMPORARY_3
	jump .then

.then
	takemoney $0, 300
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c80e
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7c82a
	waitbutton
	checkevent EVENT_TEMPORARY_1
	iftrue UnknownScript_0x7c2bb
	checkevent EVENT_TEMPORARY_2
	iftrue UnknownScript_0x7c2c4
	jump UnknownScript_0x7c2cd

.Refused:
	writetext UnknownText_0x7c842
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c85b
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c87b
	waitbutton
	closetext
	end

UnknownScript_0x7c2bb:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

UnknownScript_0x7c2c4:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

UnknownScript_0x7c2cd:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScript::
	jumptext UnknownText_0x7c5b0

WarehouseEntranceScript_ShopClosed:
	writetext UnknownText_0x7c904
	waitbutton
	closetext
	end

MapWarehouseEntranceSignpost1Script:
	jumptext UnknownText_0x7c91a

UnknownText_0x7c5b0:
	text "The door's locked<...>"
	done

UnknownText_0x7c5f9:
	text "¡Bienvenido!"

	para "Dirijo el SALON "
	line "#MON."

	para "Soy el mayor y"
	line "el mejor de los"
	cont "dos hermanos pe-"
	cont "luqueros."

	para "Puedo poner bo-"
	line "nito tu "
	cont "#MON por "
	cont "solo ¥500."

	para "¿Que te gusta-"
	line "ria que haga?"
	done

UnknownText_0x7c69a:
	text "¿Con que #MON"
	line "quieres que "
	cont "trabaje?"
	done

UnknownText_0x7c6b8:
	text "¡OK! ¡Mira"
	line "como lo dejo!"
	done

UnknownText_0x7c6d8:
	text "¡Ya esta!"
	done

UnknownText_0x7c6ea:
	text "¿Es correcto?"
	line "¡Es una verguenza!"
	done

UnknownText_0x7c709:
	text "Necesitaras mas"
	line "dinero para eso."
	done

UnknownText_0x7c72b:
	text "Solo corto el"
	line "pelo una vez al"
	cont "dia. Ya vale"
	cont "por hoy."
	done

UnknownText_0x7c75c:
	text "¡Bienvenido al SA-"
	line "LON #MON!"

	para "Soy el mas joven"
	line "e inexperto de los"
	cont "dos hermanos"
	cont "peluqueros."

	para "Embellecere a tus"
	line "#MON por solo"
	cont "¥300."

	para "¿Que me dices?"
	done

UnknownText_0x7c7f1:
	text "OK,¿que #MON"
	line "trato?"
	done

UnknownText_0x7c80e:
	text "¡OK! ¡Lo deja-"
	line "re genial!"
	done

UnknownText_0x7c82a:
	text "¡Estoy listo!"
	line "¡Alla vamos!"
	done

UnknownText_0x7c842:
	text "¿No? "
	line "¡Que decepcion!"
	done

UnknownText_0x7c85b:
	text "Vas algo justo"
	line "de fondos."
	done

UnknownText_0x7c87b:
	text "Solo puedo hacer"
	line "un corte diario."

	para "Lo siento, es"
	line "todo por hoy."
	done

HaircutBrosText_SlightlyHappier:
	text_from_ram StringBuffer3
	text " parece"
	line "algo contento."
	done

HaircutBrosText_Happier:
	text_from_ram StringBuffer3
	text " parece"
	line "contento."
	done

HaircutBrosText_MuchHappier:
	text_from_ram StringBuffer3
	text " ¡parece"
	line "encantado!"
	done

UnknownText_0x7c904:
	text "No abrimos hoy."
	done

UnknownText_0x7c91a:
	text "NO PASAR MAS"
	line "ALLA DE AQUI"
	done

WarehouseEntrance_MapEventHeader:

.Warps: db 6
	warp_def $2, $3, 7, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $22, $3, 4, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $6, $12, 4, WAREHOUSE_ENTRANCE
	warp_def $1f, $15, 3, WAREHOUSE_ENTRANCE
	warp_def $1f, $16, 3, WAREHOUSE_ENTRANCE
	warp_def $1b, $16, 1, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES

.XYTriggers: db 0

.Signposts: db 2
	signpost 6, 18, SIGNPOST_READ, BasementDoorScript
	signpost 6, 19, SIGNPOST_READ, MapWarehouseEntranceSignpost1Script

.PersonEvents: db 4
	person_event SPRITE_GRAMPS, 11, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x7c146, EVENT_WAREHOUSE_ENTRANCE_GRAMPS
	person_event SPRITE_SUPER_NERD, 14, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_WAREHOUSE_ENTRANCE_OLDER_HAIRCUT_BROTHER
	person_event SPRITE_SUPER_NERD, 15, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_WAREHOUSE_ENTRANCE_YOUNGER_HAIRCUT_BROTHER
	person_event SPRITE_GRANNY, 21, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrannyScript_0x7c132, EVENT_WAREHOUSE_ENTRANCE_GRANNY
