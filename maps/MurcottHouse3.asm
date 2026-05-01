const_value = 1

MurcottHouse3_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottPharmacistScript:
	faceplayer
	opentext
	writetext PharmacistText1
	yesorno
	iftrue .MakeMedicine
	closetext
	end
	
.MakeMedicine:
	checkitem PINKAN_BERRY
	iffalse .NoBerries
	writetext PharmacistText2
	verbosegiveitem PINK_CURE
	iffalse PharmacistDoneScript
	takeitem PINKAN_BERRY
	waitbutton
	closetext
	end
	
.NoBerries:
	writetext PharmacistText3
	waitbutton
	closetext
	end
	
PharmacistDoneScript:
	closetext
	end
	
PharmacistText1:
	text "Hola. Soy el"
	line "farmaceútico."
	
	para "Si me traes una"
	line "Baya Pinkan,"
	cont "puedo hacer una"
	cont "cura al rosa."
	
	para "¿Necesitas que"
	line "cree alguna"
	cont "medicina?"
	done
	
PharmacistText2:
	text "Okey, te "
	line "lo hago ahora."
	
	para "<...>"
	
	para "<...>"
	
	para "¡Aquí tienes!"
	done

PharmacistText3:
	text "No tienes bayas"
	line "Pinkan."
	done

MurcottHouse3_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, MURCOTT_ISLAND
	warp_def 7, 3, 4, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_PHARMACIST, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MurcottPharmacistScript, -1

