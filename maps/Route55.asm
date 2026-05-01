const_value = 1
	const ROUTE_55_SWIMMER_GIRL
	const ROUTE_55_SWIMMER_GUY
	const ROUTE_55_RUNNER
	const ROUTE_55_ITEMBALL
	const ROUTE_55_SEASHELL

Route55_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_55_UNDERWATER, 0, 0
	return

TrainerSwimmerMayumi:
	trainer EVENT_BEAT_SWIMMERF_MAYUMI, SWIMMERF, MAYUMI, SwimmerMayumiSeenText, SwimmerMayumiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerMayumiAfterText
	waitbutton
	closetext
	end

SwimmerMayumiSeenText:
	text "¡Hola!"

	para "¿Quizás te"
	line "gustaría luchar?"
	done

SwimmerMayumiBeatenText:
	text "¡Ay! ¡No pensé"
	line "que iba a"
	cont "perder!"
	done

SwimmerMayumiAfterText:
	text "¡Gracias por la"
	line "gran batalla!"
	done

TrainerSwimmerKosuke:
	trainer EVENT_BEAT_SWIMMERM_KOSUKE, SWIMMERM, KOSUKE, SwimmerKosukeSeenText, SwimmerKosukeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerKosukeAfterText
	waitbutton
	closetext
	end

SwimmerKosukeSeenText:
	text "¡Vi un MANKEY"
	line "ROSA en la"
	cont "isla cercana!"
	done

SwimmerKosukeBeatenText:
	text "¡Juro que es"
	line "la verdad!"
	done

SwimmerKosukeAfterText:
	text "Me pregunto si mi"
	line "#MON podría"
	cont "volverse de"
	cont "color rosa."
	done

TrainerAthleteHideki:
	trainer EVENT_BEAT_ATHLETE_HIDEKI, ATHLETE, HIDEKI, AthleteHidekiSeenText, AthleteHidekiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteHidekiAfterText
	waitbutton
	closetext
	end

AthleteHidekiSeenText:
	text "¡Correr a pie por"
	line "esta isla me ha"
	cont "ayudado a fortalecer"
	cont "mi #MON!"
	done

AthleteHidekiBeatenText:
	text "Parece que aún"
	line "tengo que"
	cont "correr más."
	done

AthleteHidekiAfterText:
	text "¡Para ganar un"
	line "maratón, tienes que"
	cont "entrenar super duro!"
	done

Route55MaxRevive:
	itemball MAX_REVIVE

Route55Sign:
	jumptext Route55SignText

RangiSign:
	jumptext RangiSignText

Route55PotHiddenItem:
	dwb EVENT_ROUTE_55_HIDDEN_SOFT_SAND, SOFT_SAND

.Text:

Route55SignText:
	text "RUTA 55"
	line "A LA ISLA KINNOW"
	done

RangiSignText:
	text "ISLA RANGI"

	para "GITHUB yace aquí."
	done
	
Route55SeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute55Seashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_55_SEASHELL
	disappear ROUTE_55_SEASHELL
	end
	
.NoShellBox:
	writetext Route55NoShellBox
	waitbutton
	closetext
	end
	
Route55NoShellBox:
    text "¡Qué bonita concha"
    line "marina! Parece"
    cont "demasiado frágil"
    cont "como para meterlo"
    cont "en mi MOCHILA."
    done
	
FoundRoute55Seashell:
	text "¡Encontraste una"
	line "concha marina"
	cont "muy rara!"
	done

Route55_MapEventHeader::

.Warps: db 2
	warp_def 5, 12, 3, CRYSTAL_CAVE_1F
	warp_def 41, 13, 1, ROUTE_55_QUEST_HOUSE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 10, 16, SIGNPOST_READ, Route55Sign
	signpost 22, 34, SIGNPOST_READ, RangiSign
	signpost 42, 10, SIGNPOST_ITEM, Route55PotHiddenItem

.ObjectEvents: db 5
	person_event SPRITE_SWIMMER_GIRL, 19, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerMayumi, -1
	person_event SPRITE_SWIMMER_GUY, 31, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerKosuke, -1
	person_event SPRITE_COOLTRAINER_M, 40, 37, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerAthleteHideki, -1
	person_event SPRITE_POKE_BALL, 39, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route55MaxRevive, EVENT_ROUTE_55_MAX_REVIVE
	person_event SPRITE_SEASHELL, 23, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route55SeashellScript, EVENT_ROUTE_55_SEASHELL
