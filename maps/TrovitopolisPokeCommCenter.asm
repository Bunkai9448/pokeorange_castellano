const_value = 1
	const TROVITOPOLIS_NURSE
	const TROVITOPOLIS_SULOKU

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
	
	para "I sorry. I come"
	line "from VIETNAMESE"
	cont "JOHTO region."
	done

TrovitopolisPokeCommTeacherScript:
	jumptextfaceplayer TrovitopolisPokeCommTeacherText
	
TrovitopolisPokeCommTeacherText:
	text "Hmm, a mobile"
	line "system set up for"
	cont "trainers."
	
	para "Might be time for"
	line "me to get one of"
	cont "those cute new"
	cont "flip phones!"
	done
	
TrovitopolisPokeCommScientist1Script:
	jumptext TrovitopolisPokeCommScientist1Text
	
TrovitopolisPokeCommScientist1Text:
	text "<...>"
	
	para "SUKIYAMI: Gah!"
	
	para "No! I broke it"
	line "even more!"
	
	para "PIA is going to"
	line "kill me<...>"
	
	para "I know! I'll get"
	line "LUNA to fix this!"
	done
	
TrovitopolisPokeCommScientist2Script:
	jumptext TrovitopolisPokeCommScientist2Text
	
TrovitopolisPokeCommScientist2Text:
	text "<...>"
	
	para "RANGI: Ew<...>"
	
	para "This code is so<...>"
	
	para "old. I give up"
	line "on it. Back to"
	cont "POLISHED CRYSTAL."
	done
	
TrovitopolisPokeCommLuckyScript:
	jumptextfaceplayer TrovitopolisPokeCommLuckyText
	
TrovitopolisPokeCommLuckyText:
	text "LUCKY: I ran out"
	line "of REPEL<...>"
	
	para "So. Many. WINGULL."
	line "It's safe in here."
	cont "Outside is too"
	cont "scary for me."
	
	para "Atleast in here 60"
	line "FPS can't hurt me."
	cont "I did work for"
	cont "PRISM, you know?"
	done

TrovitopolisPokeCommSulokuScript:
	faceplayer
	opentext
	writetext TrovitopolisPokeCommSulokuText1
	waitbutton
	checkevent EVENT_GOT_MASTER_ROD
	iffalse .notHaveMasterRod
	writetext TrovitopolisPokeCommSulokuHaveMasterRodText
	waitbutton
	jump .sulokuDone

.notHaveMasterRod
	writetext TrovitopolisPokeCommSulokuNoRodText
	waitbutton
	callasm _ASMCheckSeashells
	iftrue .haveSeashellsNoRod
	writetext TrovitopolisPokeCommSulokuNoSeashellsText
	yesorno
	iffalse .noClue
	
	checkevent EVENT_DANNYS_HOUSE_SHELL_BOX
	iftrue .shell1
	writetext TrovitopolisPokeCommSulokuShell0_BoxText
	waitbutton
	jump .shellend
.shell1
	checkevent EVENT_NAVEL_ISLAND_SEASHELL
	iftrue .shell2
	writetext TrovitopolisPokeCommSulokuShell1_NAVELText
	waitbutton
	jump .shellend
.shell2
	checkevent EVENT_TROVITA_ISLAND_SEASHELL
	iftrue .shell3
	writetext TrovitopolisPokeCommSulokuShell2_TROVITAText
	waitbutton
	jump .shellend
.shell3
	checkevent EVENT_SEVENGRAPEFRUITS_ISLAND_SEASHELL
	iftrue .shell4
	writetext TrovitopolisPokeCommSulokuShell3_7GRAPEText
	waitbutton
	jump .shellend
.shell4
	checkevent EVENT_ROUTE_60_SEASHELL
	iftrue .shell5
	writetext TrovitopolisPokeCommSulokuShell4_ROUTE60AText
	waitbutton
	jump .shellend
.shell5
	checkevent EVENT_ROUTE_60_SEASHELL_2
	iftrue .shell6
	writetext TrovitopolisPokeCommSulokuShell5_ROUTE60BText
	waitbutton
	jump .shellend
