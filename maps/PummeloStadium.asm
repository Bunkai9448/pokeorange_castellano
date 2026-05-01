const_value = 1
	const PUMMELO_STADIUM_SPECTATOR1
	const PUMMELO_STADIUM_SPECTATOR2
	const PUMMELO_STADIUM_DRAKE
	const PUMMELO_STADIUM_ANNOUNCER
	const PUMMELO_STADIUM_OFFICER

PummeloStadium_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloStadiumEntry:
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .DrakeGone
	opentext
	writetext PummeloStadiumEntryBadgeCheckText
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .NoSpikeShell
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .NoJadeStar
	writetext PummeloStadiumBadgeCheckPassText
	waitbutton
	closetext
	applymovement PUMMELO_STADIUM_OFFICER, StadiumOfficerMovement
	spriteface PUMMELO_STADIUM_OFFICER, RIGHT
	applymovement PLAYER, StadiumPlayerMovement1
	opentext
	writetext StadiumPlayerEnteringArenaText
	waitbutton
	closetext
	applymovement PLAYER, StadiumPlayerMovement2
	spriteface PLAYER, RIGHT
	opentext
	writetext DrakeOpeningText
	waitbutton
	closetext
	winlosstext DrakePummeloWinLoss, 0
	loadtrainer DRAKE, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_INDIGO_PLATEAU
	opentext
	writetext AnnouncerWinnerText
	waitbutton
	clearevent EVENT_DRAKE_IN_HALL_OF_FAME
	clearevent EVENT_PUMMELO_ISLAND_DRAKE_GIFT
	special FadeOutPalettes
	pause 15
	setevent EVENT_BEAT_ORANGE_LEAGUE
	clearevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	clearevent EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT
	clearevent EVENT_MIMIKYU_FOUGHT
	clearevent EVENT_MANDARIN_CAVE_KECLEON_FOUGHT
	clearevent EVENT_RED_ON_CLEOPATRA
	warpfacing UP, HALL_OF_FAME, 6, 11
	end

.DrakeGone:
	opentext
	writetext DrakeGoneText
	yesorno
	iftrue .PostGameStadiumBegin
	writetext DeclinePostStadiumText
	waitbutton
	closetext
	end

.PostGameStadiumBegin:
	writetext CissyBattleText
	waitbutton
	winlosstext CissyWinLoss, 0
	loadtrainer CISSY, 2
	startbattle

	playmapmusic
	reloadmapafterbattle
	opentext
	writetext DannyBattleText
	waitbutton
	winlosstext DannyWinLoss, 0
	loadtrainer DANNY, 2
	startbattle

	playmapmusic
	reloadmapafterbattle
	opentext
	writetext RudyBattleText
	waitbutton
	winlosstext RudyWinLoss, 0
	loadtrainer RUDY, 2
	startbattle

	playmapmusic
	reloadmapafterbattle
	opentext
	writetext LuanaBattleText
	waitbutton
	winlosstext LuanaWinLoss, 0
	loadtrainer LUANA, 2
	startbattle

	playmapmusic
	reloadmapafterbattle
	opentext
	writetext RedBattleText
	waitbutton
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	blackoutmod PUMMELO_ISLAND
	winlosstext RedWinLoss, 0
	loadtrainer RED, 1
	startbattle

	playmapmusic
	reloadmapafterbattle
	opentext
	writetext StadiumWonText1
	waitbutton
	verbosegiveitem MASTER_BALL
	writetext StadiumWonText2
	waitbutton
	closetext
	;reset static encounters
	clearevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	clearevent EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT
	clearevent EVENT_MIMIKYU_FOUGHT
	clearevent EVENT_ZAPDOS_FOUGHT
	clearevent EVENT_ARTICUNO_FOUGHT
	clearevent EVENT_MOLTRES_FOUGHT
	clearevent EVENT_LUGIA_FOUGHT
	clearevent EVENT_MANDARIN_CAVE_KECLEON_FOUGHT
	clearevent EVENT_SUNRAY_CAVE_1F_MARSHADOW_FOUGHT
	clearevent EVENT_ROUTE51_HO_OH_FOUGHT
	clearevent EVENT_TANGELO_JUNGLE_MEW_FOUGHT
	clearevent EVENT_VICTORY_ROAD_MEWTWO_FOUGHT
	clearevent EVENT_TARROCO_CELEBI_FOUGHT
	clearevent EVENT_RED_ON_CLEOPATRA
	special InitRoamMons ;reset the eon duo
	special HealParty
	halloffame
	end
	
.NoSpikeShell:
	opentext
	writetext PummeloStadiumNoSpikeShellText
	waitbutton
	closetext
	end
	
.NoJadeStar:
	opentext
	writetext PummeloStadiumNoJadeStarText
	waitbutton
	closetext
	end

DrakeGoneText:
	text "¡CAMPEON!"
	
	para "Si estas"
	line "buscando a DRAKE,"
	cont "ha ido a ISLA"
	cont "POMELO a entre-"
	cont "nar.Pero si "
	cont "buscas desafios,"
	cont "estas en el "
	cont "lugar correcto."
	
	para "¿Quieres vertelas"
	line "con nuestros"
	cont "isleños mas"
	cont "fuertes?"
	done

