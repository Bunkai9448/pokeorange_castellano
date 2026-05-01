const_value = 1
	const PUMMELO_NURSE
	const PUMMELO_SLOUCH
	const PUMMELO_CENTER_FISHER

PummeloCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloNurseScript:
	jumpstd pokecenternurse

PummeloSlouchScript:
	opentext
	writetext PummeloSlouchText
	waitbutton
	closetext
	end

PummeloSlouchText:
	text "Dicen que un"
	line "campeon del"
	cont "ORANGE CREW se"
	cont "se hundio en"
	
	para "el mar hace"
	line "300 años. Debio"
	cont "ser cerca de"
	cont "ISLA MORO"
	done
	
PummeloCenterFisherScript:
	jumptextfaceplayer PummeloCenterFisherScriptText
	
PummeloCenterFisherScriptText:
	text "Estoy viendo"
	line "paredes rocosas"
	cont "que parecen"
	cont "escalables"
	
	para "Seria maravilloso"
	line "que un mov."
	cont "#MON pudiera"
	cont "hacerlo."
	done

PummeloCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 11, PUMMELO_ISLAND
	warp_def 7, 5, 11, PUMMELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloSlouchScript, -1
	person_event SPRITE_FISHER, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloCenterFisherScript, -1
