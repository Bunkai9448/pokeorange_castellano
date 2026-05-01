const_value = 1
	const MURCOTT_NURSE
	const MURCOTT_SLOUCH

MurcottPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottNurseScript:
	jumpstd pokecenternurse

MurcottSlouchScript:
	opentext
	writetext MurcottSlouchText
	waitbutton
	closetext
	end

MurcottSlouchText:
	text "Sube las esca-"
	line "leras de la case-"
	cont "ta y mira por los"
	cont "binoculares."
	done
	
MurcottSightseerScript:
	jumptextfaceplayer MurcottSightseerText
	
MurcottSightseerText:
	text "Las islas del"
	line "sur son bastante"
	cont "pintorescas, ¿No"
	cont "crees?"
	
	para "No aguanto hasta"
	line "ir a KUMQUAT o"
	cont "TROVITOPOLIS."
	
	para "Grandes tiendas, "
	line "hoteles 5 estre-"
	cont "llas...¡Y las"
	cont "mejores playas!"
	done
	
MurcottLuckyEggScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .CanGetLuckyEgg
	writetext MurcottCenterOldLadyText
	waitbutton
	closetext
	end
.CanGetLuckyEgg:
	checkevent EVENT_MURCOTT_LUCKY_EGG
	iftrue .AlreadyGotLuckyEgg
    writetext GiveLuckyEggText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse MurcottLuckyEggDoneScript
	setevent EVENT_MURCOTT_LUCKY_EGG
	closetext
	end

.AlreadyGotLuckyEgg:
    writetext GotLuckyEggText
	waitbutton
	closetext
	end

MurcottLuckyEggDoneScript:
	closetext
	end
	
GiveLuckyEggText:
	text "¡Oh! Pareces un"
	line "joven entrenador"
	cont "con hambre."
	
	para "¡Toma esto!"
	line "¡Seguro que te"
	cont "ayuda!"
	done
	
GotLuckyEggText:
	text "¡Me encantan los"
	line "huevos revueltos!"
	done
	
MurcottCenterOldLadyText:
	text "¿Un entrenador?"
	line "No pareces nece-"
	cont "sitar un buen "
	cont "desayuno ya."
	
	para "Ven a ver a la"
	line "abuela cuando"
	cont "tengas hambre."
	done

MurcottPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 5, MURCOTT_ISLAND
	warp_def 7, 5, 5, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottSlouchScript, -1
	person_event SPRITE_SIGHTSEER_F, 6, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MurcottSightseerScript, -1
	person_event SPRITE_GRANNY, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MurcottLuckyEggScript, -1

