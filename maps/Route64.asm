const_value = 1
	const ROUTE_64_ULTRA_BALL
	const ROUTE_64_CROSS
	const ROUTE_64_TRACEY
	const ROUTE_64_FRUIT_TREE
	const ROUTE_64_YOUNGSTER

Route64_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route64_HiddenHeartScale1:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_1, HEART_SCALE
	
Route64_HiddenHeartScale2:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_2, HEART_SCALE
	
Route64_HiddenHeartScale3:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_3, HEART_SCALE
	
Route64_HiddenHeartScale4:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_4, HEART_SCALE
	
Route64UltraBall:
	itemball ULTRA_BALL
	
Route64FruitTree:
	fruittree FRUITTREE_ROUTE_64

Route64Sign:
	jumptext Route64SignText
	
Route64SignText:
	text "RUTA 64"
	done
	
Route64TraceyCrossEvent:
	playmusic MUSIC_LOOK_GLADION
	spriteface PLAYER, LEFT
	opentext
	writetext TraceyCrossEventText1
	waitbutton
	closetext
	showemote EMOTE_QUESTION, ROUTE_64_TRACEY, 15
	applymovement ROUTE_64_CROSS, ROUTE_64_CROSS_MOVEMENT
	playmusic MUSIC_TRACEY_ENCOUNTER
	spriteface ROUTE_64_TRACEY, UP
	spriteface PLAYER, DOWN
	opentext
	writetext TraceyCrossEventText2
	waitbutton
	closetext
	applymovement PLAYER, ROUTE_64_PLAYER_MOVEMENT
	applymovement ROUTE_64_TRACEY, ROUTE_64_TRACEY_MOVEMENT
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_ROUTE_103
	disappear ROUTE_64_TRACEY
	disappear ROUTE_64_CROSS
	setevent EVENT_ROUTE_64_TRACEYCROSS
	end
	
TraceyCrossEventText1:
	text "TRACEY: Oye, dije"
	line "que podías usar"
	cont "la MO, ¡no"
	cont "tomarla!"
	
	para "¡Resulta que le"
	line "estoy dando esto"
	cont "a <PLAYER>!"
	
	para "CROSS: Mmm. ¿Ese"
	line "nerd, <PLAYER>?"
	cont "¡Jajaja, ni"
	cont "hablar!"
	
	para "¡Los perdedores"
	line "deberían quedarse"
	cont "atrás! No se puede"
	cont "pasar por la ISLA"
	cont "BUTWAL sin"
	cont "esta MO."
	
	para "¡Te lo mereces,"
	line "<PLAYER>!"
	
	para "¡Después de todo,"
	line "me han elegido"
	cont "para ser el más"
	cont "grande!"
	done
	
ROUTE_64_CROSS_MOVEMENT:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
TraceyCrossEventText2:
	text "TRACEY: ¡Ay! ¡No"
	line "puedo creer lo"
	cont "que dijo ese"
	cont "tipo! ¡Dijo que"
	cont "me devolvería la"
	cont "MO enseguida!"
	
	para "Esa MO incluye"
	line "BUCEO. Te permite"
	cont "viajar bajo el"
	cont "agua. ¡Es"
	cont "absolutamente"
	cont "necesario!"
	
	para "Ese tipo era"
	line "demasiado fuerte."
	cont "Pero no me gusta"
	cont "cómo lucha."
	
	para "Tendrás que"
	line "perseguirlo para"
	cont "recuperarlo, me"
	cont "temo."
	
	para "Me pregunto qué"
	line "quiso decir con"
	cont "eso de ser"
	cont "elegido."
	done
	
ROUTE_64_PLAYER_MOVEMENT:
	fix_facing
	step UP
	step UP
	remove_fixed_facing
	step_end
	
ROUTE_64_TRACEY_MOVEMENT:
	step UP
	step UP
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Route64YoungsterScript:
	jumptextfaceplayer Route64YoungsterText

Route64YoungsterText:
	text "Hay dos tipos"
	line "raros que se"
	cont "sientan en la"
	cont "ISLA BUTWAL"
	cont "todo el día."
	
	para "Yo tendría"
	line "cuidado, no les"
	cont "gusta que haya"
	cont "otros"
	cont "entrenadores en"
	cont "su territorio."
	done
	
Route64_MapEventHeader::

.Warps: db 1
	warp_def 17, 28, 1, HEART_SCALE_COVE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 21, 30, SIGNPOST_ITEM, Route64_HiddenHeartScale1
	signpost 23, 22, SIGNPOST_ITEM, Route64_HiddenHeartScale2
	signpost 15, 12, SIGNPOST_ITEM, Route64_HiddenHeartScale3
	signpost  7, 14, SIGNPOST_ITEM, Route64_HiddenHeartScale4
	signpost 19, 23, SIGNPOST_READ, Route64Sign

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 4, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route64UltraBall, EVENT_ROUTE_64_ULTRA_BALL
	person_event SPRITE_ROCKER, 16, 23, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_64_TRACEYCROSS
	person_event SPRITE_TRACEY, 16, 24, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route64TraceyCrossEvent, EVENT_ROUTE_64_TRACEYCROSS
	person_event SPRITE_FRUIT_TREE, 7, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route64FruitTree, -1
	person_event SPRITE_YOUNGSTER, 16, 14, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route64YoungsterScript, -1
