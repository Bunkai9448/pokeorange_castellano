UnknownText_0x1c505e::
	text "¡Adelante!"
	done

UnknownText_0x1c5066::
	text "No tienes"
	line "suficientes fichas"
	prompt

UnknownText_0x1c5079::
	text "Vaya<...> Me quedé"
	line "sin fichas<...>"
	done

UnknownText_0x1c5092::
	text "¿Vuelves a"
	line "jugar?"
	done

UnknownText_0x1c509f::
	text "¡Linea!"
	line "¡Has ganado @"
	text_from_ram StringBuffer2
	text " fichas!"
	done

UnknownText_0x1c50bb::
	text "¡Fallaste!"
	done

UnknownText_0x1c55db::
	text "Dale a continuar"
	line "y resetea."
	prompt

UnknownText_0x1c561c::
	text "¿Reiniciar el reloj?"
	done

UnknownText_0x1c564a::
	text "¿Borrar los"
	line "datos guardados?"
	done

UnknownText_0x1c5660::
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "ha aprendido"
	cont "@"
	text_from_ram StringBuffer2
	text ".@"
	sound_dex_fanfare_50_79
	text_waitbutton
	db "@@"

UnknownText_0x1c5678::
	text "¿Qué movimiento"
	next "debería olvidar?"
	done

UnknownText_0x1c5699::
	text "¿Deja de aprender"
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "no aprendió"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "intenta aprender"
	cont "@"
	text_from_ram StringBuffer2
	text "."

	para "Pero"
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text ""

	para "no puede aprender"
	line "más de cuatro"
	cont "movimientos."

	para "¿Borras movimiento"
	line "anterior para"

	para "dejar sitio a"
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 y<...>@"
	interpret_data
	db "@@"

UnknownText_0x1c574e::
	text " ¡Puf!@"
	interpret_data
	text ""
	para "@"
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "olvidó"
	cont "@"
	text_from_ram StringBuffer1
	text "."

	para "Y…"
	prompt

UnknownText_0x1c5772::
	text "Los movimientos"
	line "MO no se pueden"
	cont "olvidar ahora."
	prompt

UnknownText_0x1c5793::
	text "¿Quieres apostar"
	line "tres?"
	done

UnknownText_0x1c57ab::
	text "Faltan fichas."
	prompt

UnknownText_0x1c57be::
	text "Elige una carta."
	done


UnknownText_0x1c57ce::
	text "Haz tu apuesta."
	done

UnknownText_0x1c57df::
	text "¿Vuelves a"
	line "jugar?"
	done

UnknownText_0x1c57f4::
	text "Has barajado el"
	line "mazo."
	prompt
	
UnknownText_0x1c5813::
	text "¡Si!"
	done

UnknownText_0x1c581a::
	text "¡Fallaste…!<...>"
	done

UnknownText_0x1c5aa6::
	text "¡No! ¡El #MON"
	line "se ha escapado!"
	prompt

UnknownText_0x1c5ac3::
	text "¡Parecía que lo"
	line "habías atrapado!"
	prompt

UnknownText_0x1c5ae3::
	text "¡Vaya!"
	line "¡Te faltó poco!"
	prompt

UnknownText_0x1c5afa::
	text "¡Caray! ¡Casi"
	line "lo consigues!"
	prompt

UnknownText_0x1c5b17::
	text "¡Ya está!"
	line "¡@"
	text_from_ram EnemyMonNick
	text ""
	cont "atrapado!@"
	sound_caught_mon
	db "@@"

Text_Waitbutton_2::
	text_waitbutton
	db "@@"

UnknownText_0x1c5b38::
	text_from_ram wMonOrItemNameBuffer
	text "fue enviado"
	line "al PC de BILL."
	prompt

UnknownText_0x1c5b53::
	text_from_ram EnemyMonNick
	text "'s datos"
	line "fueron añadidos a"
	cont "la #DEX.@"
	sound_slot_machine_start
	text_waitbutton
	db "@@"

UnknownText_0x1c5b7f::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text_from_ram StringBuffer2
	text " de"
	line "@"
	text_from_ram StringBuffer1
	text " creció."
	prompt

UnknownText_0x1c5bac::
	text "Eso no se puede"
	line "usar con este"
	cont "#MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "Todavía funciona"
	line "el REPELENTE que"
	cont "usaste antes."
	prompt

UnknownText_0x1c5bf9::
	text "Escuchaste la"
	line "# FLAUTA."

	para "¡Es una canción"
	line "muy pegadiza!"
	prompt


UnknownText_0x1c5c28::
	text "Se han despertado"
	line "todos los #MON."
	prompt
	
UnknownText_0x1c5c44::
	text "<PLAYER> toca la"
	line "# FLAUTA.@"
	text_waitbutton
	db "@@"

