const_value = 1
	const PINKAN_ISLAND_FRUIT_TREE_1
	const PINKAN_ISLAND_FRUIT_TREE_2
	const PINKAN_ISLAND_FRUIT_TREE_3
	const PINKAN_ISLAND_FRUIT_TREE_4
	const PINKAN_ISLAND_TM
	const PINKAN_ISLAND_REVIVE
	const PINKAN_MANIAC

PinkanIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrainerManiacShawn:
	trainer EVENT_BEAT_POKEMANIAC_SHAWN, PINK_MANIAC, SHAWN, ManiacShawnSeenText, ManiacShawnBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext ManiacShawnAfterText
	waitbutton
	closetext
	end

PinkanIslandSign:
	jumptext PinkanIslandSignText

PinkanTrainerTipsSign:
	jumptext PinkanTrainerTipsSignText

PinkanIslandBulletSeedTM:
	itemball TM_BULLET_SEED

PinkanIslandRevive:
	itemball REVIVE

PinkanIslandHiddenLoveBall:
	dwb EVENT_PINKAN_ISLAND_HIDDEN_LOVE_BALL, LOVE_BALL

PinkanIslandHiddenPinkanBerry:
	dwb EVENT_PINKAN_ISLAND_HIDDEN_PINKAN_BERRY, PINKAN_BERRY

.Text:

ManiacShawnSeenText:
	text "¡Hahaha!"

	para "¡Me he pintado"
	line "para ir a juego"
	cont "con los #MON!"

	para "¿Como te gusta-"
	line "ría?"
	done

ManiacShawnBeatenText:
	text "¡ROSA! ¡ROSA!"
	line "¡ROSAAAAA!"
	done

ManiacShawnAfterText:
	text "¡Me vuelvo loquí-"
	line "simo cuando"
	cont "vengo a ISLA"
	cont "PINKAN!"
	done

PinkanIslandSignText:
	text "ISLA PINKAN,"
	line "AL ESTE ISLA"
	cont "KINNOW"
	done

PinkanTrainerTipsSignText:
	text "PISTA ENT."

	para "Los #MON"
	line "atrapados en ISLA"
	cont "PINKAN son ROSAS"
	cont "permanentemente."
	
	para "Las BAYAS PINKAN"
	line "vuelven los #MON"
	cont "ROSAS."
	done

PinkanIslandFruitTree1:
	fruittree FRUITTREE_PINKAN_ISLAND_1

PinkanIslandFruitTree2:
	fruittree FRUITTREE_PINKAN_ISLAND_2

PinkanIslandFruitTree3:
	fruittree FRUITTREE_PINKAN_ISLAND_3

PinkanIslandFruitTree4:
	fruittree FRUITTREE_PINKAN_ISLAND_4

PinkanIsland_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 4
	signpost 10, 12, SIGNPOST_READ, PinkanIslandSign
	signpost 13, 21, SIGNPOST_READ, PinkanTrainerTipsSign
	signpost 15, 34, SIGNPOST_ITEM, PinkanIslandHiddenLoveBall
	signpost 25, 16, SIGNPOST_ITEM, PinkanIslandHiddenPinkanBerry

.ObjectEvents: db 7
	person_event SPRITE_FRUIT_TREE, 24, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PinkanIslandFruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 17, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PinkanIslandFruitTree2, -1
	person_event SPRITE_FRUIT_TREE, 8, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PinkanIslandFruitTree3, -1
	person_event SPRITE_FRUIT_TREE,  9, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PinkanIslandFruitTree4, -1
	person_event SPRITE_POKE_BALL,  3, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, PinkanIslandBulletSeedTM, EVENT_PINKAN_ISLAND_TM_BULLET_SEED
	person_event SPRITE_POKE_BALL, 16, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, PinkanIslandRevive, EVENT_PINKAN_ISLAND_REVIVE
	person_event SPRITE_SUPER_NERD, 23, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerManiacShawn, -1
