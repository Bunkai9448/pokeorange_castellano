const_value = 1
	const SHAMOUTI_SHRINE_SLOWKING
	const SHAMOUTI_SHRINE_MELODY
	const SHAMOUTI_SHRINE_LUGIA

ShamoutiShrine_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ShamoutiShrineSlowkingScript:
	opentext
	checkevent EVENT_MELODY_SENDS_YOU_TO_SHRINE
	iftrue .SlowkingWarp
	writetext ShamoutiShrineSlowkingText1
	cry SLOWKING
	waitbutton
	closetext
	end
	
.SlowkingWarp
	writetext ShamoutiShrineSlowkingText2
	yesorno
	iftrue .YesToSlowkingWarp
	closetext
	end
	
.YesToSlowkingWarp
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp AIRSHIP_OUTSIDE, 8, 14
	end
	
MelodyShrine:
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .AlreadyFoughtLugia
	faceplayer
	opentext
	writetext OrbCheckText
	waitbutton
	checkitem ELECTRIC_ORB
	iffalse .NeedMoreOrbs
	checkitem ICE_ORB
	iffalse .NeedMoreOrbs
	checkitem FIRE_ORB
	iffalse .NeedMoreOrbs
	writetext ReadyToSummonLugiaText
	yesorno
	iftrue .SummonLugia
	closetext
	end
	
.NeedMoreOrbs:
	writetext NeedMoreOrbsText
	waitbutton
	closetext
	spriteface SHAMOUTI_SHRINE_MELODY, UP
	end
	
.SummonLugia:
	closetext
	applymovement PLAYER, ShamoutiShrinePlayerMovement1
	spriteface PLAYER, RIGHT
	applymovement SHAMOUTI_SHRINE_MELODY, ShamoutiShrineMelodyMovement1
	spriteface SHAMOUTI_SHRINE_MELODY, UP
	applymovement PLAYER, ShamoutiShrinePlayerMovement2
	special Special_FadeOutMusic
	pause 15
	playsound SFX_GLASS_TING
	pause 15
	playsound SFX_GLASS_TING
	pause 15
	playsound SFX_GLASS_TING
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	opentext
	writetext SummonLugiaText
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	pause 15
	opentext
	writetext LugiaCryText
	cry LUGIA
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	clearevent EVENT_LUGIA_APPEARS
	appear SHAMOUTI_SHRINE_LUGIA
	applymovement SHAMOUTI_SHRINE_LUGIA, LugiaShamoutiShrineMovement
	writecode VAR_BATTLETYPE, BATTLETYPE_LUGIA
	loadwildmon LUGIA, 70
	startbattle
	disappear SHAMOUTI_SHRINE_LUGIA
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_LUGIA_FOUGHT
	setevent EVENT_LUGIA_APPEARS
	takeitem ELECTRIC_ORB
	takeitem ICE_ORB
	takeitem FIRE_ORB
	end
	
.AlreadyFoughtLugia
	faceplayer
	opentext
	checkevent EVENT_ENTERED_KANTO
	iftrue .BeenGoneAWhile
	writetext LugiaAlreadyFoughtText
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	end
	
.BeenGoneAWhile
	writetext BeenGoneAWhileText
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	end
	
ShamoutiShrinePlayerMovement1:
	step LEFT
	step_end
	
ShamoutiShrineMelodyMovement1:
	step DOWN
	step RIGHT
	step_end
	
ShamoutiShrinePlayerMovement2:
	step RIGHT
	step UP
	step UP
	step_end
	
LugiaShamoutiShrineMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

OrbCheckText:
	text "MELODY: ¡Has"
	line "vuelto!"
	
	para "¡Rápido, mues-"
	line "trame los tesoros!"
	
	para "<...>"
	done
	
NeedMoreOrbsText:
	text "Parece que falta"
	line "alguno de los"
	cont "tesoros."
	
	para "¡Rápido, vuelva"
	line "a las islas y"
	cont "consiguelo!"
	done
	
ReadyToSummonLugiaText:
	text "¡Genial, los"
	line "conseguiste!"
	
	para "¿Estás listo?"
	done
	
SummonLugiaText:
	text "MELODY: Ok, Voy"
	line "a tocar la"
	cont "canción del dios"
	cont "del mar."
	cont "¡Prepárate!"
	done
	
ShamoutiShrineText:
	jumptext ShamoutiShrineText1
	
ShamoutiShrineText1:
	text "Los dioses del"
	line "fuego, trueno y"
	cont "hielo nunca deben"
	cont "ser perturbados."
	
	para "De lo contrario,"
	line "tierra y cielo"
	cont "convergeran y"
	cont "eso llevara al"
	cont "mundo a la"
	cont "destrucción."
	
	para "El dios del mar"
	line "aparece para"
	cont "detener el cata-"
	cont "clismo pero no"
	cont "evitará la"
	cont "destrucción."
	
	para "La armonía solo"
	line "sera posible"
	cont "cuando aparezca"
	cont "un entrenador"
	cont "poderoso."
	done
	
ShamoutiShrineSlowkingText1:
	text "Slowwww."
	done
	
ShamoutiShrineSlowkingText2:
	text "Se esta muy"
	line "tranquilo,¿Será"
	cont "tener el mar"
	cont "cerca?"
	
	para "Ah, ¿El castillo"
	line "volador de arriba?"
	
	para "Puedo teletrans-"
	line "portate allí."
	cont "¿Quieres?"
	
	para "No te garantizo"
	line "que vayas a"
	cont "aterrizar en un"
	cont "lugar seguro."
	done
	
LugiaAlreadyFoughtText:
	text "MELODY: ¡Gracias"
	line "por salvarnos,"
	cont "<PLAYER>!"
	
	para "Ahora que la"
	line "profecía ha sido"
	cont "cumplida supongo"
	cont "gue nos tocara"
	cont "despedirnos<...>"
	
	para "Asegurate de"
	line "visitarme, ¡tocare"
	cont "mi ocarina para"
	cont "ti!"
	done
	
BeenGoneAWhileText:
	text "MELODY: ¡Ey,"
	line "<PLAYER>!"
	cont "¡Que bueno que"
	cont "viniste!"
	
	para "La aeronave toda-"
	line "vía esta en el "
	cont "cielo. Espero"
	cont "que ese tipo no"
	cont "este tramando"
	cont "nada."
	done
	
LugiaCryText:
	text "¡Gyaaaaaaah!"
	done

ShamoutiShrine_MapEventHeader::

.Warps: db 1
	warp_def $11, $6, 2, SHAMOUTI_CAVE
	
.CoordEvents: db 0

.BGEvents: db 1
	signpost  8, 11, SIGNPOST_READ, ShamoutiShrineText

.ObjectEvents: db 3
	person_event SPRITE_SLOWKING, 14, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, ShamoutiShrineSlowkingScript, -1
	person_event SPRITE_JASMINE, 10, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MelodyShrine, EVENT_MELODY_AT_SHRINE
	person_event SPRITE_LUGIA,  4, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, 0, EVENT_LUGIA_APPEARS