UnknownText_0x1c5c7b::
	text "Fichas:"
	line "@"
	deciram Coins, 2, 4
	db "@@"

Text_TurnOffExpAll::
	text "¡El rep.exp fue"
	line "desactivado!"
	done

Text_TurnOnExpAll::
	text "¡El rep.exp fue"
	line "activado!"

	para "Todo el equipo"
	line "ganará EXP."
	done

Text_RaiseThePPOfWhichMove::
	text "¿Incrementar el PP"
	line "del movimiento?"
	done

Text_RestoreThePPOfWhichMove::
	text "¿Restaurar PP"
	line "del movimiento?"
	done

Text_PPIsMaxedOut::
	text_from_ram StringBuffer2
	text "los PP"
	line "estan agotados."
	prompt

Text_PPsIncreased::
	text_from_ram StringBuffer2
	text "los PP"
	line "aumentaron."
	prompt
	
Text_PPsMaximized::
	text_from_ram StringBuffer2
	text "Los PP fueron"
	line "maximizados."
	prompt

UnknownText_0x1c5cf1::
	text "Los PP fueron"
	line "restaurados."
	prompt

UnknownText_0x1c5d3e::
	text "Parece amargo<...>"
	prompt

UnknownText_0x1c5d50::
	text "No puede ser "
	line "usado en un huevo."
	prompt

UnknownText_0x1c5d6e::
	text "OAK: <PLAYER>!"
	line "¡No es el momento"
	cont "de usar eso!"
	prompt

UnknownText_0x1c5db6::
	text "Eso no tendra"
	line "ningún efecto."
	prompt

UnknownText_0x1c5dd0::
	text "¡El entrenador"
	line "bloqueo BALL!"
	prompt

UnknownText_0x1c5def::
	text "¡No seas ladrón!"
	prompt

UnknownText_0x1c5e3a::
	text "La caja #MON"
	line "esta llena.No"
	cont "puede ser usada."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> uso el@"
	text_low
	text_from_ram StringBuffer2
	text "."
	done

UnknownText_0x1c5ea8::
	text_from_ram StringBuffer1
	text " conoce"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "Ese #MON"
	line "sólo conoce un"
	cont "movimiento."
	done

UnknownText_0x1c5eda::
	text "¿Le haces olvidar"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "¡Hecho! Tu #MON"
	line "olvidó el movi-"
	cont "miento."
	done

UnknownText_0x1c5f17::
	text "¡Los HUEVOS no"
	line "saben movimientos!"
	done

UnknownText_0x1c5f36::
	text "¿No? Vuelve"
	line "cuando quieras."
	done

UnknownText_0x1c5f50::
	text "¿Qué movimiento"
	line "debería olvidar?"
	prompt

UnknownText_0x1c5f74::
	text "Soy el QUITA-"
	line "MOVIMIENTOS. Hago"

	para "olvidar movimien-"
	line "tos a los #MON."

	para "¿Quieres que"
	line "olviden algún"
	cont "movimiento?"
	done

UnknownText_0x1c5fd1::
	text "¿Qué #MON?"
	prompt

Text_DSTIsThatOK::
	text "."
	line "¿Correcto?"
	done

UnknownText_0x1c5ff1::
	text "."
	line "¿Correcto?"
	done
	
MoveReminderIntroText::
	text "¡Hola!Soy el"
	line "recuerda mov."

	para "Haré a tu"
	line "#MON recordar"

	para "un movimiento"
	line "si me traes una"
	cont "escama corazon."
	done

MoveReminderPromptText::
	text "¿Quieres que le"
	line "enseñe a tu"
	cont "#MON un mov?"
	done

MoveReminderWhichMonText::
	text "¿Que #MON"
	line "quiere recordar?"
	done

MoveReminderWhichMoveText::
	text "¿Que mov."
	line "quiere recordar?"
	done

MoveReminderNoHeartScaleText::
	text "¿Eh? No tienes"
	line "una escama"
	cont "corazón."

	para "A veces puedes"
	line "encontrarlas fuera."
	done

MoveReminderEggText::
	text "¡Eh! Es un"
	line "huevo."
	done

MoveReminderNoMonText::
	text "¿Eh? No es "
	line "un #MON."
	done

MoveReminderNoMovesText::
	text "Lo siento, no hay"
	line "ningun mov que"

	para "tu #MON"
	line "pueda recordar."
	done

MoveReminderCancelText::
	text "Si tu #MON"
	line "necesita aprender"

	para "un ataque vuelve"
	line "una escama"
	cont "corazon"
	done

AlreadyHaveTMText::
	text "Ya tienes esa"
	line "MT."
	done
	
ShellBoxText::
	text "Conchas:"
	line "@"
	deciram Shells, 2, 4
	db "@@"
