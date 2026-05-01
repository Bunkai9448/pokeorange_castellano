const_value = 1
	const ROUTE_60_JESSIE
	const ROUTE_60_JAMES
	const ROUTE_60_POKE_BALL
	const ROUTE_60_SWIMMER_GIRL
	const ROUTE_60_POKE_BALL2
	const ROUTE_60_SWIMMER_GUY
	const ROUTE_60_ROCKER
	const ROUTE_60_SEASHELL
	const ROUTE_60_SEASHELL_2

Route60_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap WRECKED_SHIP, 0, 0
	return
	
RocketRoute60Event:
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Route60RocketText1
	waitbutton
	closetext
	spriteface ROUTE_60_JESSIE, DOWN
	spriteface ROUTE_60_JAMES, DOWN
	playmusic MUSIC_ROCKET_MOTTO
	opentext
	writetext Route60RocketMottoText
	waitbutton
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	spriteface ROUTE_60_JESSIE, LEFT
	spriteface ROUTE_60_JAMES, RIGHT
	writetext WhereIsMeowthText
	waitbutton
	closetext
	applymovement ROUTE_60_JAMES, ROUTE_60_JAMES_MOVEMENT
	applymovement ROUTE_60_JESSIE, ROUTE_60_JESSIE_MOVEMENT
	disappear ROUTE_60_JESSIE
	disappear ROUTE_60_JAMES
	setevent EVENT_ROUTE_60_ROCKET
	domaptrigger ROUTE_60, $1
	playmusic MUSIC_ROUTE_62
	end


Route60RocketText1:
	text "???: ¡Ooh, mira"
	line "eso, JESSIE!"

	para "JESSIE: ¡JAMES,"
	line "estás haciendo"
	cont "demasiado ruido!"
	cont "¿Y si nos oye"
	cont "algún policía?"

	para "JAMES: Es entonces"
	line "cuando les damos"
	cont "nuestro lema, como"
	cont "habíamos practi-"
	cont "cado."

	para "¡Luego les damos"
	line "una pequeña"
	cont "muestra de ARBOK"
	cont "y WEEZING!"

	para "<...> <...> <...>"
	done

Route60RocketMottoText:
	text "¡Para protege al"
	line "mundo de  la"
	cont "devastación!"

	para "¡Para unir a todos"
	cont "los pueblos en"
	cont "una sola nación!"

	para "¡Para denunciar a"
	line "los enemigos de la"
	cont "verdad y el amor!"

	para "¡Para extender"
	line "nuestro poder mas"
	cont "alla del espacio"
    cont "exterior!"

	para "¡JESSIE!"

	para "¡JAMES!"

	para "¡EQUIPO ROCKET,"
	line "despegamos a la"
	cont "velocidad de la luz!"

	para "¡Ríndete ahora o"
	line "prepárate para"
	cont "luchar!"
	done

WhereIsMeowthText:
	text "<...> <...> <...>"

	para "JAMES: ¿MEOWTH?"

	para "<...>"

	para "JAMES: JESSIE,"
	line "¿sabes adónde"
	cont "fue MEOWTH?"

	para "JESSIE: Ni idea."

	para "JAMES: ¿Tal vez"
	line "fue a la siguiente"
	cont "ISLA?"

	para "JESSIE: Bueno,"
	line "¿por qué no lo"
	cont "averiguamos?"
	done

ROUTE_60_JESSIE_MOVEMENT:
	step LEFT
	step LEFT
	step LEFT
	step_end

ROUTE_60_JAMES_MOVEMENT:
	step LEFT
	step LEFT
	step_end

Route60Sign:
	jumptext Route60SignText

Route60SignText:
	text "RUTA 60"
	done

Route60UltraBall:
	itemball ULTRA_BALL
	
Route60SuperRepel:
	itemball SUPER_REPEL

Route60SwimmerGirlScript:
	jumptextfaceplayer Route60SwimmerText

Route60SwimmerText:
	text "¿Ves esta parte"
	line "profunda del"
	cont "agua?"

	para "¡Hay un BARCO"
	line "NAUFRAGADO debajo!"

	para "Los #MON de"
	line "tipo FANTASMA"
	cont "aparecen por aquí"
	cont "debido a ello."
	done
	
