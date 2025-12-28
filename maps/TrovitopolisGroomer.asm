const_value = 1
	const TROVITOPOLIS_GROOMER_CLERK
	const TROVITOPOLIS_GROOMER_RATER

TrovitopolisGroomer_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisGroomerScript:
	faceplayer
	opentext
	writetext MassageIntroductionText
	waitbutton
	checkflag ENGINE_MASSAGED_TODAY
	iftrue .OnlyNormalMassage
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .OnlyNormalMassage
	if_equal WEDNESDAY, .OnlyNormalMassage

;Deluxe Massage is available
	writetext AskForDeluxeMassageText
	special PlaceMoneyTopRight
	yesorno
	iffalse .declineDeluxe
;Do a Deluxe massage
	checkmoney $0, 1500
	if_equal $2, .NotEnoughMoney
	writetext MassageWhichMonText
	waitbutton
	special Special_MassageDeluxe
	if_equal 0, .Refused
	if_equal 1, .CantGroomEgg
	setflag ENGINE_MASSAGED_TODAY
	callasm _ASM_SetDeluxeMassageFlag

.DoMassage
	writetext GroomerAlrighText
	waitbutton
	closetext
	checkcode VAR_XCOORD
	if_greater_than  0, .MovePlayer1
	applymovement PLAYER, GroomerPlayerMovement2
.AfterMovement
	special FadeOutPalettes
	spriteface TROVITOPOLIS_GROOMER_CLERK, DOWN
	playmusic MUSIC_HEAL
	pause 60
	spriteface PLAYER, UP
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext MassagedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	closetext
	applymovement PLAYER, GroomerPlayerMovement3
	spriteface PLAYER, UP
	waitsfx
	playsound SFX_TRANSACTION
	callasm _ASM_IsDeluxeMassage
	iftrue .takemoneyDeluxe
	takemoney $0, 500
.endMassage
	opentext
	special PlaceMoneyTopRight
	writetext GroomerAllDoneText
	waitbutton
	closetext
	end

.takemoneyDeluxe
	takemoney $0, 1500
	jump .endMassage

.MovePlayer1
	applymovement PLAYER, GroomerPlayerMovement1
	jump .AfterMovement

.declineDeluxe
	writetext DeclineDeluxeMassageText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney $0, 500
	if_equal $2, .NotEnoughMoney
	writetext MassageWhichMonText
	waitbutton
	special Special_MassageNormal
	if_equal 0, .Refused
	if_equal 1, .CantGroomEgg
	jump .DoMassage

.OnlyNormalMassage
	writetext OnlyNormalMassageText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney $0, 500
	if_equal $2, .NotEnoughMoney
	writetext MassageWhichMonText
	waitbutton
	special Special_MassageNormal
	if_equal 0, .Refused
	if_equal 1, .CantGroomEgg
	jump .DoMassage

.Refused:
	writetext MassageRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext MassageCantMassageEggText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext NotEnoughMoneyText
	waitbutton
	closetext
	end

;this loads 0x01 to the EventFlags in WRAM, which is reset for every map and is unused here
_ASM_SetDeluxeMassageFlag:
	ld a, 1
	ld [EventFlags], a
	ret

;this loads the EventFlags byte so we can check it in scripting.
_ASM_IsDeluxeMassage:
	ld a, [EventFlags]
	ld [ScriptVar], a
	ret

MassageIntroductionText:
	text "Greetings!"
	line "Here we offer a"
	cont "massage service"
	cont "for both trainers"
	cont "and #MON."
	
	para "This is the best"
	line "way to bond with "
	cont "your partners!"
	done

AskForDeluxeMassageText:
	text "You are lucky, we"
	line "have a spot in our"
	cont "schedule for our"
	cont "worldwide famous"
	cont "deluxe massage,"
	cont "only for ¥1500!"

	para "Would you like to"
	line "have the deluxe"
	cont "massage?"
	done

