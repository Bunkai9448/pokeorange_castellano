const_value = 1

Trovitopolis_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TROVITOPOLIS
	return
	
TrovitopolisRedCoolTrainerScript:
	faceplayer
	checkevent EVENT_TROVITOPOLIS_SAVED
    iftrue .SavedText
    opentext
    writetext TrovitopolisRedCooltrainerCorruptedText
    waitbutton
    closetext
	end

.SavedText:
	opentext
	writetext TrovitopolisRedCooltrainerSavedText
	waitbutton
	closetext
	end
	
TrovitopolisGreenCoolTrainerScript:
	jumptextfaceplayer TrovitopolisGreenCoolTrainerText
	
TrovitopolisGentlemanScript:
	jumptextfaceplayer TrovitopolisGentlemanText
	
TrovitopolisSailorScript:
	jumptextfaceplayer TrovitopolisSailorText

TrovitopolisGrampsScript:
	faceplayer
	opentext
	writetext TrovitopolisGrampsText
	waitbutton
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .done
	;failsafe to give the rainbow wing on old saves that already beat Cross at Pummelo
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .done ;if you haven't beat the league, we are done (to beat the league you must beat Cross at Pummelo first)
	checkevent EVENT_MARSHADOW_HOOH_EVENT_STARTED
	iftrue .done ;if you triggered this event, you already got the rainbow wing (but may not have it until you beat Cross at route 51)
	checkitem RAINBOW_WING ;you beat Cross on Pummelo, but haven't triggered Marshadow's event (and thus losing the Rainbow Wing), so assume old save and give it to the player
	iftrue .done
	verbosegiveitem RAINBOW_WING
	setevent EVENT_GOT_RAINBOW_WING
	
.done
	closetext
	end

TrovitopolisGrampsText:
	text "A veces choco"
	line "con una pared"
	cont "invisible en"
	cont "las cuevas. ¿No"
	cont "te ha pasado?"
	
	para "Parece una lo-"
	line "cura, pero"
	cont "siento que algo"
	cont "me observa cuando"
	cont "eso ocurre. La"
	cont "leyenda dice que"
	cont "que las plumas"
	cont "del #MON legen-"
	cont "dario HO-OH"
	cont "pueden revelar"
	cont "lo invisible."
	cont "Creo que nunca"
	cont "resolveré el"
	cont "misterio."

	done
	
TrovitopolisRedCooltrainerCorruptedText:
	text "¡El Alcalde sube"
	line "los impurestos!"

	para "Ahora tiene al"
	line "TEAM ROCKET"
	cont "trabajando para"
	cont "él, ellos están"
	
	para "intentando robar"
	line "#MON."
	done
		
TrovitopolisRedCooltrainerSavedText:
	text "¡Ey!¡Eres el chico"
	line "que ha derrotado"
	cont "al TEAM ROCKET!"
	
	para "Saldras en nuestros"
	line "libros de historia,"
	cont "¿Lo sabes?"
	done
	
TrovitopolisGreenCoolTrainerText:
	text "¡RUDY mola!"
	
	para "Entrena con sus"
	line "#MON mientras"
	cont "danzan."
	
	para "¡El es super-"
	line "hermoso!"
	done
	
TrovitopolisGentlemanText:
	text "¡Ohoho!"
	
	para "En el tejado "
	line "de DEPT. STORE,"
	cont "puedes comprar"
	cont "raros #MON."
	done

TrovitopolisSailorText:
	text "¡He visto a la"
	line "mujer mas "
	cont "hermosa!"
	
	para "Creo que se"
	line "llamaba LORELEI."
	cont "Una eminencia"
	cont "de KANTO."
	done
	
TrovitopolisSign:
	jumptext TrovitopolisSignText
	
TrovitopolisSignText:
	text "TROVITOPOLIS"
	
	para "¡La ciudad que"
	line "nunca duerme!"
	done
	
TrovitopolisMayorSign:
	jumptext TrovitopolisMayorSignText
	
TrovitopolisMayorSignText:
	text "OFICINA ALCALDE"
	done
	
TrovitopolisDeptStoreSign:
	jumptext TrovitopolisDeptStoreSignText
	
TrovitopolisDeptStoreSignText:
	text "CENT. COMERCIAL"
	
	para "TIENDA #MON"
	line "EN EL TEJADO"
	done
	
TrovitopolisPortSign:
	jumptext TrovitopolisPortSignText
	
TrovitopolisPortSignText:
	text "PUERTO"
	done
	
TrovitopolisSchoolSign:
	jumptext TrovitopolisSchoolSignText
	
