const_value = 1
	const ROUTE49_YOUNGSTER
	const ROUTE49_FRUIT_TREE
	const ROUTE49_FISHER
	const ROUTE49_COOLTRAINER_M2
	const ROUTE49_TUSCANY
	const ROUTE49_POKE_BALL
	const ROUTE49_BUG_BITE_TUTOR

Route49_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route49YoungsterScript:
	jumptextfaceplayer Route49YoungsterText

Route49TeacherScript:
	jumptextfaceplayer Route49TeacherText

Route49FisherScript:
	jumptextfaceplayer Route49FisherText
	end

CooltrainerMScript_0x1a1031:
	faceplayer
	opentext
	checkday
	iftrue .day_morn
	checknite
	iftrue .nite
.day_morn
	writetext Text_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Text_WaitingForMorning
	waitbutton
	closetext
	end

Route49Sign:
	jumptext Route49SignText

Route49FruitTree:
	fruittree FRUITTREE_ROUTE_49

Route49FreshWater:
	itemball FRESH_WATER

Route49YoungsterText:
	text "Yo. Es un"
	line "buen #MON."

	para "Pero ten cuidado."
	line "He escuchado que"

	para "hay gente sospe-"
	line "chosa merodeando."
	done

Route49TeacherText:
	text "¡Ey! He atrapado"
	line "un RATTATA muy"
	cont "raro. ¡Es negro!"
	done

Route49FisherText:
	text "¿Sabes? La"
	line "PROF.IVY una vez"

	para "salvo un RATICATE"
	line "envenenado por"
	cont "VILEPLUME."
	done

Text_WaitingForNight:
	text "Estoy esperando"
	line "los #MON que"

	para "solo aparecen"
	line "por la noche."
	done

Text_WaitingForMorning:
	text "Estoy esperando"
	line "los #MON que"

	para "solo aparecen"
	line "por el día."
	done

Route49SignText:
	text "RUTA 49"
	line "ISLA VALENCIA"
	done
	
Route49HiddenUltraBall:
	dwb EVENT_ROUTE_49_HIDDEN_ULTRA_BALL, ULTRA_BALL
	
Route49BugBiteTutor:
	faceplayer
	opentext
	writetext GivePlayerBugBiteText
	yesorno
	iffalse .TutorRefused
	writebyte BUG_BITE
	writetext Text_BugBiteTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_BugBiteTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_BugBiteTutorTaught
	waitbutton
	closetext
	end

GivePlayerBugBiteText:
	text "¡Hare que te"
	line "pique un bicho"
	cont "si no me dejas"
	cont "solo!"
	
	para "¿O quieres que"
	line "te enseñe?"
	
	para "¿Quieres aprender"
	line "PICADURA?"
	done
	
Text_BugBiteTutorTaught:
	text "¡Picadura puede"
	line "quitar las bayas"
	cont "del rival!"
	done
	
Text_BugBiteTutorRefused:
	text "¡Entonces vete!"
	done
	
Text_BugBiteTutorClear:
	text ""
	done

Route49_MapEventHeader::

.Warps: db 1
	warp_def 7, 9, 2, VALENCIA_PORT

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 31, SIGNPOST_READ, Route49Sign
	signpost 26, 18, SIGNPOST_ITEM, Route49HiddenUltraBall

.ObjectEvents: db 7
	person_event SPRITE_YOUNGSTER, 18, 23, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route49YoungsterScript, -1
	person_event SPRITE_COOLTRAINER_F, 12, 13, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route49TeacherScript, -1
	person_event SPRITE_FRUIT_TREE, 4, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route49FruitTree, -1
	person_event SPRITE_YOUNGSTER, 16, 30, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route49FisherScript, -1
	person_event SPRITE_COOLTRAINER_M, 12, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_POKE_BALL, 6, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route49FreshWater, EVENT_ROUTE_49_FRESH_WATER
	person_event SPRITE_BUG_BOY, 27, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route49BugBiteTutor, -1

