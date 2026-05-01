const_value = 1
	const TROVTOPOLIS_SEWER_TM_SLUDGE_BOMB
	const TROVTOPOLIS_SEWER_TRADE_STONE
	const TROVTOPOLIS_SEWER_PROTEIN
	const TROVTOPOLIS_SEWER_ESCAPE_ROPE
	const TROVTOPOLIS_SEWER_NERD
	const TROVTOPOLIS_SEWER_SCIENTIST
	
TrovitopolisSewer_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrovitopolisSewerSludgeBomb:
	itemball TM_SLUDGE_BOMB

TrovitopolisSewerTradeStone:
	itemball TRADE_STONE

TrovitopolisSewerProtein:
	itemball PROTEIN

TrovitopolisSewerEscapeRope:
	itemball ESCAPE_ROPE
	
SewerNerdScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_SEWER_STARTER
	iftrue .AlreadyReceivedSewerNerdGift
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftrue .ObtainSewerSquirtleScript
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .ObtainSewerCharmanderScript	
	writetext SewerBulbasaurText
	yesorno
	iffalse .DeclinedFreeSewerPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 15
	special SpecialBulbasaur
	setevent EVENT_RECEIVED_SEWER_STARTER
	writetext AlreadyReceivedSewerNerdGiftText
	waitbutton
	closetext
	end
	
.ObtainSewerSquirtleScript:
	writetext SewerSquirtleText
	yesorno
	iffalse .DeclinedFreeSewerPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 15, BLACKGLASSES
	special SpecialSquirtle
	setevent EVENT_RECEIVED_SEWER_STARTER
	writetext AlreadyReceivedSewerNerdGiftText
	waitbutton
	closetext
	end
	
.ObtainSewerCharmanderScript:
	writetext SewerCharmanderText
	yesorno
	iffalse .DeclinedFreeSewerPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 15
	special SpecialCharmander
	setevent EVENT_RECEIVED_SEWER_STARTER
	writetext AlreadyReceivedSewerNerdGiftText
	waitbutton
	closetext
	end
	
.AlreadyReceivedSewerNerdGift:
	writetext AlreadyReceivedSewerNerdGiftText
	waitbutton
	closetext
	end
	
.DeclinedFreeSewerPokemon:
	writetext DeclinedFreeSewerPokemonText
	waitbutton
	closetext
	end
	
.PartyFull:
	writetext SewerPartyFullText
	waitbutton
	closetext
	end
	
SewerPartyFullText:
	text "Tu equipo "
	line "#MON esta lleno."
	done
	
SewerBulbasaurText:
	text "¡Ah! Has encon-"
	line "trado este"
	cont "lugar<...>"
	
	para "Veamos<...>"
	
	para "Empezaste con"
	line "el #MON"
	cont "CHARMANDER."
	
	para "¿Te gustaría un"
	line "BULBASAUR?"
	done
	
SewerSquirtleText:
	text "¡Ah! Has encon-"
	line "trado este"
	cont "lugar<...>"
	
	para "Veamos<...>"
	
	para "Empezaste con"
	line "el #MON"
	cont "BULBASAUR."
	
	para "¿Te gustaría un"
	line "SQUIRTLE?"
	done
	
SewerCharmanderText:
	text "¡Ah! Has encon-"
	line "trado este"
	cont "lugar<...>"
	
	para "Veamos<...>"
	
	para "Empezaste con"
	line "el #MON"
	cont "SQUIRTLE."
	
	para "¿Te gustaría un"
	line "CHARMANDER?"
	done
	
DeclinedFreeSewerPokemonText:
	text "Bueno, bueno,"
	line "pues<...>"
	done

AlreadyReceivedSewerNerdGiftText:
	text "Este #MON"
	line "te puede ayudar."
	done
	
PlayerReceivedBulbasaurText:
	text "<PLAYER> obtuvo"
	line "BULBASAUR."
	done
	
PlayerReceivedCharmanderText:
	text "<PLAYER> obtuvo"
	line "CHARMANDER."
	done

PlayerReceivedSquirtleText:
	text "<PLAYER> obtuvo"
	line "SQUIRTLE."
	done
	
SewerTMScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_TROVITOPOLIS_SEWER_TM
	closetext
	end

TrovitopolisSewer_MapEventHeader::

.Warps: db 7
	warp_def 3, 1, 3, SEWER_ENTRANCE
	warp_def 5, 19, 3, TROVITOPOLIS_SEWER
	warp_def 3, 33, 2, TROVITOPOLIS_SEWER
	warp_def 3, 51, 5, TROVITOPOLIS_SEWER
	warp_def 25, 1, 4, TROVITOPOLIS_SEWER
	warp_def 25, 51, 7, TROVITOPOLIS_SEWER
	warp_def 55, 31, 6, TROVITOPOLIS_SEWER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_POKE_BALL, 14, 49, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerSludgeBomb, EVENT_TROVITOPOLIS_SEWER_SLUDGE_BOMB
	person_event SPRITE_POKE_BALL, 36, 51, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerTradeStone, EVENT_TROVITOPOLIS_SEWER_TRADE_STONE
	person_event SPRITE_POKE_BALL, 14, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerProtein, EVENT_TROVITOPOLIS_SEWER_PROTEIN
	person_event SPRITE_POKE_BALL, 17, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerEscapeRope, EVENT_TROVITOPOLIS_SEWER_ESCAPE_ROPE
	person_event SPRITE_SUPER_NERD, 49, 27, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SewerNerdScript, -1
	person_event SPRITE_SCIENTIST, 50, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SewerTMScript, -1

