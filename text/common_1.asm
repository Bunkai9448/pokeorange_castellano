_FruitBearingTreeText::
	text "Es un árbol"
	line "frutal."
	done

_HeyItsFruitText::
	text "¡Oye! ¡Mira qué"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "¡Obtuvo"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Pero la MOCHILA"
	line "está llena…"
	done

_NothingHereText::
	text "Aquí no hay"
	line "nada…"
	done

UnknownText_0x1bc0a2::
	text "¡@"
	text_from_ram StringBuffer1
	text "recuperó @"
	deciram wCurHPAnimDeltaHP, 2, 3
	text " PS!"
	done

UnknownText_0x1bc0bb::
	text_from_ram StringBuffer1
	text ""
	line "curado del veneno."
	done

UnknownText_0x1bc0d2::
	text_from_ram StringBuffer1
	text "curado de"
	cont "parálisis."
	done

UnknownText_0x1bc0ea::
	text_from_ram StringBuffer1
	text "curado de"
	cont "quemaduras."
	done

UnknownText_0x1bc101::
	text_from_ram StringBuffer1
	text "fue descongelado."
	done

UnknownText_0x1bc115::
	text_from_ram StringBuffer1
	text "se despertó."
	done

UnknownText_0x1bc123::
	text_from_ram StringBuffer1
	text "recuperó la salud."
	done

UnknownText_0x1bc13a::
	text_from_ram StringBuffer1
	text "es revitalizado."
	done

UnknownText_0x1bc14f::
	text "¡@"
	text_from_ram StringBuffer1
	text "subió al nivel"
	cont "@"
	deciram CurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	done
	db "@@"

UnknownText_0x1bc16e::
	text_from_ram StringBuffer1
	text "recuperó el"
	cont "conocimiento."
	done

MakePinkText::
	text_from_ram StringBuffer1
	text " ¡se"
	line "volvió rosa!"
	done

MakeNotPinkText::
	text_from_ram StringBuffer1
	text " ¡Ya no"
	line "está rosa!"
	done

UnknownText_0x1bc29c::
	text "¿Te importaría"
	line "decirme la hora?"
	prompt

UnknownText_0x1bc2eb::
	text "¿Qué hora es?"
	done

UnknownText_0x1bc308::
	text "¿Cuántos minutos?"
	done

UnknownText_0x1bc323::
	text "?" ; es el question mark de los prompt, , no tocar
	done

UnknownText_0x1bc31b::
	text "¿Con @@" ; para confirmar min en intro, no tocar, el "?" es el string de arriba 0x1bc323
	done

UnknownText_0x1bc369::
	text "¿Qué día es?"
	done

UnknownText_0x1bc37a::
	text ", ¿verdad?"
	done

UnknownText_0x1bc326::
	text ""
	done

UnknownText_0x1bc6e9::
	text_from_ram wPlayerTrademonSpeciesName
	text " fue"
	line "enviado a @"
	text_from_ram wOTTrademonSenderName
	text "."
	done

UnknownText_0x1bc701::
	text ""
	done

UnknownText_0x1bc703::
	text_from_ram wOTTrademonSenderName
	text " dice adios"
	line "a"
	done

UnknownText_0x1bc719::
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc71f::
	text "Cuida bien de"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc739::
	text "Por @"
	text_from_ram wPlayerTrademonSpeciesName
	text "de @"
	text_from_ram wPlayerTrademonSenderName
	text ","
	done

UnknownText_0x1bc74c::
	text_from_ram wOTTrademonSenderName
	text "envía a"
	cont "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc75e::
	text_from_ram wOTTrademonSenderName
	text "cambiará a"
	cont "@"
	text_from_ram wOTTrademonSpeciesName
	done

UnknownText_0x1bc774::
	text "por @"
	text_from_ram wPlayerTrademonSpeciesName
	text "de @"
	text_from_ram wPlayerTrademonSenderName
	text "."
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "retiró a"
	cont "@"
	text_from_ram EnemyMonNick
	text "."
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "utilizó"

	para "@"
	text_from_ram wMonOrItemNameBuffer
	text "con"
	cont "@"
	text_from_ram EnemyMonNick
	text "."
	prompt

UnknownText_0x1bd2bc::
	text "¿Que planta?"
	done

UnknownText_0x1bd2ca::
	text "SPEAKER: BEEEP!"

	para "¡Tiempo!"
	done

UnknownText_0x1bd2e7::
	text "SPEAKER: ¿El"
	line "concurso acabó!"
	done

