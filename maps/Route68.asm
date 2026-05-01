Route68_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route68Sign:
	jumptext Route68SignText
	
Route68SignText:
	text "RUTA 68"
	
	para "Me gustaria saber"
	line "quien diseña "
	cont "estos mapas..."
	done
;=================================
;=================================
		
TrainerSwimmerFMelly:
	trainer EVENT_BEAT_SWIMMERF_MELLY, SWIMMERF, MELLY, SwimmerFMellySeenText, SwimmerFMellyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFMellyAfterText
	waitbutton
	closetext
	end

SwimmerFMellySeenText:
	text "Los #MON"
	line "de agua son"
	cont "los mejores."
	done

SwimmerFMellyBeatenText:
	text "¡Me mantengo a"
	line "flote!"
	done

SwimmerFMellyAfterText:
	text "¡Me mantengo a"
	line "flote!"
	done
	
;=================================
;=================================
		
TrainerSwimmerFSally:
	trainer EVENT_BEAT_SWIMMERF_SALLY, SWIMMERF, SALLY, SwimmerFSallySeenText, SwimmerFSallyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFSallyAfterText
	waitbutton
	closetext
	end

SwimmerFSallySeenText:
	text "Mi miembro favorito"
	line "del ORANGE CREW es"
	cont "CISSY."
	done

SwimmerFSallyBeatenText:
	text "Aw<...>"
	done

SwimmerFSallyAfterText:
	text "Pude ver como"
	line "vencerás a"
	cont "CISSY<...>"
	done
	
;=================================
;=================================
		
TrainerSwimmerFRue:
	trainer EVENT_BEAT_SWIMMERF_RUE, SWIMMERF, RUE, SwimmerFRueSeenText, SwimmerFRueBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFRueAfterText
	waitbutton
	closetext
	end

SwimmerFRueSeenText:
	text "RUTA 68<...>"
	line "Es cortita."
	done

SwimmerFRueBeatenText:
	text "<...>"
	done

SwimmerFRueAfterText:
	text "¿Realmente puedes"
	line "llamarlo ruta?"
	done

Route68_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost  5, 13, SIGNPOST_READ, Route68Sign

.ObjectEvents: db 3
	person_event SPRITE_SWIMMER_GIRL, 12,  6, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmerFMelly, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 20, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerFSally, -1
	person_event SPRITE_SWIMMER_GIRL, 15, 12, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerFRue, -1


