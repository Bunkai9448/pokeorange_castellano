const_value = 1
	const TANGELO_JUNGLE_CROSS
	const TANGELOJUNGLE_POKE_BALL1
	const TANGELOJUNGLE_LASS
	const TANGELOJUNGLE_YOUNGSTER2
	const TANGELOJUNGLE_POKE_BALL2
	const TANGELOJUNGLE_POKE_BALL3
	const TANGELOJUNGLE_POKE_BALL4
	const TANGELO_JUNGLE_BUG_BOY
	const TANGELO_JUNGLE_BUG_BOY2
	const TANGELO_JUNGLE_NESS
	const TANGELO_JUNGLE_ROCK1
	const MEW_TANGELO_JUNGLE

TangeloJungle_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TangeloJungleMewScript:	
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon MEW, 50
	startbattle
	disappear MEW_TANGELO_JUNGLE
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_TANGELO_JUNGLE_MEW_FOUGHT
	end
	
MewText:
	text "¡Mew!"
	done

TangeloRock:
	jumpstd smashrock

TrainerBug_catcherWayne:
	trainer EVENT_BEAT_BUG_CATCHER_MIKE, BUG_CATCHER, MIKE, Bug_catcherWayneSeenText, Bug_catcherWayneBeatenText, 0, Bug_catcherWayneScript

Bug_catcherWayneScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherWayneAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherMushi:
	trainer EVENT_BEAT_BUG_CATCHER_MUSHI, BUG_CATCHER, MUSHI, Bug_catcherMushiSeenText, Bug_catcherMushiBeatenText, 0, Bug_catcherMushiScript

Bug_catcherMushiScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherMushiAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherAlex:
	trainer EVENT_BEAT_BUG_CATCHER_ALEX, BUG_CATCHER, ALEX, Bug_catcherAlexSeenText, Bug_catcherAlexBeatenText, 0, Bug_catcherAlexScript

Bug_catcherAlexScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherAlexAfterText
	waitbutton
	closetext
	end

TrainerYoungsterNess:
	trainer EVENT_BEAT_YOUNGSTER_NESS, YOUNGSTER, NESS, YoungsterNessSeenText, YoungsterNessBeatenText, 0, YoungsterNessScript

YoungsterNessScript:
	end_if_just_battled
	opentext
	writetext YoungsterNessAfterText
	waitbutton
	closetext
	end

TangeloJungleLassScript:
	jumptextfaceplayer Text_TangeloJungleLass

TangeloJunglePoisonBarb:
	itemball POISON_BARB

TangeloJungleSuperPotion:
	itemball SUPER_POTION

TangeloJungleAntidote:
	itemball ANTIDOTE

TangeloJungleEther:
	itemball ETHER

TangeloJungleHiddenEther:
	dwb EVENT_TANGELO_JUNGLE_HIDDEN_ETHER, ETHER

TangeloJungleHiddenSuperPotion:
	dwb EVENT_TANGELO_JUNGLE_HIDDEN_SUPER_POTION, SUPER_POTION

TangeloJungleHiddenFullHeal:
	dwb EVENT_TANGELO_JUNGLE_HIDDEN_FULL_HEAL, FULL_HEAL

MapTangeloJungleSignpost4Script:
	jumptext Text_TangeloJungleSignpost4

Text_TangeloJungleLass:
	text "¡Oh, no!¡He"
	line "perdido!"
	cont "Fue mi culpa."

	para "Estaba inten-"
	line "tando atrapar"
	cont "un PIKACHU."
	done

Text_TangeloJungleSignpost4:
	text "JUNGLA TANGELO"
	line "¡ADVERTENCIA!"

	para "Los #MON "
	line "salvajes son"
	cont "muy peligrosos."
	cont "TEN CUIDADO."
	done

Bug_catcherWayneSeenText:
	text "Esta JUNGLA es"
	line "enorme. Demasiados"
	cont "#MON tipo bicho."
	done

Bug_catcherWayneBeatenText:
	text "¿Huh? ¿Perdí?"
	done

Bug_catcherWayneAfterText:
	text "Incluso si no"
	line "te gustan los"
	cont "#MON tipo bicho,"
	cont "hay otros #MON"
	cont "aqui."
	done

Bug_catcherMushiSeenText:
	text "¿Hm? ¡No eres un"
	line "BUTTERFREE!"
	done

Bug_catcherMushiBeatenText:
	text "¡Quiero un"
	line "BUTTERFREE!"
	done

Bug_catcherMushiAfterText:
	text "BUTTERFREE a"
	line "veces aparece"
	cont "en esta JUNGLA."
	done

Bug_catcherAlexSeenText:
	text "¡Soy un co-"
	line "leccionista de"
	cont "bichos! ¡Los"
	cont "quiero todos!"
	done

Bug_catcherAlexBeatenText:
	text "Nunca dije de"
	line "combatir<...>"
	done