DeclineDeluxeMassageText:
	text "Would you like to"
	line "have the standard"
	cont "massage for ¥500"
	cont "instead?"
	done

OnlyNormalMassageText:
	text "The schedule for"
	line "our worldwide"
	cont "famous deluxe"
	cont "massage is full,"
	cont "but we can offer"
	cont "the equally good"
	cont "standard massage"
	cont "for only ¥500."

	para "Would you like to"
	line "have the standard"
	cont "massage?"
	done

MassageWhichMonText:
	text "Which #MON will"
	line "you massage with?"
	done

GroomerAlrighText:
	text "OK, we'll get you"
	line "both relaxed in"
	cont "no time."
	done

MassagedMonLooksContentText:
	text "There you go!"
	line "All done."
	para "@"
	text_from_ram StringBuffer3
	text " looks"
	line "happy."
	done

GroomerAllDoneText:
	text "See? Aren't you"
	line "relaxed?"

	para "Your @"
	text_from_ram StringBuffer3
	text "'s"
	line "face says it all."
	done

MassageRefusedText:
	text "You don't want to"
	line "have a massage?"

	para "OK, come back any"
	line "time!"
	done

MassageCantMassageEggText:
	text "Oh, sorry. We don't"
	line "do EGG massages."
	done

NotEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

;Player standing to the right of the Clerk
GroomerPlayerMovement1:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step_end

;Player standing below the Clerk
GroomerPlayerMovement2:
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step_end
	
GroomerPlayerMovement3:
	step LEFT
	step LEFT
	step UP
	step LEFT
	step_end
	
TrovitopolisGroomerHappinessRaterScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext TrovitopolisGroomerHappinessRaterText
	waitbutton
	if_greater_than 255 - 1, .LovesYouALot
	if_greater_than 220 - 1, .ReallyEvolved
	if_greater_than 200 - 1, .ReallyTrustsYou
	if_greater_than 150 - 1, .SortOfHappy
	if_greater_than 100 - 1, .QuiteCute
	if_greater_than  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext GroomerHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	jump .raterEnd

.ReallyEvolved
	writetext GroomerHappinessRatingText_ReallyEvolved
	waitbutton
	closetext
	jump .raterEnd

.ReallyTrustsYou:
	writetext GroomerHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	jump .raterEnd

.SortOfHappy:
	writetext GroomerHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	jump .raterEnd

.QuiteCute:
	writetext GroomerHappinessRatingText_QuiteCute
	waitbutton
	closetext
	jump .raterEnd

.NotUsedToYou:
	writetext GroomerHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	jump .raterEnd

.LooksMean:
	writetext GroomerHappinessRatingText_LooksMean
	waitbutton
	closetext
	jump .raterEnd

.raterEnd
	spriteface TROVITOPOLIS_GROOMER_RATER, DOWN
	end

TrovitopolisGroomerHappinessRaterText:
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "A massage with"
	line "your #MON is a"
	cont "great way to in-"
	cont "crease your bond!"

	para "Oh? Let me see"
	line "your @"
	text_from_ram StringBuffer3
	text "..."
	done

GroomerHappinessRatingText_LovesYouALot:
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done

GroomerHappinessRatingText_ReallyEvolved:
	text "It looks like the"
	line "bond with your"
	cont "@"
	text_from_ram StringBuffer3
	text " is"
	cont "evolving!"
	done

GroomerHappinessRatingText_ReallyTrustsYou:
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done

GroomerHappinessRatingText_SortOfHappy:
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done

GroomerHappinessRatingText_QuiteCute:
	text "It's quite cute."
	done

GroomerHappinessRatingText_NotUsedToYou:
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done

GroomerHappinessRatingText_LooksMean:
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done

TrovitopolisGroomer_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 14, TROVITOPOLIS
	warp_def 7, 3, 14, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CLERK,  1,  0, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisGroomerScript, -1
	person_event SPRITE_POKEFAN_F,  3,  3, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisGroomerHappinessRaterScript, -1
