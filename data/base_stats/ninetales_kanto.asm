	db NINETALES ; 038

	db  73,  76,  75, 100,  81, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 75 ; catch rate
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db FEMALE_75 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, SOLARBEAM, IRON_TAIL, HYPER_BEAM, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, DAZZLINGLEAM, FACADE, REST, THIEF, GIGA_IMPACT, ATTRACT
