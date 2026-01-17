	db DUGTRIO ; 051

	db  35,  100,  50, 120,  50,  70
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 50 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, FISSURE, HYPER_BEAM, PROTECT, EARTHQUAKE, DIG, DOUBLE_TEAM, ROCK_SLIDE, FACADE, REST, THIEF, CUT, ROCK_SMASH, ATTRACT
