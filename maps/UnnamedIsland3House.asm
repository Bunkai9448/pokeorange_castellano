const_value = 1
	const UNNAMED_ISLAND_3_JESSIE
	const UNNAMED_ISLAND_3_JAMES
	const UNNAMED_ISLAND_3_MEOWTH

UnnamedIsland3House_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

UnnamedIsland3JessieScript:
	jumptext UnnamedIsland3JessieText
	
UnnamedIsland3JessieText:
	text "Ohh<...>"
	line "Prepare for<...>"
	cont "twerp<...>"
	done
	
UnnamedIsland3JamesScript:
	jumptext UnnamedIsland3JamesText

UnnamedIsland3JamesText:
	text "MEOWTH<...>"
	line "Tell<...>GROWLIE."
	cont "DADDY loves him<...>"
	done
	
UnnamedIsland3MeowthScript:
	faceplayer
	showemote EMOTE_SHOCK, UNNAMED_ISLAND_3_MEOWTH, 15
	opentext
	checkitem SALVEYO_WEED
	iftrue .HaveSalveyoWeed
	writetext MeowthNeedsSalveyoWeedText
	waitbutton
	closetext
	end
	
.HaveSalveyoWeed
	writetext GiveMeowthSalveyoWeedText
	yesorno
	iffalse .DontGiveSalveyoWeed
	closetext
	takeitem SALVEYO_WEED
	spriteface UNNAMED_ISLAND_3_MEOWTH, LEFT
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	applymovement PLAYER, UnnamedIsland3PlayerMovement
	spriteface PLAYER, RIGHT
	spriteface UNNAMED_ISLAND_3_MEOWTH, DOWN
	applymovement UNNAMED_ISLAND_3_MEOWTH, UnnamedIsland3MeowthMovement
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	spriteface UNNAMED_ISLAND_3_MEOWTH, RIGHT
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	spriteface UNNAMED_ISLAND_3_MEOWTH, LEFT
	opentext
	writetext MeowthDoneHealingText
	waitbutton
	verbosegiveitem HM_WATERFALL
	writetext MeowthLeavingUnnamedIsland3Text
	waitbutton
	closetext
	disappear UNNAMED_ISLAND_3_JESSIE
	disappear UNNAMED_ISLAND_3_JAMES
	disappear UNNAMED_ISLAND_3_MEOWTH
	special Special_FadeInQuickly
	end
	
	
.DontGiveSalveyoWeed:
	writetext DidntGiveSalveyoWeedText
	waitbutton
	closetext
	end

MeowthNeedsSalveyoWeedText:
	text "¡Tu, el idiota!"
	
	para "Se que hemos te-"
	line "nido<...>diferen-"
	cont "cias, pero...¡Mis"
	cont "compañeros estan"
	cont "en apuros!"
	
	para "¡Han tenido una"
	line "fiebre subita!"
	
	para "Respiraron el"
	line "polen de unas"
	cont "flores que eran"
	cont "un terrible VILE-"
	
	para "PLUME. Se que"
	line "te sorprende, pero"
	cont "necesito que les"
	cont "eches un vistazo."
	
	para "¿Serias mi amigo"
	line "y le traerias "
	cont "semilla SALVEYO"
	cont "al gato?"
	
	para "Crece en los"
	line "estanques de aqui."
	done
	
GiveMeowthSalveyoWeedText:
	text "Mis compañeros "
	line "estan enfermos, "
	cont "necesitan la semi-"
	cont "lla SALVEYO."
	
	para "¿Dar SEMILLA"
	line "SALVEYO a MEOWTH?"
	done
	
DidntGiveSalveyoWeedText:
	text "¡Ya estoy aqui,"
	line "chicos!"
	done
	
MeowthDoneHealingText:
	text "Deberian poner-"
	line "se mejor."
	
	para "No eres tan ma-"
	line "lo despues de"
	cont "todo..."
	
	para "Toma esto, no"
	line "es mucho<...>"
	
	para "Lo encontre en"
	line "las cloacas,"
	cont "pero te lo doy."
	done
	
MeowthLeavingUnnamedIsland3Text:
	text "Bueno, sera"
	line "hora de irse."
	
	para "¡Y no le cuentes"
	line "a JESSIE y JAMES"
	cont "que les has"
	cont "salvad!"
	done
	
UnnamedIsland3PlayerMovement:
	step DOWN
	step LEFT
	step_end
	
UnnamedIsland3MeowthMovement:
	step DOWN
	step DOWN
	step_end
	

UnnamedIsland3House_MapEventHeader::

.Warps: db 2
	warp_def  5,  2, 1, UNNAMED_ISLAND_3
	warp_def  5,  3, 1, UNNAMED_ISLAND_3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_JESSIE,  4,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, 0, 0, UnnamedIsland3JessieScript, EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED
	person_event SPRITE_JAMES,  2,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3JamesScript, EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED
	person_event SPRITE_ROCKET_MEOWTH,  2,  6, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, UnnamedIsland3MeowthScript, EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED

