const_value = 1
	const FUKUHARA_BF3_BUTCH
	const FUKUHARA_BF3_CASSIDY
	const FUKUHARA_BF3_AERODACTYL

FukuharaNo4BF3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FukuharaBF3Script:
	opentext
	writetext FukuharaBF3ScriptText1
	waitbutton
	spriteface FUKUHARA_BF3_BUTCH, DOWN
	spriteface FUKUHARA_BF3_CASSIDY, DOWN
	writetext FukuharaBF3ScriptText2
	waitbutton
	closetext
	winlosstext FukuharaButchCassidyWinLoss, 0
	loadtrainer CASSIDY_BUTCH, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext FukuharaBF3ScriptText3
	waitbutton
	closetext
	disappear FUKUHARA_BF3_BUTCH
	disappear FUKUHARA_BF3_CASSIDY
	setevent EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED
	special Special_FadeInQuickly
	end
	
FukuharaBF3ScriptText1:
	text "CASSIDY: ¡BUTCH!"
	line "¡Mira! ¡Es el"
	cont "rarísimo #MON"
	cont "AERODACTYL!"
	
	para "BUTCH: Pero CASS"
	
	para "CASSIDY: ¡No"
	line "te preocupes! Lo"
	cont "atraparemos"
	cont "antes<...>"
	done
	
FukuharaBF3ScriptText2:
	text "BUTCH: ¿El crío"
	line "esta aquí?"
	
	para "CASSIDY: <...>el"
	line "crío está aqui."
	
	para "Bueno, intenta-"
	line "rémos vencerlo."
	done
	
FukuharaButchCassidyWinLoss:
	text "¡Tienes que"
	line "estar de broma!"
	done
	
FukuharaBF3ScriptText3:
	text "CASSIDY: ¿No hay"
	line "esperanza, BUTCH?"
	
	para "BUTCH: <...>"
	line "CASS, pienso que"
	cont "es hora de "
	cont "dejarlo.."
	
	para "CASSIDY: <...>"
	
	para "BUTCH: Chico,"
	line "teniamos un sueño,"
	cont "hemos hecho todo "
	cont "lo posible por el."
	
	para "Supongo que esto"
	line "significa que el"
	cont "TEAM ROCKET esta"
	cont "acabado del todo."
	
	para "CASSIDY: Bueno,tú"
	line "todavia tienes a"
	cont "esos idiotas,"
	cont "JESSIE y JAMES."
	
	para "BUTCH: Ellos no"
	line "duraran ni un"
	cont "día sin nosotros."
	
	para "Lo hemos intentado,"
	line "pero no hay manera"
	cont "de derrotarte."
	done

FukuharaAerodactylScript:	
	faceplayer
	opentext
	writetext AerodactylText
	cry AERODACTYL
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon AERODACTYL, 40
	startbattle
	disappear FUKUHARA_BF3_AERODACTYL
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT
	end
	
AerodactylText:
	text "¡Wreeeooh!"
	done
	
FukuharaNo4BF3_MapEventHeader::

.Warps: db 1
	warp_def 17, 9, 2, FUKUHARA_NO_4_BF2

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_ROCKET, 4, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FukuharaBF3Script, EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED
	person_event SPRITE_ROCKET_GIRL, 4, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FukuharaBF3Script, EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED
	person_event SPRITE_AERODACTYL, 2, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, 0, 0, FukuharaAerodactylScript, EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT

