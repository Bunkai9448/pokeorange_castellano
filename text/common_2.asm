UnknownText_0x1c0043::
	text "¡Hola a todos!"
	line "Soy el INSPECTOR"
	cont "MOTES."

	para "Evalúo los nombres"
	line "de los #MON."

	para "Quieres evaluar"
	line "algún nombre?"
	done

UnknownText_0x1c00a0::
	text "¿Que mote"
	line "#MON debería"
	cont "evaluar?"
	prompt

UnknownText_0x1c00cd::
	text "Hm<...> @"
	text_from_ram StringBuffer1
	text "<...>"
	line "Es un nombre"
	cont "bastante bueno."

	para "Pero, ¿qué te"
	line "parece mejorarlo"
	cont "un poco?"

	para "¿Quieres que le"
	line "dé otro nombre?"
	done

UnknownText_0x1c0142::
	text "Muy bien."
	line "¿Cómo podríamos"
	cont "llamarlo?"
	prompt

UnknownText_0x1c0171::
	text "¡Ese nombre es"
	line "mejor que el"
	cont "anterior!"

	para "¡Bien hecho!"
	done

UnknownText_0x1c019e::
	text "Muy bien. Vuelve"
	line "cuando quieras."
	done

UnknownText_0x1c01be::
	text "Hm<...> @"
	text_from_ram StringBuffer1
	text "?"
	line "¡Qué buen nombre!"
	cont "Es perfecto."

	para "Trata a"
	line "@"
	text_from_ram StringBuffer1
	text "con mucho cariño."
	done

UnknownText_0x1c0208::
	text "Uau<...> Eso es "
	line "un HUEVO."
	done

UnknownText_0x1c0222::
    text "¡Se parece al"
	line "anterior, pero"

	para "este nombre es"
	line "mucho mejor!"

	para "¡Bien hecho!"
	done

UnknownText_0x1c0272::
	text "Muy bien. Ahora"
	line "este #MON se"
	cont "llama @"
	text_from_ram StringBuffer1
	text "."
	prompt

Text_Gained::
	text_from_ram StringBuffer1
	text " ganó@@"

Text_ABoostedStringBuffer2ExpPoints::
	text ""
	line "un total de"
	cont "@"
	deciram wExpScratch40_1, 3, 8
	text " puntos EXP.!"
	prompt

Text_StringBuffer2ExpPoints::
	text ""
	line "@"
	deciram wExpScratch40_1, 3, 8
	text " puntos EXP.!"
	prompt

Text_GoPkmn::
	text "¡Ve! @@"

Text_DoItPkmn::
	text "¡Hazlo! @@"

Text_GoForItPkmn::
	text "¡A por él!,"
	line "@@"

Text_YourFoesWeakGetmPkmn::
	text "¡Esta débil!"
	line "¡Ve, @@"

Text_BattleMonNick01::
	text_from_ram BattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_from_ram BattleMonNick
	text ",@@"

Text_ThatsEnoughComeBack::
	text " ¡Suficiente!"
	line " ¡Vuelve!@@"

Text_OKComeBack::
	text " ¡OK!"
	line "¡Vuelve!@@"

Text_GoodComeBack::
	text " ¡Bien hecho!"
	line "¡Vuelve!@@"

Text_ComeBack::
	text " ¡Vuelve"
	line "aqui!"
	done

UnknownText_0x1c0373::
	text "Elegida una MT."
	prompt

UnknownText_0x1c0384::
	text "Elegida una MO."
	prompt

UnknownText_0x1c0396::
	text "esta contiene"
	line "@"
	text_from_ram StringBuffer2
	text "."

	para "¿Enseñas @"
	text_from_ram StringBuffer2
	text ""
	line "a un #MON?"
	done

UnknownText_0x1c03c2::
	text_from_ram StringBuffer2
	text " él"
	line "no es compatible"
	cont "con @"
	text_from_ram StringBuffer1
	text "."

	para "No puede aprender"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c05c8::
UnknownText_0x1c0705::
	text "No puedes usar eso"
	line "aquí."
	prompt

UnknownText_0x1c05dd::
	text_from_ram StringBuffer2
	text " usó"
	line "¡CORTE!"
	prompt

UnknownText_0x1c05ec::
	text "Aquí no hay nada"
	line "que CORTAR."
	prompt

UnknownText_0x1c0609::
	text "¡Un DESTELLO"
	line "ilumina la zona!@"
	text_waitbutton
	db "@@"
