const_value = 1
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST

PokeCenter2F_MapScriptHeader:

.MapTriggers: db 3
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks: db 0

.Trigger1:
	priorityjump Script_LeftCableTradeCenter
.Trigger0:
	end

.Trigger2:
	priorityjump Script_LeftCableColosseum
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special Special_SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special Special_TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall PokeCenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

LinkReceptionistScript_Battle:
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special Special_SetBitsForBattleRequest
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special Special_TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalse .LinkTimedOut
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall PokeCenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	jump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	dotrigger $0
	domaptrigger TRADE_CENTER, $0
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	dotrigger $0
	domaptrigger COLOSSEUM, $0
	end

PokeCenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovement2 PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsUp
	end

.Female:
	applymovement2 PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsUp
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	applymovement2 PokeCenter2FMovementData_ReceptionistLooksRight
	spriteface PLAYER, LEFT
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte ((1 << 3) | PAL_OW_RED) << 4
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special ReplaceKrisSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepUp
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte ((1 << 3) | PAL_OW_BLUE) << 4
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	writebyte ((1 << 3) | PAL_OW_BLUE) << 4
	special Special_SetPlayerPalette
	applymovement PLAYER, PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	end

MapPokeCenter2FSignpost0Script:
	refreshscreen
	special Special_DisplayLinkRecord
	closetext
	end

PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_ReceptionistLooksRight:
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
PokeCenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
PokeCenter2FMovementData_PlayerTakesOneStepUp:
	step UP
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
PokeCenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
PokeCenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

PokeCenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

Text_BattleReceptionistIntro:
	text "Este es el CABLE"
	line "CLUB COLOSSEUM."

	para "En este hack"
	line "no funciona."

	para "Pero es un "
	line "juegazo."
	done

Text_TradeReceptionistIntro:
	text "Este es el CABLE"
	line "TRADE CENTER."

	para "En este hack no"
	line "funciona."

	para "Pero los POkes"
	line "ya no evolu-"
	cont "cionan por in-"
	cont "tercambio."
	done

Text_FriendNotReady:
	text "Tu amigo no"
	line "esta listo."
	prompt

Text_MustSaveGame:
	text "Ante de usar"
	line "el cable link,"
	cont "debes guardar."
	done

Text_PleaseWait:
	text "Please wait."
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	prompt

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_TimeCapsuleClosed:
	text "En este hack la"
	line "CAPSULA DEL "
	cont "TIEMPO NO VA."
	done

Text_TradeRoomClosed:
	text "En este hack la"
	line "TRADE MACHINE no"
	cont "funciona."
	done

Text_BattleRoomClosed:
	text "En este hack la"
	line "BATTLE MACHINE no"
	cont "funciona."
	done

Text_OhPleaseWait:
	text "Oh, please wait."
	done

Text_ChangeTheLook:
	text "We need to change"
	line "the look here<...>"
	done

Text_LikeTheLook:
	text "How does this"
	line "style look to you?"
	done

PokeCenter2F_MapEventHeader::

.Warps: db 3
	warp_def 5, 0, -1, POKECENTER_2F
	warp_def 0, 0, 1, TRADE_CENTER
	warp_def 0, 6, 1, COLOSSEUM

.CoordEvents: db 0

.BGEvents: db 1
	signpost 2, 9, SIGNPOST_READ, MapPokeCenter2FSignpost0Script

.ObjectEvents: db 2
	person_event SPRITE_LINK_RECEPTIONIST, 2, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Script_TradeCenterClosed, -1
	person_event SPRITE_LINK_RECEPTIONIST, 2, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Script_BattleRoomClosed, -1