.shell6
	checkevent EVENT_WRECKED_SHIP_SEASHELL
	iftrue .shell7
	writetext TrovitopolisPokeCommSulokuShell6_SHIPText
	waitbutton
	jump .shellend
.shell7
	checkevent EVENT_CLEOPATRA_ISLAND_SEASHELL
	iftrue .shell8
	writetext TrovitopolisPokeCommSulokuShell7_CLEOPATRAText
	waitbutton
	jump .shellend
.shell8
	checkevent EVENT_ROUTE_55_SEASHELL
	iftrue .shell9
	writetext TrovitopolisPokeCommSulokuShell8_ROUTE55Text
	waitbutton
	jump .shellend
.shell9
	checkevent EVENT_ROUTE_67_SEASHELL
	iftrue .shell10
	writetext TrovitopolisPokeCommSulokuShell9_ROUTE67Text
	waitbutton
	jump .shellend
.shell10
	checkevent EVENT_LIGHTNING_ISLAND_SEASHELL
	iftrue .shell11
	writetext TrovitopolisPokeCommSulokuShell10_LIGHTINGText
	waitbutton
	jump .shellend
.shell11
	checkevent EVENT_SHAMOUTI_BAY_SEASHELL
	writetext TrovitopolisPokeCommSulokuShell11_SHAMOUTIText
	waitbutton

.shellend
	writetext TrovitopolisPokeCommSulokuGoodLuckText
	waitbutton
	jump .sulokuDone
	
.haveSeashellsNoRod
	writetext TrovitopolisPokeCommSulokuAllSeashellsText
	waitbutton
	verbosegiveitem MASTER_ROD
	setevent EVENT_GOT_MASTER_ROD
	writetext TrovitopolisPokeCommSulokuHaveMasterRodText
	waitbutton
	jump .sulokuDone

.noClue
	writetext TrovitopolisPokeCommSulokuNoClueText
	waitbutton
.sulokuDone
	closetext
	spriteface TROVITOPOLIS_SULOKU, UP
	end
	
TrovitopolisPokeCommSulokuText1:
	text "SULOKU: I snuck"
	line "myself here, I"
	cont "hope the other"
	cont "devs don't mind."
	
	para "With a bit of luck"
	line "the game is"
	cont "finally bug-free."
	done

TrovitopolisPokeCommSulokuNoRodText:
	text "The SEASHELLs did"
	line "not have any uses"
	cont "in this game, but"
	cont "if you collect all"
	cont "11 of them, I'll"
	cont "tell you a little"
	cont "secret."
	done

TrovitopolisPokeCommSulokuNoSeashellsText:
	text "It seems you are"
	line "missing some"
	cont "SEASHELLs..."

	para "Do you want a"
	line "clue?"
	done

TrovitopolisPokeCommSulokuNoClueText:
	text "Good luck then!"
	done

TrovitopolisPokeCommSulokuAllSeashellsText:
	text "Wow, you found all"
	line "the SEASHELLs!"
	
	para "Here's the secret:"
	line "having them all"
	cont "gives you a 1 in"
	cont "256 chance for"
	cont "shiny #MON. If"
	cont "you also have the"
	cont "SHINY CHARM, it"
	cont "will be 1 in 128!"

	para "Also, take this"
	line "rod. With it, you"
	cont "will be able to"
	cont "fish level 50"
	cont "#MON!"
	done

TrovitopolisPokeCommSulokuHaveMasterRodText:
	text "Enjoy, see you in"
	line "Island Walker!"
	done

TrovitopolisPokeCommSulokuGoodLuckText:
	text "Good luck then!"
	done

TrovitopolisPokeCommSulokuShell0_BoxText:
	text "What? You don't"
	line "have a SHELL BOX?"

	para "Look for one at"
	line "DANNY's house."
	done

TrovitopolisPokeCommSulokuShell1_NAVELText:
	text "Go search around"
	line "NAVEL ISLAND."
	done