DeclinePostStadiumText:
	text "Bien, nuestros"
	line "entrenadores aman"
	cont "combatir. Ellos"
	cont "siempre aceptaran"
	cont "tu desafio."
	
	para "Por favor,vuelve."
	done

CissyBattleText:
	text "Tu primera pelea"
	line "sera contra"
	cont "CISSY."
	para "¿Que? ¿Esperabas"
	line "otro rival?"
	para "Nuestros entre-"
	line "nadores mas "
	cont "fuertes son los"
	cont "LIDERES de GIM."
	para "Pero no te"
	line "confies, son mas"
	cont "fuertes que en"
	cont "encuentros"
	cont "anteriores."
	para "¡COMENCEMOS!"
	done

DannyBattleText:
	text "La segunda pelea"
	line "es contra DANNY "
	cont "¡COMENCEMOS!"
	done

RudyBattleText:
	text "La tercera pelea"
	line "es contra Rudy."
	cont "¡COMENCEMOS!"
	done

LuanaBattleText:
	text "La cuarta pelea"
	line "es contra LUNA."
	cont "¡COMENCEMOS!"
	done

RedBattleText:
	text "Finalmente, tene-"
	line "mos un nuevo"
	cont "desafio para ti,"
	cont "CAMPEON."
	
	para "Antes,curaremos"
	line "a tus POKES."
	done

CissyWinLoss:
	text "¡LO DI TODO!"
	line "¡ENHORABUENA!"
	done

DannyWinLoss:
	text "Wow, no me"
	line "fue tan mal."
	done

RudyWinLoss:
	text "Hmph."
	done

LuanaWinLoss:
	text "¿Puedes hacerlo?"
	done

RedWinLoss:
	text "..."
	done

StadiumWonText1:
	text "¡Gran trabajo!"
	line "No teniamos"
	cont "dudas de que"
	cont "lo lograrias."
	
	para "Nos gustaria"
	line "darte esto."
	done

StadiumWonText2:
	text "Vuelve si"
	line "quieres otra"
	cont "revancha,"
	cont "CAMPEON."
	done

PummeloStadiumNoSpikeShellText:
	text "Frankly, me "
	line "han dado una"
	cont "paliza."
	
	para "Parece que te"
	line "falta la meda-"
	cont "lla CONCHA"
	cont "ESPINOSA."
	
	para "RUDY de ISLA"
	line "TROVITA esta"
	cont "aqui."
	done

PummeloStadiumNoJadeStarText:
	text "Frankly, me"
	line "han dado una"
	cont "paliza."
	
	para "Parece que te"
	line "falta la "
	cont "MEDALLA"
	cont "ESTRELLA DE"
	cont "JADE."
	
	para "LUANA de ISLA"
	line "KUMQUAT la tiene."
	done
	
PummeloStadiumEntryBadgeCheckText:
	text "Saludos. Debes"
	line "de ser <PLAYER>."
	cont "DRAKE te ha es-"
	cont "tado esperando."
	
	para "Primero, dejame"
	line "ver tus medallas."
	
	para "<...>"
	
	para "<...>"
	
	para "<...>"
	done
	
PummeloStadiumBadgeCheckPassText:
	text "Excellente. Ven"
	line "por aqui, DRAKE"
	cont "te espera."
	done
	
StadiumPlayerEnteringArenaText:
	text "SPEAKER:¡Señoras"
	line "y señores!"
	
	para "¡La pelea que"
	line "que estaban"
	cont "esperando!"
	
	para "De ISLA"
	line "VALENCIA, <PLAYER>!"
	
	para "¿Podra derrotar"
	line "al campeon"
	cont "DRAKE?"
	done
	
DrakeOpeningText:
	text "Bienvenido, <PLAYER>."
	line "Soy DRAKE, el"
	cont "lider del ORANGE"
	cont "CREW."
	
	para "Lo has hecho bien"
	line "llegando tan lejos,"
	cont "¡pero no te voy a"
	cont "dar el titulo tan"
	
	para "facilmente!"
	done
	
DrakePummeloWinLoss:
	text "¡Imposible!"
	
	para "<...>"
	
	para "¿Pero que digo?"
	line "<PLAYER>, Estoy"
	cont "muy impresionado."
	
	para "¡Has ganado el"
	line "titulo de CAMPEON!"
	done
	
AnnouncerWinnerText:
	text "SPEAKER: ¡GUAU!"
	line "¡SEÑORAS, SEÑORES!"
	
	para "¡Tenemos un nuevo"
	line "CAMPEON! <PLAYER>"
	
	para "DRAKE: <PLAYER>."
	line "Sigueme. Es la"
	cont "hora de ir al"
	cont "HALL DE LA"
	
	para "FAMA."
	done
	
StadiumOfficerMovement:
	step UP
	step LEFT
	step_end
	
StadiumPlayerMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
StadiumPlayerMovement2:
	step LEFT
	step UP
	step UP
	step UP
	step_end

PummeloStadium_MapEventHeader::

.Warps: db 2
	warp_def 19,  6, 3, PUMMELO_ISLAND
	warp_def 19,  7, 4, PUMMELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_SPECTATOR_1,  2,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPECTATOR_1,  2,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_DRAKE,  6,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GYM_GUY,  4,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_OFFICER, 16,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloStadiumEntry, -1
