_OakText6::
	text "¿Cómo has dicho"
	line "que te llamas?"
	prompt

_OakText7::
	text "<PLAYER>,"
	line "prepárate."

	para "Tu propia historia"
	line "#MON está a"
	cont "punto de empezar."

	para "Te divertirás y"
	line "te enfrentarás a"
	cont "duros desafíos."

	para "¡Te espera un"
	line "mundo de sueños y"

	para "aventuras con"
	line "#MON! ¡Vamos!"

	para "¡Nos vemos!"
	done

UnknownText_0x1c40e6::
	text "La hora del reloj"
	line "podría estar mal."

	para "Por favor, vuelve"
	line "a ponerlo en hora."
	prompt

UnknownText_0x1c411c::
	text "Cambia la hora con"
	line "el Panel Control."

	para "Confirmar: Botón A"
	line "Cancelar:  Botón B"
	done

UnknownText_0x1c415b::
	text "¿Estás de acuerdo?"
	done

UnknownText_0x1c4168::
	text "Reloj puesto en"
	line "hora otra vez."
	done

UnknownText_0x1c4183::
	text "Ha pasado mucho"
	line "tiempo. Por favor,"
	cont "vuelve a probar."
	prompt

UnknownText_0x1c41b1::
	text "Si cambias ese"
	line "#MON, no"
	cont "podrás luchar."
	prompt

UnknownText_0x1c41e6::
	text "Your friend's"
	line "@"
	text_from_ram StringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

UnknownText_0x1c4212::
	text "Trade @"
	text_from_ram wd004
	text ""
	line "for @"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c454b::
	text "¿Quieres guardar"
	line "el juego?"
	done

UnknownText_0x1c456d::
	text "GUARDANDO<...> NO"
	line "APAGAR LA CONSOLA."
	done

UnknownText_0x1c4590::
	text "<PLAYER> guardó"
	line "el juego."
	done

UnknownText_0x1c45a3::
	text "Ya existe un"
	line "archivo guardado."
	cont "¿Sobrescribirlo?"
	done

UnknownText_0x1c45d9::
	text "Hay otro archivo"
	line "guardado."
	cont "¿Sobrescribirlo?"
	done

UnknownText_0x1c460d::
	text "¡El archivo"
	line "guardado está"
	cont "corrupto!"
	prompt

UnknownText_0x1c462a::
	text "Antes de mover la"
	line "CAJA, se guarda"
	cont "la partida, ¿Vale?"
	done

UnknownText_0x1c465f::
	text "Antes de mover el"
	line "#MON, se guarda"
	cont "la partida, ¿Vale?"
	done

UnknownText_0x1c46b7::
	text "STACK OVERFLOW"
	done

_ObjectEventText::
	text "Evento de objeto"
	done

UnknownText_0x1c46fc::
	text "Evento BG"
	done

UnknownText_0x1c4706::
	text "Coordenadas evento"
	done

UnknownText_0x1c4719::
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> put the"
	line "@"
	text_from_ram StringBuffer1
	text " in"
	cont "the @"
	text_from_ram StringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text "The @"
	text_from_ram StringBuffer3
	text ""
	line "is full<...>"
	prompt

UnknownText_0x1c4b92::
	text "¡Enhorabuena!"
	line "¡Tu @"
	text_from_ram StringBuffer2
	db "@@"

UnknownText_0x1c4baf::
	text ""
	para "evoluciono en"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Huh? @"
	text_from_ram StringBuffer1
	text ""
	line "no evoluciono!"
	prompt

UnknownText_0x1c4be3::
	text "Que? @"
	text_from_ram StringBuffer2
	text ""
	line "esta evolucionando!"
	done

UnknownText_0x1c4bfd::
	text "¿Cuantas unidades?"
	done

UnknownText_0x1c4c08::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "seran ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Hola, joven."

	para "Vendo hierbas"
	line "medicinales."

	para "Son buenas, pero"
	line "un poco amargas."

	para "Quizá tus #MON"
	line "no las quieran."

	para "¡Je, je, je…!"
	done

UnknownText_0x1c4ca3::
	text "¿Cuantas unidades?"
	done

UnknownText_0x1c4cae::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "seran ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Gracias, joven."
	line "¡Je, je, je…!"
	done

UnknownText_0x1c4cea::
	text "¡Oh! Tu MOCHILA"
	line "está llena, joven."
	done

UnknownText_0x1c4d08::
	text "¡Je, je…! No"
	line "tienes ese dinero."
	done

UnknownText_0x1c4d2a::
	text "Vuelve otra vez."
	line "¡Je, je, je…!"
	done

UnknownText_0x1c4d47::
	text "¡Oye! ¿Quieres ver"
	line "unas gangas?"

	para "Vendo objetos que"
	line "nadie posee, pero"

	para "sólo un objeto de"
	line "cada tipo."
	done

UnknownText_0x1c4db0::
	text_from_ram StringBuffer2
	text " cuesta"
	line "¥@"
	deciram hMoneyTemp, 3, 6
	text ". ¿Lo quieres?"
	done

UnknownText_0x1c4dcd::
	text "Gracias."
	done

UnknownText_0x1c4dd6::
	text "¡Oh! Tu MOCHILA"
	line "está a tope."
	done

UnknownText_0x1c4df7::
	text "Eso ya lo has"
	line "comprado. No me"
	cont "quedan más."
	done

UnknownText_0x1c4e28::
	text "¡Oh! No tienes"
	line "suficiente dinero."
	done

UnknownText_0x1c4e46::
	text "Vuelve en otra"
	line "ocasión."
	done

UnknownText_0x1c4e5f::
	text "¿Qué quieres?"
	line "¿Alguna medicina?"
	done

UnknownText_0x1c4e7e::
	text "¿Cuántas unidades?"
	done

UnknownText_0x1c4e89::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "Serán ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "¡Muchas gracias!"
	done

UnknownText_0x1c4eb9::
	text "No te queda sitio."
	done

UnknownText_0x1c4ed8::
	text "¿Eh? No tienes"
	line "sufciente dinero."
	done

UnknownText_0x1c4ef6::
	text "De acuerdo."
	line "¡Nos vemos!."
	done

UnknownText_0x1c4f33::
	text "¿Cuantas unidades?"
	done

UnknownText_0x1c4f3e::
	text "Puedo pagarte"
	line "¥@"
	deciram hMoneyTemp, 3, 6
	text "."

	para "¿Te parece bien?"
	done

UnknownText_0x1c4f62::
	text "¡Hola!"
	line "¿Qué deseas?"
	done

UnknownText_0x1c4f80::
	text "Aquí tienes."
	line "¡Gracias!"
	done

UnknownText_0x1c4f9a::
	text "No tienes"
	line "suficiente dinero."
	done

UnknownText_0x1c4fb7::
	text "No puedes llevar"
	line "más objetos."
	done

UnknownText_0x1c4fd7::
	text "Lo siento, no"
	line "puedo comprártelo."
	prompt

UnknownText_0x1c4ff9::
	text "¡Vuelva cuando quiera!"
	done

UnknownText_0x1c500d::
	text "¿Puedo ayudarte"
	line "en algo más?"
	done

UnknownText_0x1c502e::
	text "Recibiste ¥@"
	deciram hMoneyTemp, 3, 6
	text " por"
	line "@"
	text_from_ram StringBuffer2
	text "(S)."
	done

UnknownText_0x1c5049::
	text "¿Cuántas"
	line "fichas?"
	done