TrovitopolisSchoolSignText:
	text "PRIMA, ESCUELA"
	line "OFICIAL DE"
	cont "ENTRENADORES"
	done

TrovitopolisMoveDeleterSign:
	jumptext TrovitopolisMoveDeleterSignText
	
TrovitopolisMoveDeleterSignText:
	text "QUITA-MOVS"
	done

TrovitopolisMrFlashSign:
	jumptext TrovitopolisMrFlashSignText
	
TrovitopolisMrFlashSignText:
	text "CASA MR. FLASH"
	done
	
TrovitopolisSewerSign:
	jumptext TrovitopolisSewerSignText
	
TrovitopolisSewerSignText:
	text "ENTRADA A LAS"
	line "ALCANTARILLAS"
	done
	
TrovitopolisSailor2Script:
	jumptextfaceplayer TrovitopolisSailor2Text
	
TrovitopolisSailor2Text:
	text "¡El #MON CENTER"
	line "es enorme!"
	
	para "Aparentemente"
	line "puedes combatir"
	cont "e intercambiar"
	cont "dentro."
	done
	
TrovitopolisGroomerSign:
	jumptext TrovitopolisGroomerSignText

TrovitopolisGroomerSignText:
	text "MASAJES #MON "
	done	

TrovitopolisMaxRevive:
	itemball MAX_REVIVE
	
TrovitopolisRareCandy:
	itemball RARE_CANDY
	
TrovitopolisNugget:
	itemball NUGGET
	
TrovitopolisWaterStone:
	itemball WATER_STONE

Trovitopolis_MapEventHeader::

.Warps: db 14
	warp_def 31, 48, 2, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def 3, 23, 1, SEWER_ENTRANCE
	warp_def 15, 36, 1, TROVITOPOLIS_DEPT_STORE_1F
	warp_def 41, 62, 2, SUNRAY_CAVE_MANDARIN_DESERT_1F
	warp_def 5, 55, 1, TROVITOPOLIS_MR_FLASH_HOUSE
	warp_def 21, 45, 1, TROVITOPOLIS_MOVE_DELETER_HOUSE
	warp_def 29, 59, 1, TROVITOPOLIS_HOUSE_1
	warp_def 29, 29, 1, TROVITOPOLIS_HOUSE_2
	warp_def 11, 25, 1, TROVITOPOLIS_HOUSE_3
	warp_def 17, 15, 1, TROVITOPOLIS_HOUSE_4
	warp_def 19, 6, 1, TROVITOPOLIS_PORT
	warp_def 17, 52, 1, MAYORS_OFFICE
	warp_def 21, 18, 1, TROVITOPOLIS_PRIMA_SCHOOL
	warp_def 29, 23, 1, TROVITOPOLIS_GROOMER

.CoordEvents: db 0

.BGEvents: db 9
	signpost 37, 59, SIGNPOST_READ, TrovitopolisSign
	signpost 17, 49, SIGNPOST_READ, TrovitopolisMayorSign
	signpost 15, 37, SIGNPOST_READ, TrovitopolisDeptStoreSign
	signpost 20, 10, SIGNPOST_READ, TrovitopolisPortSign
	signpost 22, 16, SIGNPOST_READ, TrovitopolisSchoolSign
	signpost 22, 46, SIGNPOST_READ, TrovitopolisMoveDeleterSign
	signpost 6, 56, SIGNPOST_READ, TrovitopolisMrFlashSign
	signpost 4, 22, SIGNPOST_READ, TrovitopolisSewerSign
	signpost 30, 24, SIGNPOST_READ, TrovitopolisGroomerSign

.ObjectEvents: db 9
	person_event SPRITE_COOLTRAINER_F, 26, 56, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisRedCoolTrainerScript, -1
	person_event SPRITE_COOLTRAINER_F, 32, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisGreenCoolTrainerScript, -1
	person_event SPRITE_GENTLEMAN, 18, 36, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisGentlemanScript, -1
	person_event SPRITE_GRAMPS, 38, 56, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrovitopolisGrampsScript, -1
	person_event SPRITE_SAILOR, 21, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisSailorScript, -1
	person_event SPRITE_SAILOR, 33, 45, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisSailor2Script, -1
	person_event SPRITE_POKE_BALL, 43, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisMaxRevive, EVENT_TROVITOPOLIS_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 5, 60, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisRareCandy, EVENT_TROVITOPOLIS_RARE_CANDY
	person_event SPRITE_POKE_BALL, 17, 61, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisNugget, EVENT_TROVITOPOLIS_NUGGET
	person_event SPRITE_POKE_BALL, 43, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisWaterStone, EVENT_TROVITOPOLIS_WATER_STONE

