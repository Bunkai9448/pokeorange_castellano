const_value = 1
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

RedsMom:
	faceplayer
	opentext
	writetext RedsMomText1
	waitbutton
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

RedsMomText1:
	text "¡Hola!"

	para "ROJO estuvo aquí"
	line "hace mucho tiempo."

	para "No ha vuelto a "
	line "llamar, así que"

	para "no tengo idea de"
	line "por donde para, o"
	cont "que esta haciendo."

	para "Dicen que no reci-"
	line "bir noticias es"

	para "señal de que no"
	line "pasa nada, pero "
	cont "me preocupa."
	done

RedsMomText2:
	text "Me preocupa que"
	line "ROJO este herido"

	para "o enfermo. Pero"
	line "es un chico, estoy"

	para "orgullosa de lo"
	line "que hizo, y en lo"

	para "que se convertira."
	done

RedsHouse1FTVText:
	text "Tiene programas"
	line "que no echan en"
	cont "JOHTO<...>"
	done

RedsHouse1F_MapEventHeader:

.Warps: db 1
	warp_def $0, $7, 1, REDS_HOUSE_2F

.XYTriggers: db 0

.Signposts: db 3
	signpost 1, 0, SIGNPOST_READ, RedsHouse1FBookshelf
	signpost 1, 1, SIGNPOST_READ, RedsHouse1FBookshelf
	signpost 1, 2, SIGNPOST_READ, RedsHouse1FTV

.PersonEvents: db 1
	person_event SPRITE_REDS_MOM, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RedsMom, -1
