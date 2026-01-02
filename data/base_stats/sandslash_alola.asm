	db SANDSLASH ; 028

	db  75, 100, 120,  65,  25,  65
	;   hp  atk  def  spd  sat  sdf

	db ICE, STEEL
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, HAIL, ICE_BEAM, BLIZZARD, FISSURE, HYPER_BEAM, PROTECT, EARTHQUAKE, DIG, DOUBLE_TEAM, SANDSTORM, FLASH, CUT, STRENGTH, ROCK_SMASH, GIGA_IMPACT, SWAGGER, SLEEP_TALK, ATTRACT