TrovitopolisPokeCommSulokuShell2_TROVITAText:
	text "Go search around"
	line "TROVITA ISLAND be-"
	cont "hind a whirlpool."
	done

TrovitopolisPokeCommSulokuShell3_7GRAPEText:
	text "Go search around"
	line "7 GRAPEFRUIT"
	cont "ISLANDS from ROUTE"
	cont "59."
	done

TrovitopolisPokeCommSulokuShell4_ROUTE60AText:
	text "Go search around"
	line "ROUTE 60 behind"
	cont "a whirlpool."
	done

TrovitopolisPokeCommSulokuShell5_ROUTE60BText:
	text "Go search around"
	line "ROUTE 60 by the"
	cont "shore."
	done

TrovitopolisPokeCommSulokuShell6_SHIPText:
	text "Go search around"
	line "the WRECKED SHIP."
	done

TrovitopolisPokeCommSulokuShell7_CLEOPATRAText:
	text "Go search around"
	line "CLEOPATRA ISLAND."
	done

TrovitopolisPokeCommSulokuShell8_ROUTE55Text:
	text "Go search around"
	line "ROUTE 55 behind"
	cont "a whirlpool."
	done

TrovitopolisPokeCommSulokuShell9_ROUTE67Text:
	text "Go have a dive"
	line "at ROUTE 67."
	done

TrovitopolisPokeCommSulokuShell10_LIGHTINGText:
	text "Go search around"
	line "LIGHTING ISLAND."
	done

TrovitopolisPokeCommSulokuShell11_SHAMOUTIText:
	text "Go search around"
	line "SHAMOUTI ISLAND's"
	cont "bay."
	done

_ASMCheckSeashells:
	xor a
	ld [ScriptVar], a
	ld a, [Shells+1]
	cp 11
	ret c ;return if seashells <11
	ld a, $1
	ld [ScriptVar], a
	ret


PokeCommSign:
	jumptext PokeCommSignText
	
PokeCommSignText:
	text "ADMIN ROOM"
	
    para "Warning!"

    para "Our staff like to"
    line "ramble on about"
    cont "things that don't"
    cont "make sense!"
	done
	
APSign:
	jumptext APSignText
	
APSignText:
	text "FROM: LINKANDZELDA"
	line "TO: PIA CRT"

	para "<...>"
	
	para "It would be rude"
	line "to read someone's"
	cont "E-MAIL!"
	done

IWSign:
	jumptext IWSignText
	
IWSignText:
	text "Codename:"
	line "Island Walker"

	para "<...>"
	
	para "It's password"
	line "protected..."
	done
	
PokeCommMachineSign:
	jumptext PokeCommMachineSignText
	
PokeCommMachineSignText:
	text "There's a lot of"
	line "news articles!"
	
	para "Maybe one day I'll"
	line "bother to read"
	cont "some<...>"
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
	warp_def  7,  0, 3, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def  7,  1, 3, TROVITOPOLIS_POKE_COMM_CENTER

.CoordEvents: db 0

.BGEvents: db 19
	signpost 21,  2, SIGNPOST_READ, PokeCommSign
	signpost  2,  5, SIGNPOST_READ, APSign
	signpost  4,  7, SIGNPOST_READ, IWSign
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

.ObjectEvents: db 9
	person_event SPRITE_NURSE, 19,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisNurseScript, -1
	person_event SPRITE_BLUE,  3,  7, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommSulokuScript, -1
	person_event SPRITE_LASS, 23,  4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommLassScript, -1
	person_event SPRITE_ROCKER, 15, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommRockerScript, -1
	person_event SPRITE_TEACHER, 24, 10, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommTeacherScript, -1
	person_event SPRITE_LASS,  5,  5, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommScientist1Script, -1
	person_event SPRITE_COOLTRAINER_F,  3,  2, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommScientist2Script, -1
	person_event SPRITE_ROCKER,  5,  0, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommLuckyScript, -1
	person_event SPRITE_SCIENTIST, 19, 13, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokeCommScientistScript, -1


