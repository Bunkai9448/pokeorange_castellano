const_value = 1

TrovitopolisDeptStoreRoof_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

DeptOldLadyRoofScript:
	faceplayer
	opentext
	writetext DeptOldLadyText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusedDeptStoreRoof
	checkmoney $0, 2000
	if_equal $2, .NotEnoughMoney
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
    writetext WhichEggText
	loadmenudata .EggMenuHeader
	verticalmenu
	closewindow
	if_equal 1, .togepi
	if_equal 2, .smoochum
	if_equal 3, .pichu
	if_equal 4, .more1
	jump .RefusedDeptStoreRoof
	
.more1:
	loadmenudata .EggMenuHeader2
	verticalmenu
	closewindow
	if_equal 1, .magby
	if_equal 2, .igglybuff
	if_equal 3, .happiny
	if_equal 4, .more2
	jump .RefusedDeptStoreRoof
	
.more2:
	loadmenudata .EggMenuHeader3
	verticalmenu
	closewindow
	if_equal 1, .elekid
	if_equal 2, .cleffa
	if_equal 3, .azurill
	jump .RefusedDeptStoreRoof
	
.togepi:
	giveegg TOGEPI, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.smoochum:
	giveegg SMOOCHUM, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.pichu:
	giveegg PICHU, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.magby:
	giveegg MAGBY, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.igglybuff:
	giveegg IGGLYBUFF, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.happiny:
	giveegg HAPPINY, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.elekid:
	giveegg ELEKID, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.cleffa:
	giveegg CLEFFA, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.azurill:
	giveegg AZURILL, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	closetext
	end
	
.EggMenuHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData
	db 1 ; default option
	
.EggMenuHeader2:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option
	
.EggMenuHeader3:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData3
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 4 ; items
	db "TOGEPI@"
	db "SMOOCHUM@"
	db "PICHU@"
	db "SIGUE@"

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "MAGBY@"
	db "IGGLYBUFF@"
	db "HAPPINY@"
	db "SIGUE@"
	
.MenuData3:
	db $80 ; flags
	db 4 ; items
	db "ELEKID@"
	db "CLEFFA@"
	db "AZURILL@"
	db "SALIR@"

.NotEnoughMoney:
	writetext NotEnoughMoneyDeptRoofText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DeptRoofPartyFullText
	waitbutton
	closetext
	end

.RefusedDeptStoreRoof:
	writetext RefusedDeptStoreLadyText
	waitbutton
	closetext
	end

.eggname
	db "HUEVO@"

WhichEggText:
	text "¿Qué huevo?"
	done

DeptOldLadyText1:
	text "Vendo huevos"
	line "#MON muy raros."

	para "¡Tengo de sobra!"
	line "¡Uno puede ser"
	cont "tuyo por ¥2000!"
	cont "¿Qué me dices?"
	done

NotEnoughMoneyDeptRoofText:
	text "¡No tienes sufi-"
	line "ciente dinero!"
	done

DeptRoofPartyFullText:
	text "¡No tienes sufi-"
	line "ciente espacio!"
	done

RefusedDeptStoreLadyText:
	text "Muy bien, toma."
	done

PleasureDoingBusinessDeptStoreText:
	text "Un placer hacer"
	line "negocios contigo."
	done

TrovitopolisDeptStoreRoof_MapEventHeader::

.Warps: db 1
	warp_def 1, 9, 3, TROVITOPOLIS_DEPT_STORE_6F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRANNY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DeptOldLadyRoofScript, -1