Bug_catcherAlexAfterText:
	text "He oido que hay"
	line "sobre 80 #MON"
	cont "tipo BICHO."

	para "¡Quiero hacerme"
	line "con todos"
	done

YoungsterNessSeenText:
	text "Ey, entrenador,"
	line "No pareces gran"
	cont "cosa. ¡Yo te"
	cont "enseñaré!"
	done

YoungsterNessBeatenText:
	text "¡No me has ga-"
	line "nado! Perdí a"
	cont "proposito."
	done

YoungsterNessAfterText:
	text "¿Crees que eres"
	line "un tipo duro"
	cont "despues de que"
	cont "perdí a pro-"
	cont "posito?"

	para "¡QUE PERDEDOR!"
	done
	
CrossBattle1Script:
	faceplayer
;	playmusic MUSIC_CROSS_ENCOUNTER
	showemote EMOTE_SHOCK, TANGELO_JUNGLE_CROSS, 15
	opentext
	writetext CrossJungleText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossJungleWinLoss, 0
	setlasttalked TANGELO_JUNGLE_CROSS
	loadtrainer CROSS, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotCharmander:
	winlosstext CrossJungleWinLoss, 0
	setlasttalked TANGELO_JUNGLE_CROSS
	loadtrainer CROSS, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossJungleWinLoss, 0
	setlasttalked TANGELO_JUNGLE_CROSS
	loadtrainer CROSS, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
;	playmusic MUSIC_CROSS_ENCOUNTER
	opentext
	writetext CrossJungleLeavingNowText
	waitbutton
	closetext
	applymovement TANGELO_JUNGLE_CROSS, CrossJungle_Movement
	disappear TANGELO_JUNGLE_CROSS
	playsound SFX_ENTER_DOOR
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	setevent EVENT_TANGELO_JUNGLE_CROSS
	end
	

CrossJungleText:
	text "???: ¿Huh?"

	para "¿Quién se inter-"
	line "pone en mi camino?"

	para "<...>"
	
	para "<PLAYER>? Nunca"
	line "he oido sobre ti."

	para "Bueno, como ya"
	line "estoy preparado,"
	cont "me presentare."

	para "CROSS: Soy CROSS,"
	line "aquel que sera"
	cont "el entrenador"
	cont "definitivo usando"

	para "solo la fuerza."
	line "¡Deja que te lo"
	cont "demuestre!"
	done
	
CrossJungleWinLoss:
	text "Tiene que ser"
	line "una broma."
	done
	
CrossJungleLeavingNowText:
	text "CROSS: ¡Hmph!"

	para "¡No pienses que"
	line "has ganado!"
	cont "¡Volveré mucho"
	cont "mas fuerte!"

	para "¡Recuerdalo,"
	line "<PLAYER>!"
	done
	
CrossJungle_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

TangeloJungle_MapEventHeader::

.Warps: db 3
	warp_def 5, 25, 3, ROUTE_52_TANGELO_JUNGLE_GATE
	warp_def 52, 43, 1, ROUTE_51_TANGELO_JUNGLE_GATE
	warp_def 53, 43, 2, ROUTE_51_TANGELO_JUNGLE_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 42, 25, SIGNPOST_ITEM, TangeloJungleHiddenEther
	signpost 17, 37, SIGNPOST_ITEM, TangeloJungleHiddenSuperPotion
	signpost 26, 4, SIGNPOST_ITEM, TangeloJungleHiddenFullHeal
	signpost 51, 39, SIGNPOST_UP, MapTangeloJungleSignpost4Script


.ObjectEvents: db 12
	person_event SPRITE_ROCKER, 6, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CrossBattle1Script, EVENT_TANGELO_JUNGLE_CROSS
	person_event SPRITE_POKE_BALL, 26, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJunglePoisonBarb, EVENT_TANGELO_JUNGLE_POISON_BARB
	person_event SPRITE_YOUNGSTER, 37, 20, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TangeloJungleLassScript, -1
	person_event SPRITE_BUG_BOY, 6, 31, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 0, TrainerBug_catcherWayne, -1
	person_event SPRITE_BUG_BOY, 24, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherMushi, -1
	person_event SPRITE_BUG_BOY, 13, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherAlex, -1
	person_event SPRITE_POKE_BALL, 14, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJungleSuperPotion, EVENT_TANGELO_JUNGLE_SUPER_POTION
	person_event SPRITE_POKE_BALL, 44, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJungleAntidote, EVENT_TANGELO_JUNGLE_ANTIDOTE
	person_event SPRITE_POKE_BALL, 14, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJungleEther, EVENT_TANGELO_JUNGLE_ETHER
	person_event SPRITE_YOUNGSTER, 31, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterNess, -1
	person_event SPRITE_ROCK, 12, 47, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TangeloRock, -1
	person_event SPRITE_MEW,  4, 46, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, 0, 0, TangeloJungleMewScript, EVENT_TANGELO_JUNGLE_MEW_FOUGHT

