const_value = 1
	const DRAKES_HOUSE_POKEBALL

PummeloIslandHouse6_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloIslandDrakeGift:
	opentext
	writetext DrakeGiftText1
	waitbutton
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 30, GOLD_BERRY, SHINY_MASK
	special SpecialDratini
	setevent EVENT_PUMMELO_ISLAND_DRAKE_GIFT
	disappear DRAKES_HOUSE_POKEBALL
	closetext
	end

.PartyFull:
	writetext DrakeGiftPartyFullText
	waitbutton
	closetext
	end
	
DrakeGiftPartyFullText:
	text "¡Tu equipo"
	line "esta lleno!"
	done
	
DrakeGiftText1:
	text "Hay una nota."
	
	para "DRAKE: <PLAYER>."
	line "Me voy a KANTO"
	cont "para entrenar."
	
	para "La siguiente vez"
	line "que nos encontremos"
	cont "estare listo..."
	cont "¡Para recuperar mi"
	cont "lugar como "
	cont "CAMPEON!"
	
	para "Conoci a tu "
	line "amigo TRACEY."
	cont "Me conto sus"
	cont "asuntos en "
	
	para "KANTO.. Tambien"
	line "regalo para ti."
	cont "Coge este"
	cont "#MON, ¡y muestra"
	
	para "que eres el"
	line "CAMPEON DE"
	cont "CAMPEONES!"
	done

PummeloIslandHouse6_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 10, PUMMELO_ISLAND
	warp_def $7, $4, 10, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_POKE_BALL,  3,  3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloIslandDrakeGift, EVENT_PUMMELO_ISLAND_DRAKE_GIFT