; SWIMMER_M_TAKAO
TrainerSwimmermTakao:
	trainer EVENT_BEAT_SWIMMERM_TAKAO, SWIMMERM, TAKAO, SwimmerMTakaoSeenText, SwimmerMTakaoWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerMTakaoAfterText
	waitbutton
	closetext
	end
	
SwimmerMTakaoSeenText:
	text "Intenté llegar al"
	line "BARCO NAUFRAGADO"
	cont "bajo el agua,"
	cont "¡pero un FANTASMA"
	cont "me atacó!"
	done
	
SwimmerMTakaoWinText:
	text "¡Escalofriante!"
	done
	
SwimmerMTakaoAfterText:
	text "Puedo lidiar con"
	line "un SHARPEDO o un"
	cont "TOXAPEX, ¡pero"
	cont "los GHOSTS son"
	cont "demasiado!"
	done
	
; BIRDKEEPER_TATSUYA
TrainerBirdkeeperTatsuya:
	trainer EVENT_BEAT_BIRDKEEPER_TATSUYA, BIRDKEEPER, TATSUYA, BirdkeeperTatsuyaSeenText, BirdkeeperTatsuyaWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdkeeperTatsuyaAfterText
	waitbutton
	closetext
	end
	
BirdkeeperTatsuyaSeenText:
	text "¿Puedes volar"
	line "como mis"
	cont "PÁJAROS?"
	done
	
BirdkeeperTatsuyaWinText:
	text "¡He sido"
	line "recortado!"
	done
	
BirdkeeperTatsuyaAfterText:
	text "Los #MON"
	line "pájaro pueden ser"
	cont "comunes, ¡pero no"
	cont "subestimes su"
	cont "poder!"
	done
	
Route60SeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute60Seashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_60_SEASHELL
	disappear ROUTE_60_SEASHELL
	end
	
.NoShellBox:
	writetext Route60NoShellBox
	waitbutton
	closetext
	end
	
Route60NoShellBox:
    text "¡Qué bonita"
    line "concha! Parece"
    cont "demasiado frágil"
    cont "para meterla en"
    cont "mi bolso."
    done
	
FoundRoute60Seashell:
	text "¡Has encontrado"
	line "una concha"
	cont "marina muy"
	cont "rara!"
	done
	
Route60Seashell2Script:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute60Seashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_60_SEASHELL_2
	disappear ROUTE_60_SEASHELL_2
	end
	
.NoShellBox:
	writetext Route60NoShellBox
	waitbutton
	closetext
	end

Route60_MapEventHeader::

.Warps: db 4
	warp_def 10, 49, 1, MORO_ROUTE_60_GATE
	warp_def 11, 49, 2, MORO_ROUTE_60_GATE
	warp_def 52, 4, 3, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 53, 4, 4, GOLDEN_ISLAND_GATE_HOUSE

.CoordEvents: db 2
	xy_trigger 0, 12, 39, RocketRoute60Event
	xy_trigger 0, 13, 39, RocketRoute60Event

.BGEvents: db 1
	signpost 6, 16, SIGNPOST_READ, Route60Sign

.ObjectEvents: db 9
	person_event SPRITE_JESSIE, 13, 36, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_60_ROCKET
	person_event SPRITE_JAMES, 13, 35, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_60_ROCKET
	person_event SPRITE_POKE_BALL, 19, 46, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route60UltraBall, EVENT_ROUTE_60_ULTRA_BALL
	person_event SPRITE_SWIMMER_GIRL, 14, 18, SPRITEMOVEDATA_SWIM_AROUND, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route60SwimmerGirlScript, -1
	person_event SPRITE_POKE_BALL, 37, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route60SuperRepel, EVENT_ROUTE_60_SUPER_REPEL
	person_event SPRITE_SWIMMER_GUY, 53, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermTakao, -1
	person_event SPRITE_ROCKER, 35, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBirdkeeperTatsuya, -1
	person_event SPRITE_SEASHELL, 30,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route60SeashellScript, EVENT_ROUTE_60_SEASHELL
	person_event SPRITE_SEASHELL, 59, 49, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route60Seashell2Script, EVENT_ROUTE_60_SEASHELL_2
