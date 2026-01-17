const_value = 1
	const SUNBURST_ITEM

SunburstCrystalShop_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

SunburstCrystalShop:
	itemball TRADE_STONE

SunburstCrystalShopPikachuScript:
	jumptext SunburstCrystalShopPikachuText

SunburstCrystalShopPikachuText:
	text "A crystal glass"
	line "sculpture."

	para "<``>For ASH, my"
	line "dear friend. May"
	cont "you become a"
	cont "#MON MASTER.<''>" 
	
	para "Signed: MATEO"
	done

SunburstCrystalShopOnixScript:
	jumptext SunburstCrystalShopOnixText

SunburstCrystalShopOnixText:
	text "A crystal glass"
	line "sculpture."
	
	para "<``>May this ONIX"
	line "inspire those who"
	cont "need it.<''>" 
	
	para "Signed: MATEO"
	done

SunburstCrystalShop_MapEventHeader::

.Warps: db 2
	warp_def 5, 1, 3, SUNBURST_ISLAND
	warp_def 5, 2, 3, SUNBURST_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL,  4,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SunburstCrystalShop, EVENT_CRYSTAL_SHOP_TRADE_STONE
	person_event SPRITE_PIKACHU,  1,  5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_TEAL, 0, 0, SunburstCrystalShopPikachuScript, -1
	person_event SPRITE_ONIX,  1,  2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_TEAL, 0, 0, SunburstCrystalShopOnixScript, -1
