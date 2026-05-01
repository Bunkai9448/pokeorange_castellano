const_value = 1
	const VICTORY_ROAD_TRACEY

VictoryRoadExitRoom_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

VictoryRoadTraceyScript:
	faceplayer
	showemote EMOTE_SHOCK, VICTORY_ROAD_TRACEY, 15
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyVictoryRoadText
	waitbutton
	closetext
	winlosstext TraceyVictoryRoadWinLoss, 0
	loadtrainer TRACEY_2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyVictoryRoadLeavingNowText
	waitbutton
	closetext
	applymovement VICTORY_ROAD_TRACEY, TraceyVR_Movement
	disappear VICTORY_ROAD_TRACEY
	playsound SFX_ENTER_DOOR
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_VICTORY_ROAD
	pause 10
	setevent EVENT_VICTORY_ROAD_TRACEY
	end
	
TraceyVictoryRoadText:
	text "TRACEY: ¡Asi que"
	line "lograste llegar"
	cont "hasta aqui,"
	cont "<PLAYER>!"
	
	para "A decir verdad,"
	line "estaba esperando"
	cont "que aparecieras."
	
	para "Ese tipo, CROSS."
	
	para "Intente ganarle"
	line "por lo que hizo"
	cont " en ASCORBIA."
	
	para "Pero el es mas"
	line "poderoso."
	
	para "Asi que he deci-"
	line "dido dejar de "
	cont "ser entrenador y"
	cont "convertirme en"
	cont "observador."
	
	para "Mmm, <PLAYER>,"
	line "¿Un ultimo "
	cont "combate antes"
	cont "de mi retiro?"
	done
	
TraceyVictoryRoadWinLoss:
	text "Absolutamente"
	line "brillante."
	
	para "<PLAYER>."
	line "¿Sabes? Realmente"
	cont "eres alguien"
	cont "especial."
	done
	
TraceyVictoryRoadLeavingNowText:
	text "<...>"
	
	para "Nuestra pelea,"
	line "<PLAYER>."
	
	para "Me recuerda de"
	line "sobre que van"
	cont "las cosas."
	
	para "Pero tengo metas"
	line "mayores. ¡Voy a"
	cont "ver al PROF. OAK"
	cont "en KANTO!"
	
	para "Me convertire en"
	line "su asistente y"
	cont "sere un inves-"
	cont "tigador."
	
	para "Nos vemos en "
	line "PUEBLO PALETA,"
    cont "<PLAYER>."
	cont "No como entre-"
	cont "nador,¡Si no"
	cont "CAMPEON!"
	done
	
TraceyVR_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step_end
	
VictoryRoadExitRareCandy:
	itemball RARE_CANDY

VictoryRoadExitPPMax:
	itemball PP_MAX
	
VictoryRoadExitHiddenNugget:
	dwb EVENT_VICTORY_ROAD_EXIT_HIDDEN_NUGGET, NUGGET
	
VictoryRoadExitHiddenRevive:
	dwb EVENT_VICTORY_ROAD_EXIT_HIDDEN_REVIVE, REVIVE

VictoryRoadExitRoom_MapEventHeader::

.Warps: db 2
	warp_def 33,  5, 12, ROUTE_69_SOUTH
	warp_def 11, 25, 13, ROUTE_69_SOUTH

.CoordEvents: db 0

.BGEvents: db 2
	signpost 30,  2, SIGNPOST_ITEM, VictoryRoadExitHiddenNugget
	signpost 26, 10, SIGNPOST_ITEM, VictoryRoadExitHiddenRevive

.ObjectEvents: db 3
	person_event SPRITE_TRACEY,  3, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VictoryRoadTraceyScript, EVENT_VICTORY_ROAD_TRACEY
	person_event SPRITE_POKE_BALL, 18,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadExitRareCandy, EVENT_VICTORY_ROAD_EXIT_RARE_CANDY
	person_event SPRITE_POKE_BALL,  8,  8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadExitPPMax, EVENT_VICTORY_ROAD_EXIT_PP_MAX
