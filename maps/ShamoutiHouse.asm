const_value = 1

ShamoutiHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MelodyShamouti:
	checkevent EVENT_SHAMOUTI_QUEST_STARTED
	iftrue .PlayLugiaSong
	jumptextfaceplayer MelodyText1
	end
	
.PlayLugiaSong
	faceplayer
	opentext
	checkevent EVENT_BEAT_LAWRENCE_ICE_ISLAND
	iftrue .GoToSlowking
	writetext MelodyText2
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	end

.GoToSlowking
	checkevent EVENT_MELODY_SENDS_YOU_TO_SHRINE
	iftrue .AlreadySpokeToMelody
	writetext MelodyText3
	waitbutton
	closetext
	setevent EVENT_MELODY_SENDS_YOU_TO_SHRINE
	end
	
.AlreadySpokeToMelody
	writetext MelodyText4
	waitbutton
	closetext
	end

MelodyText1:
	text "MELODY: ¿Estás"
	line "aquí por el"
	cont "festival de"
	cont "la leyenda?"
	
	para "Mi padre lo "
	line "esta celebrando"
	cont "en la casa detrás"
	cont "de esta."
	
	para "Deberías ir a"
	line "verlo."
	done
	
MelodyText2:
	text "MELODY: ¿Asi que "
	line "vas a tomar el rol"
	cont "de entrenador en"
	cont "el festival?"
	
	para "Todo lo que harás"
	line "es ir a las 3 "
	cont "islas, coger el"
	cont "tesoro de cada una"
	cont "y colocarlos en"
	cont "el santuario. "
	cont "Despues yo haré el"
	cont "el resto tocando"
	cont "la melodía del"
	cont "DIOS de los mares."
	
	para "¿Quieres oirla?"
	line "Suena así<...>"
	done
	
MelodyText3:
	text "MELODY: ¿Asi"
	line "que se ha cumpli-"
	cont "do la profecía?"
	cont "Alguien ha per-"
	cont "turbado a los"
	cont "dioses de las"
	cont "islas."
	
	para "Si no actuamos"
	line "rápido,quien sabe"
	cont "lo que ocurrira."
	
	para "No puede ser una"
	line "coincidencia que"
	cont "hayas venido."
	
	para "<...>"
	
	para "¿No puedes subir"
	line "hasta el castillo"
	cont "del cielo?"
	
	para "Hay un guardián"
	line "en el santuario"
	cont "que quizas te"
	cont "pueda ayudar."
	
	para "Habla con él,"
	line "y cuando tengas"
	cont "los tesoros,"
	cont "nos vemos en el"
	cont "santuario."
	
	para "Si el intruso"
	line "piensa que los"
	cont "dioses son los 3"
	cont "tesoros es mas"
	cont "idiota de lo que"
	cont "pensaba. ¡Animo!"
	cont "¡Puedes hacerlo!"
	done
	
MelodyText4:
	text "¿No puedes subir"
	line "hasta el castillo"
	cont "del cielo?"
	
	para "Hay un guardián"
	line "en el santuario"
	cont "que quizas te"
	cont "pueda ayudar."
	
	para "Habla con él,"
	line "y cuando tengas"
	cont "los tesoros,"
	cont "nos vemos en el"
	cont "santuario."
	
	para "Si el intruso"
	line "piensa que los"
	cont "dioses son los 3"
	cont "tesoros es mas"
	cont "idiota de lo que"
	cont "pensaba. ¡Animo!"
	cont "¡Puedes hacerlo!"
	done

ShamoutiHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 1, SHAMOUTI_ISLAND
	warp_def $7, $4, 1, SHAMOUTI_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_JASMINE,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MelodyShamouti, EVENT_BEAT_LAWRENCE
