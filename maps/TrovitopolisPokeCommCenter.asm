const_value = 1
	const TROVITOPOLIS_NURSE

TrovitopolisPokeCommCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisNurseScript:
	jumpstd pokecenternurse
	
TrovitopolisPokeCommLassScript:
	jumptextfaceplayer TrovitopolisPokeCommLassText
	
TrovitopolisPokeCommLassText:
	text "Hey! You can trade"
	line "and battle other"
	cont "people upstairs!"
	done

TrovitopolisPokeCommRockerScript:
	jumptextfaceplayer TrovitopolisPokeCommRockerText
	
TrovitopolisPokeCommRockerText:
	text "THE FACILITY THERE"
	line "CAN'T BE USED NOW."
	
	para "IT WILL FEEL GOOD"
	line "TO GO TO THE HEAR-"
	cont "SAID PLACE EARLIER"
	
	para "<...>"
	
	para "Lo siento. Vengo"
	line "de la JOHTO"
	cont "vietnamita."
	done

TrovitopolisPokeCommTeacherScript:
	jumptextfaceplayer TrovitopolisPokeCommTeacherText
	
TrovitopolisPokeCommTeacherText:
	text "Hmm, un sis-"
	line "tema móvil para"
	cont "entrenadores."
	
	para "Quizas sea hora"
	line "de conseguirme"
	cont "uno de esos mo-"
	cont "viles cuquis."
	done
	
TrovitopolisPokeCommScientist1Script:
	jumptext TrovitopolisPokeCommScientist1Text
	
TrovitopolisPokeCommScientist1Text:
	text "<...>"
	
	para "SUKIYAMI: ¡Gah!"
	
	para "¡No! Lo he"
	line "roto mas."
	
	para "PIA me va a"
	line "matar<...>"
	
	para "¡Ya se! Le diré"
	line "a LUNA que lo"
	cont "arregle."
	done
	
TrovitopolisPokeCommScientist2Script:
	jumptext TrovitopolisPokeCommScientist2Text
	
TrovitopolisPokeCommScientist2Text:
	text "<...>"
	
	para "RANGI: Ew<...>"
	
	para "Este código es<...>"
	
	para "muy antiguo."
	line "Me rindo. Vuelvo a"
	cont "POLISHED CRYSTAL."
	done
	
TrovitopolisPokeCommLuckyScript:
	jumptextfaceplayer TrovitopolisPokeCommLuckyText
	
TrovitopolisPokeCommLuckyText:
	text "LUCKY: Se acabo"
	line "el repel<...>"
	
	para "Muchos WINGULL."
	line "Aqui estoy "
	cont "seguro. Fuera es"
	cont "un horror para mi."
	
	para "Al menos en 60"
	line "FPS no me daña la"
	cont "la vista."
	cont "Trabaje en"
	cont "PRISM, ¿Lo sabias?"
	done
	
PokeCommSign:
	jumptext PokeCommSignText
	
PokeCommSignText:
	text "ADMIN ROOM"
	
    para "¡AVISO!"

    para "Nuestro staff"
    line "le da vueltas"
    cont "a cosas que no"
    cont "tienen sentido."
	done
	
APSign:
	jumptext APSignText
	
APSignText:
	text "DE: LINKANDZELDA"
	line "PARA: PIA CRT"

	para "<...>"
	
	para "Debería atreverme"
	line "a leer el E-MAIL"
	cont "de alguien."
	done
	
PokeCommMachineSign:
	jumptext PokeCommMachineSignText
	
PokeCommMachineSignText:
	text "¿Hay un montón de"
	line "nuevos artículos!"
	
	para "Quizas algun día"
	line "me de por leer"
	cont "algo<...>"
	done

PokeCommScientistScript:
	faceplayer
	opentext
	trade 5
	waitbutton
	closetext
	end

TrovitopolisPokeCommCenter_MapEventHeader::

.Warps: db 6
	warp_def 27,  6, 1, TROVITOPOLIS
	warp_def 27,  7, 1, TROVITOPOLIS
	warp_def 18,  0, 5, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def 27,  0, 1, POKECENTER_2F
	warp_def 7, 0, 3, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def 7, 1, 3, TROVITOPOLIS_POKE_COMM_CENTER

.CoordEvents: db 0

.BGEvents: db 18
	signpost 21,  2, SIGNPOST_READ, PokeCommSign
	signpost  2,  5, SIGNPOST_READ, APSign
	signpost 16, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 17, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 18, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 19, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 20, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 21, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 23, 18, SIGNPOST_READ, PokeCommMachineSign
	signpost 23, 17, SIGNPOST_READ, PokeCommMachineSign
	signpost 23, 16, SIGNPOST_READ, PokeCommMachineSign
	signpost 23, 15, SIGNPOST_READ, PokeCommMachineSign
	signpost 21, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 20, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 19, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 18, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 17, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 16, 14, SIGNPOST_READ, PokeCommMachineSign


.ObjectEvents: db 8
	person_event SPRITE_NURSE, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisNurseScript, -1
	person_event SPRITE_LASS, 17, 4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommLassScript, -1
	person_event SPRITE_ROCKER, 9, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommRockerScript, -1
	person_event SPRITE_TEACHER, 18, 10, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommTeacherScript, -1
	person_event SPRITE_LASS, 5, 5, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommScientist1Script, -1
	person_event SPRITE_COOLTRAINER_F, 3, 2, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommScientist2Script, -1
	person_event SPRITE_ROCKER, 5, 0, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommLuckyScript, -1
	person_event SPRITE_SCIENTIST, 13, 13, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokeCommScientistScript, -1