UnknownText_0x1bd308::
	text "Agotado el efecto"
	line "del REPELENTE."
	done

UseAnotherRepelText::
	text "Agotado el efecto"
	line "del REPELENTE."
	done

	para "¿Usar otro?"
	done

UnknownText_0x1bd321::
	text "<PLAYER>"
	line "encontró"
	cont "@"
	text_from_ram StringBuffer3
	text "."
	done

UnknownText_0x1bd331::
	text "Pero a <PLAYER>"
	line "no le queda sitio."
	done

UnknownText_0x1bd39e::
	text "Guardando ¡No<...>"
	line "Apagues !"
	done

UnknownText_0x1bd3d7::
	text "No tienes fichas."
	prompt

UnknownText_0x1bd3eb::
	text "No tienes ningún"
	line "MONEDERO."
	prompt

UnknownText_0x1bd407::
	text "¡Bien, conecta el"
	line "cable Game Link!"
	prompt

UnknownText_0x1bd429::
	text "<PLAYER>"
	line "cambió a"

	para "@"
	text_from_ram StringBuffer2
	text "por"
	cont "@"
	text_from_ram wMonOrItemNameBuffer
	text ".@"
	done

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	interpret_data
	db "@@"

UnknownText_0x1bd449::
	text "Ah, hola."
	line "¿Tienes un"
	cont "@"
	text_from_ram StringBuffer1
	text "?"

	para "¿Quieres cambiarlo"
	line "por this @"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd48c::
	text "¿No quieres"
	line "cambiarlo? ¡Bah!"
	done

UnknownText_0x1bd4aa::
	text "¿Qué? Ése no es"
	line "@"
	text_from_ram StringBuffer1
	text "."
	cont "¡Qué chasco…!"
	done

UnknownText_0x1bd4d2::
	text "¡Sí! ¡Conseguí un"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	cont "¡Gracias!"
	done

UnknownText_0x1bd4f4::
	text "¡La cosecha será"
	line "maravillosa!"
	done

UnknownText_0x1bd512::
	text "Estoy buscando a"
	line "este #MON."

	para "Si tuvieras un"
	line "@"
	text_from_ram StringBuffer1
	text ","

	para "¿lo cambiarías por"
	line "mi @"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd565::
	text "¿Tú tampoco"
	line "tienes uno?"

	para "¡Pues vaya! ¡Qué"
	line "decepción…!"
	done

UnknownText_0x1bd5a1::
	text "¿No tienes un"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	cont "¡Qué lástima!"
	done

UnknownText_0x1bd5cc::
	text "¡Genial! ¡Gracias!"

	para "Por fin conseguí"
	line "un @"
	text_from_ram StringBuffer1
	text "."
	done

UnknownText_0x1bd5f4::
	text "¡El @"
	text_from_ram wMonOrItemNameBuffer
	text "que me cambiaste"
	cont "está fenomenal!"
	done

UnknownText_0x1bd621::
	text_from_ram wMonOrItemNameBuffer
	text " es"
	line "genial, pero no lo"

	para "tengo. ¿Tienes un"
	line "@"
	text_from_ram StringBuffer1
	text "?"

	para "¿Quieres cambiarlo"
	line "por mi"
	cont "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd673::
	text "¿No quieres"
	line "cambiarlo? ¡Vaya!"
	done

UnknownText_0x1bd696::
	text "Ese no es un"
	line "@"
	text_from_ram StringBuffer1
	text "."

	para "Cámbiamelo si"
	line "consigues uno."
	done

UnknownText_0x1bd6cd::
	text "¡Uau! ¡Gracias!"
	line "¡Siempre quise un"
	cont "@"
	text_from_ram wMonOrItemNameBuffer
	text "!"
	done

UnknownText_0x1bd6f5::
	text "¿Cómo está el"
	line "@"
	text_from_ram StringBuffer2
	text "que te cambié?"

	para "¡Tu @"
	text_from_ram wMonOrItemNameBuffer
	text "es tan mono!"
	done

UnknownText_0x1bd731::
	text "¿Eh? ¿Que paso?"
	done

UnknownText_0x1bd745::
	text "Intercambiar es"
	line "tan raro…"

	para "Todavía tengo mu-"
	line "cho que aprender."
	done

UnknownText_0x1bdaa9::
	text "Soy el ENCARGADO"
	line "de la GUARDERÍA."

	para "¿Quieres que"
	line "cuide un #MON?"
	done

