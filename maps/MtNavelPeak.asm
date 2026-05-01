const_value = 1
	const NAVELPEAK_DANNY
	const NAVELPEAK_ITEMBALL

MtNavelPeak_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

DannyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_DANNY
	iftrue .FightDone
	writetext WelcomeToPeakText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	blackoutmod NAVEL_ISLAND
	opentext
	writetext LetsBattleDanny
	winlosstext DannyWinLossText, 0
	loadtrainer DANNY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DANNY
	opentext
	writetext YouEarnedSeaRubyText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SEA_RUBY_BADGE
	clearevent EVENT_UNNAMED_POKE_CENTER_MISTY
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_HAIL
	iftrue .SpeechAfterTM
	writetext ThatBadgeWillText
	buttonsound
	verbosegiveitem TM_HAIL
	iffalse .NoRoomForHail
	setevent EVENT_GOT_TM_HAIL
	closetext
	end

.SpeechAfterTM:
	writetext DannyBeatenText
	waitbutton
.NoRoomForHail:
	closetext
	end

WelcomeToPeakText:
	text "Bienvenido."

	para "Soy el escalador"
	line "mundialmente"
	cont "conocido, DANNY."

	para "Poca gente puede"
	line "escalar hasta"
	cont "este pico y"
	cont "tiene fuerza"
	cont "para aguantar."

	para "Has superado"
	line "este pico,eso"
	cont "te da derecho a"
	cont "combatir contra"
	cont "mi."

	para "Primero,"
	line "permiteme curar"
	cont "tus #MON."
	done

LetsBattleDanny:
	text "Bueno,"
	line "¿Comenzamos?"
	done

DannyWinLossText:
	text "Oh, parece"
	line "que tenemos una"
	cont "estrella en"
	cont "ciernes."
	done

YouEarnedSeaRubyText:
	text "<PLAYER> obtuvo"
	line "la MEDALLA"
	cont "RUBI MARINO."
	done

ThatBadgeWillText:
	text "Eres alguien"
	line "con coraje."
	cont "Escalaste esta"
	cont "brutal montaña"
	cont "y me has vencido."

	para "La medalla RUBI"
	line "MARINO hará que"
	cont "los #MON de"
	cont "nivel superior"
	cont "al 50 te"
	cont "obedezcan."

	para "Toma, un regalo"
	line "de mi parte."
	done

DannyBeatenText:
	text "Todavia tienes"
	line "un largo camino"
	cont "que recorrer."

	para "Tu siguiente"
	line "parada es "
	cont "ISLA TROVITA."
	done

NavelPeakEscapeRope:
	itemball ESCAPE_ROPE

MtNavelPeak_MapEventHeader::

.Warps: db 1
	warp_def 13, 11, 5, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_DANNY, 8, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DannyScript, -1
	person_event SPRITE_POKE_BALL, 12, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, NavelPeakEscapeRope, EVENT_NAVEL_PEAK_ESCAPE_ROPE
