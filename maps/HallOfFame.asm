
const_value = 1
	const HALLOFFAME_LANCE

HallOfFame_MapScriptHeader:

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .NotChampYet
	priorityjump .HallOfFameScript
	end
	
.NotChampYet:
	end
	
.Trigger1:
	end

.HallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	spriteface PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	spriteface HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	dotrigger $1
	pause 15
	writebyte 2 ; Machine is in the Hall of Fame
	special HealMachineAnim
	setevent EVENT_DRAKE_IN_HALL_OF_FAME
	special HealParty
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "DRAKE: Ha pasado"
	line "mucho tiempo desde"
	cont "la última vez que"
	cont "estuve aquí."

	para "Es donde honramos"
	line "a los"

	para "CAMPEONES del"
	line "ORANGE CREW"
	cont "por generaciones."

	para "El coraje de tus"
	line "#MON es muy"
	cont "inspirador."

	para "Hoy, aquí"
	line "presenciamos el"

	para "alzamiento de un"
	line "nuevo CAMPEON,"

	para "que entiende y"
	line "confía en sus"

	para "compañeros,todos"
	line "sus #MON."

	para "Un entrenador"
	line "que ha mostrado"

	para "perseverancia y"
	line "determinación."

	para "El nuevo CAMPEON"
	line "que ha alcanzado"

	para "la grandeza y la"
	line "eternidad."

	para "<PLAYER>,permite"
	line "que te registre"

	para "junto a tus"
	line "compañeros como"
	cont "CAMPEONES."
	done
	
HoFOfficerGuardScript:
	jumptextfaceplayer HoFOfficerGuardScriptText
	
HallOfFameMachineScript:
	jumptext HallOfFameMachineScriptText
	
HoFMasterBall:
	itemball MASTER_BALL
	
HallOfFameMachineScriptText:
	text "Esta máquina es"
	line "usada para grabar"
	cont "el HALL DE LA"
	cont "FAMA."
	done
	
HoFOfficerGuardScriptText:
	text "Lo siento, solo"
	line "el CAMPEON puede"
	cont "venir aqui."
	done

HallOfFame_MapEventHeader:

.Warps: db 2
	warp_def 11, 6, 1, PUMMELO_ISLAND
	warp_def 11, 7, 2, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 1
	signpost  4,  8, SIGNPOST_READ, HallOfFameMachineScript

.PersonEvents: db 3
	person_event SPRITE_DRAKE, 10,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAKE_IN_HALL_OF_FAME
	person_event SPRITE_OFFICER,  6,  0, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HoFOfficerGuardScript, EVENT_BEAT_ORANGE_LEAGUE
	person_event SPRITE_POKE_BALL,  1,  1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, HoFMasterBall, EVENT_HALL_OF_FAME_MASTER_BALL