UnknownText_0x1bdad8::
	text "Soy el ENCARGADO"
	line "de la GUARDERÍA."

	para "¿Sabes algo sobre"
	line "los HUEVOS?"

	para "Mi mujer y yo"
	line "estábamos cuidando"
	cont "unos #MON."

	para "¡Y de pronto"
	line "vimos un HUEVO!"

	para "¿No te parece"
	line "increíble?"

	para "¿Quieres que te"
	line "cuide un #MON?"
	done

UnknownText_0x1bdb85::
	text "Soy la ENCARGADA"
	line "de la GUARDERÍA."

	para "¿Quieres que te"
	line "cuide un #MON?"
	done

UnknownText_0x1bdbbb::
	text "Soy la ENCARGADA"
	line "de la GUARDERÍA."

	para "¿Sabes algo sobre"
	line "los HUEVOS?"

	para "Mi marido y yo"
	line "estábamos cuidando"
	cont "unos #MON."

	para "¡Y de pronto"
	line "vimos un HUEVO!"

	para "¿No te parece"
	line "increíble?"

	para "¿Quieres que te"
	line "cuide un #MON?"
	done

UnknownText_0x1bdc79::
	text "¿Cuál quieres"
	line "que cuide?"
	prompt

UnknownText_0x1bdc97::
	text "¿Oh? Pero sólo"
	line "tienes un #MON."
	prompt

UnknownText_0x1bdcb8::
	text "Perdona, pero no"
	line "acepto HUEVOS."
	prompt

UnknownText_0x1bdcda::
	text "Quita la CARTA y"
	line "vuelve a verme."
	prompt

UnknownText_0x1bdcff::
	text "Si me lo das,"
	line "¿con quién vas a"
	cont "combatir?"
	prompt

UnknownText_0x1bdd30::
	text "Vale. Cuidaré de"
	line "tu @"
	text_from_ram StringBuffer1
	text "."
	prompt
UnknownText_0x1bdd4b::
	text "Vuelve a por él"
	line "más tarde."
	done

UnknownText_0x1bdd64::
	text "¿Somos geniales o"
	line "no? ¿Quieres ver a"
	cont "tu @"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1bdd96::
	text "Tu @"
	text_from_ram StringBuffer1
	text "ha crecido mucho."

	para "En cuanto a su ni-"
	line "vel, ha subido @"
	deciram StringBuffer2 + 1, 1, 3
	text "."

	para "Recuperar a tu"
	line "#MON te"
	cont "costará @"
	deciram StringBuffer2 + 2, 3, 4
	text "¥."
	done

UnknownText_0x1bde04::
	text "¡Perfecto! ¡Aquí"
	line "está tu #MON!"
	prompt

UnknownText_0x1bde1f::
	text "<PLAYER> recogió"
	line "a @"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1bde32::
	text "¿Ya de vuelta?"
	line "Tu @"
	text_from_ram StringBuffer1

	para "debería pasar más"
	line "tiempo aquí. Pero"

	para "recoger ahora a"
	line "tu #MON, te"
	cont "costará 100¥."
	done

UnknownText_0x1bdea2::
	text "¡No tienes sitio"
	line "para él!"
	prompt

UnknownText_0x1bdebc::
	text "No tienes bastante"
	line "dinero."
	prompt

UnknownText_0x1bded9::
	text "No hay problema."
	prompt

UnknownText_0x1bdee9::
	text "Vuelve cuando"
	line "quieras."
	done

UnknownText_0x1bdef6::
	text "Aún no…"
	done

UnknownText_0x1bdf00::
	text "¡Ah, eres tú!"

	para "Estábamos cuidando"
	line "de tus #MON y…"

	para "¡Menuda sorpresa"
	line "nos hemos llevado!"

	para "¡Tus #MON han"
	line "tenido un HUEVO!"

	para "No sabemos cómo ha"
	line "llegado ahí, pero"

	para "es de tus #MON."
	line "¿Lo quieres?"
	done

UnknownText_0x1bdfa5::
	text "¡<PLAYER> recibió"
	line "el HUEVO!"
	done

UnknownText_0x1bdfba::
	text "Cuídalo bien."
	done

UnknownText_0x1bdfd1::
	text "Cuidaré de él."
	line "¡Gracias!"
	done

UnknownText_0x1bdff2::
	text "No tienes sitio en"
	line "tu equipo. Vuelve"
	cont "en otro momento."
	done
