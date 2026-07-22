_UsedSurfText::
	text_from_ram StringBuffer2
	text " ¡Usó"
	line "SURF!"
	done

_CantSurfText::
	text "No puedes usar"
	line "SURF aquí."
	prompt

_AlreadySurfingText::
	text "Ya estás"
	line "SURFEANDO."
	prompt

_UsedDiveText::
	text_from_ram StringBuffer2
	text " ¡Usó"
	line "BUCEO!"
	done

_CantDiveText::
	text "No puedes usar"
	line "BUCEO aqui."
	prompt

_AskDiveDownText::
	text "El mar es profundo."
	line "¿Quieres usar"
	cont "BUCEO?"
	done

_AskDiveUpText::
	text "La luz se filtra"
	line "de la superficie."
	cont "¿Quieres usar"
	cont "buceo?"
	done

_CanDiveText::
	text "El mar es profundo."

	para "un #MON puede"
	line "usar BUCEO aquí."
	done

UnknownText_0x1c068e::
	text_from_ram StringBuffer2
	text " usó"
	line "CASCADA."
	done

UnknownText_0x1c06a3::
	text "Uau, es una gran"
	line "cascada."
	done

UnknownText_0x1c06bf::
	text "¿Quieres usar"
	line "CASCADA?"
	done

UnknownText_0x1c06de::
	text_from_ram StringBuffer2
	text " ¡Usó"
	line "EXCAVAR!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER> usó una"
	line "CUERDA HUIDA."
	done

UnknownText_0x1c071a::
	text "Volvió al último"
	line "#MON CENTER."
	done

UnknownText_0x1c073b::
	text "No puedes usar"
	line "eso aquí."

	para ""
	done

UnknownText_0x1c0774::
	text_from_ram StringBuffer2
	text " Usó"
	line "FUERZA."
	done

UnknownText_0x1c0788::
	text_from_ram StringBuffer1
	text " puede"
	line "mover piedras."
	prompt

UnknownText_0x1c07a0::
	text "¿Quieres usar"
	line "FUERZA?"
	done

UnknownText_0x1c07d8::
	text "¡Ahora se pueden"
	line "mover las piedras!"
	done

UnknownText_0x1c07f4::
	text "Un #MON podría"
	line "moverla."
	done

UnknownText_0x1c0816::
	text_from_ram StringBuffer2
	text " usó"
	line "TORBELLINO."
	prompt

UnknownText_0x1c082b::
    text "¡Un horrible"
	line "torbellino!"

	para "Un #MON"
	line "podría cruzarlo."
	done

UnknownText_0x1c0864::
	text "¿Quieres usar"
	line "TORBELLINO?"
	done

UnknownText_0x1c0897::
	text_from_ram StringBuffer2
	line "usó GOLPE CABEZA."
	prompt

UnknownText_0x1c08ac::
	text "No pasó nada…"
	done

UnknownText_0x1c08bc::
	text "En este árbol"
	line "podría haber un"
	cont "#MON."

	para "¿Quieres usar"
	line "GOLPE CABEZA?"
	done

UnknownText_0x1c08f0::
	text_from_ram StringBuffer2
	text " usó"
	line "GOLPE ROCA!"
	prompt

UnknownText_0x1c0906::
	text "Un #MON"
	line "podría romperla."
	done

UnknownText_0x1c0924::
	text "¿Quieres usar"
	line "GOLPE ROCA?"
	done

UnknownText_0x1c0958::
	text "¡Oh!"
	line "¡Han picado!"
	prompt

UnknownText_0x1c0965::
	text "¡No pican!"
	prompt

UnknownText_0x1c099a::
	text "¡No puedes"
	line "bajarte de ahí!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER> subió a"
	line "@"
	text_from_ram StringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER> bajó"
	line "de @"
	text_from_ram StringBuffer2
	text "."
	done

UnknownText_0x1c09dd::
	text "¿Utilizas CORTE?"
	done

UnknownText_0x1c0a05::
	text "¡Este árbol se"
	line "puede CORTAR!"
	done

_AskRockClimbText::
	text "¿Quieres usar"
	line "TREPARROCAS?"
	done

_UsedRockClimbText::
	text_from_ram StringBuffer2
	text " usó"
	line "TREPARROCAS."
	prompt

_CantRockClimbText::
	text "La pared es muy"
	line "rocosa<...>"

	para "Quizás un #MON"
	line "pueda escalarla."
	done

UnknownText_0x1c0a1c::
	text "¡<PLAYER> encontró"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "¡Pero <PLAYER>"
	line "no puede llevar"
	cont "más objetos!"
	done

UnknownText_0x1c0a4e::
	text "¡A <PLAYER> no le"
	line "quedan #MON!"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	done

UnknownText_0x1c0a77::
	text "El BUSCAOBJETOS"
	line "indica que hay un"
	cont "objeto cerca."
	prompt

UnknownText_0x1c0aa9::
	text "El BUSCAOBJETOS"
	line "no responde."
	prompt

UnknownText_0x1c0acc::
	text_from_ram StringBuffer3
	text ""
	line "debilitado."
	prompt

UnknownText_0x1c0b03::
	text_from_ram StringBuffer3
	text " usó"
	line "DULCE AROMA."
	done

UnknownText_0x1c0b1a::
	text "Parece que aquí"
	line "no hay nada…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> regó"
	line "con agua."

	para "Pero no pasó"
	line "nada<...>"
	done

UnknownText_0x1c0b65::
	text "¡Los #MON de"
	line "<PLAYER> fueron"
	cont "curados!"
	done

Text_AnEGGCantHoldAnItem::
	text "Un HUEVO no puede"
	line "llevar un objeto."
	prompt

UnknownText_0x1c0ba5::
	text "¿Cuántos quieres"
	line "tirar?"
	done

UnknownText_0x1c0bbb::
	text "¿Tirar @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text "unidad/es de"
	cont "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1c0bd8::
	text "Tiró"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c0bee::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	prompt

Text_YouDontHaveAPkmn::
	text "¡No tienes"
	line "ningún #MON!"
	prompt

UnknownText_0x1c0c2e::
	text "Asignado a select"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c0c45::
	text "Ese objeto no se"
	line "puede registrar."
	prompt

UnknownText_0x1c0c63::
	text "¿Adónde quieres"
	line "moverlo?"
	done

UnknownText_0x1c0c83::
	text ""
	done

Text_AreYouABoyOrAreYouAGirl::
	text "¿Eres un chico?"
	line "¿O eres una chica?"
	done

UnknownText_0x1c0cc6::
	text "<USER>'s"
	line "@"
	text_from_ram StringBuffer2
	db "@@"

UnknownText_0x1c0cd0::
	interpret_data
	text $4c, "¡Subió mucho!"
	prompt

UnknownText_0x1c0ce0::
	text " ¡Subió!"
	prompt

UnknownText_0x1c0ceb::
	text "<TARGET>'s"
	line "@"
	text_from_ram StringBuffer2
	db "@@"

UnknownText_0x1c0cf5::
	interpret_data
	text $4c, "¡Bajó mucho!"
	prompt

UnknownText_0x1c0d06::
	text " ¡Bajo!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@@"

UnknownText_0x1c0d26::
	text ""
	line "¡Tomo luz solar!"
	prompt

UnknownText_0x1c0d5c::
	text ""
	line "¡La liberó!"
	prompt

FlewUpHighText::
	text ""
	line "¡Voló alto!"
	prompt

UnknownText_0x1c0d6c::
	text ""
	line "¡Excavó un agujero!"
	prompt

HidUnderwaterText::
	text ""
	line "¡Se escondió"
	cont "bajo el agua!"
	prompt

UnknownText_0x1c0db0::
	text "¿Huh?"
	para "@@"

UnknownText_0x1c0db8::
	text ""
	done

UnknownText_0x1c0dba::
	text_from_ram StringBuffer1
	line "salió del"
	cont "HUEVO!@"
	sound_caught_mon
	text_waitbutton
	db "@@"

UnknownText_0x1c0dd8::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "Es el @"
	text_from_ram wBreedMon2Nick
	text "que dejé con la"

	para "ENCARGADA de la"
	line "GUARDERÍA."
	done

UnknownText_0x1c0e24::
	text "Es el @"
	text_from_ram wBreedMon1
	text "que dejé con el"

	para "ENCARGADO de la"
	line "GUARDERÍA."
	done

UnknownText_0x1c0e54::
	text "Está rebosante"
	line "de energía."
	prompt

UnknownText_0x1c0e6f::
	text "No está interesado"
	line "en @"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "Está interesado"
	line "en @"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "Es agradable con"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "Muestra interés"
	line "por @"
	text_from_ram StringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Aquí no hay"
	line "ninguna CARTA."
	prompt

ClearedMailPutAwayText::
	text "La CARTA fue"
	line "enviada."
	prompt

MailPackFullText::
	text "¡MOCHILA llena!"
	prompt

MailMessageLostText::
	text "Perderás el"
	line "mensaje de la"
	cont "CARTA. ¿Vale?"
	done

MailAlreadyHoldingItemText::
	text "Ya lleva un"
	line "objeto."
	prompt

MailEggText::
	text "Un HUEVO no puede"
	line "llevar CARTAS."
	prompt

MailMovedFromBoxText::
	text "La CARTA fue"
	line "sacada del BUZÓN."
	prompt
	
Text_WasSentToBillsPC::
	text_from_ram StringBuffer1
	line "fue enviado al"
	cont "PC de BILL."
	prompt

UnknownText_0x1c1006::
	text "¡Necesitas #MON"
	line "a los que llamar!"
	prompt

UnknownText_0x1c1024::
	text "¿Qué harás?"
	done

UnknownText_0x1c102b::
	text "Hay un #MON que"
	line "lleva una CARTA."

	para "Por favor, quita"
	line "la CARTA."
	prompt

UnknownText_0x1c10c0::
	text "¡Atrapado @"
	text_from_ram StringBuffer1
	text "!"
	prompt

UnknownText_0x1c10cf::
	text "¿Cambiar #MON?"
	done

UnknownText_0x1c10dd::
	text "Ya tienes un"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "El ganador de esté"
	line "Concurso de"
	interpret_data
	text "<...>"

	para "Captura de Bichos"
	line "es @"
	para "…"

	para "¡@"
	text_from_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_from_ram StringBuffer1
	text "!@@"

ContestJudging_FirstPlaceScoreText::
	text ""

	para "¡La puntuación"
	line "ganadora fue de"
	cont "@"
	deciram wBugContestFirstPlaceScore, 2, 3
	text " puntos!"
	prompt

ContestJudging_SecondPlaceText::
	text "¡El segundo lugar"
	line "fue para"

	para "@"
	text_from_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_from_ram StringBuffer1
	text "!@@"

ContestJudging_SecondPlaceScoreText::
	para "¡La puntuación"
	line "fue de"
	cont "@"
	deciram wBugContestSecondPlaceScore, 2, 3
	text " puntos!"
	prompt

ContestJudging_ThirdPlaceText::
	text "¡El tercer lugar"
	line "fue para"

	para "@"
	text_from_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_from_ram StringBuffer1
	text "!@@"

ContestJudging_ThirdPlaceScoreText::
	text ""

	para "¡La puntuación"
	line "fue de"
	cont "@"
	deciram wBugContestThirdPlaceScore, 2, 3
	text " puntos!"
	prompt

UnknownText_0x1c1203::
	text "Déjame que mida a"
	line "ese MAGIKARP."

	para "¡Mmmmm…! Mide"
	line "@"
	text_from_ram StringBuffer1
	text " cm."
	prompt

UnknownText_0x1c123a::
	text "RECORD ACTUAL"

	para "@"
	text_from_ram StringBuffer1
	text " cm,"
	line "fue atrapado por"
	cont "@"
	text_from_ram wMagikarpRecordHoldersName
	text_waitbutton
	db "@@"

UnknownText_0x1c1261::
	text "¡Enhorabuena!"

	para "Coincide con el"
	line "número ID de"

	para "@"
	text_from_ram StringBuffer1
	text "de tu equipo."
	prompt

UnknownText_0x1c12ae::
	text "¡Enhorabuena!"

	para "Coincide con el"
	line "número ID de"

	para "@"
	text_from_ram StringBuffer1
	text "de tu CAJA del PC."
	prompt

UnknownText_0x1c12fc::
	text "¿Le das un mote al"
	line "@"
	text_from_ram StringBuffer1
	text " que"
	cont "has recibido?"
	done

UnknownText_0x1c1328::
	text "¡Bzzzz! ¡Para usar"
	line "esto necesitas un"
	cont "#MON!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

UnknownText_0x1c1368::
	text "¿Qué quieres"
	line "hacer?"
	done

_KrissPCHowManyWithdrawText::
	text "¿Cuántos quieres"
	line "sacar?"
	done

_KrissPCWithdrewItemsText::
	text "Sacaste @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text "unidad/es de"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt

_KrissPCNoRoomWithdrawText::
	text "No hay sitio para"
	line "más objetos."
	prompt

UnknownText_0x1c13df::
	text "¡No tienes"
	line "objetos!"
	prompt

_KrissPCHowManyDepositText::
	text "¿Cuántos quieres"
	line "dejar?"
	done

_KrissPCDepositItemsText::
	text "Dejaste @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text "unidad/es de"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt

_KrissPCNoRoomDepositText::
	text "No hay sitio donde"
	line "guardar objetos."
	prompt

_KrissPCBetterKeepText::
	text "Mejor guardarlo"
	line "por ahora."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

UnknownText_0x1c1462::
	text "¿Acceder a qué PC?"
	done

UnknownText_0x1c1474::
	text "Accedes al PC de"
	line "BILL."

	para "Accedes al Sistema"
	line "de Almacenamiento"
	cont "de los #MON."
	prompt

UnknownText_0x1c14a4::
	text "Accedes a tu PC."

	para "Accedes al Sistema"
	line "de Almacenamiento"
	cont "de Objetos."
	prompt

UnknownText_0x1c14d2::
	text "Accedes al PC del"
	line "PROF. OAK."

	para "Accedes al Sistema"
	line "de Evaluación de"
	cont "la #DEX."
	prompt

UnknownText_0x1c1505::
	text "<...>"
	line "Conexión cerrada."
	done

_OakPCText1::
	text "¿Quieres evaluar"
	line "tu #DEX?"
	done

_OakPCText2::
	text "Nivel actual de"
	line "la #DEX:"
	prompt

_OakPCText3::
	text "Viste: @"
	text_from_ram StringBuffer3
	text " #MON"
	line "Tienes: @"
	text_from_ram StringBuffer4
	text " #MON"

	para "Evaluación del"
	line "PROF. OAK:"
	done

_OakRating01::
	text "¡Busca #MON en"
	line "zonas de hierba!"
	done

_OakRating02::
	text "Bien. Ya veo que"
	line "sabes cómo usar"
	cont "las # BALL."
	done

_OakRating03::
	text "Lo estás haciendo"
	line "bien, pero tienes"

	para "un largo camino"
	line "por recorrer."
	done

_OakRating04::
	text "Debes completar la"
	line "#DEX. Atrapa"

	para "diferentes tipos"
	line "de #MON."
	done
	
_OakRating05::
	text "Ya veo que te"
	line "estás esforzando."

	para "Tu #DEX empieza"
	line "a llenarse."
	done

_OakRating06::
	text "Para evolucionar,"
	line "algunos #MON"

	para "crecen y otros"
	line "usan las PIEDRAS."
	done

_OakRating07::
	text "¿Tienes una CAÑA?"
	line "Puedes atrapar"

	para "algunos #MON"
	line "pescando."
	done

_OakRating08::
	text "¡Excelente!"
	line "¡Parece que te"

	para "gusta coleccionar"
	line "cosas!"
	done

_OakRating09::
	text "Algunos #MON"
	line "sólo aparecen a"

	para "ciertas horas del"
	line "día."
	done

_OakRating10::
	text "Tu #DEX se"
	line "está llenando."
	cont "¡Sigue así!"
	done
	
_OakRating11::
	text "¡Impresionante!"
	line "No sólo atrapas"

	para "#MON, también"
	line "los evolucionas."
	done

_OakRating12::
	text "¿Conoces a CÉSAR?"
	line "Sus #BALL"

	para "personalizadas son"
	line "de gran ayuda."
	done

_OakRating13::
	text "¡Uau! Tienes más"
	line "#MON que en"

	para "la #DEX"
	line "anterior."
	done

_OakRating14::
	text "¿Estás cambiando"
	line "tus #MON?"

	para "¡Es duro hacerlo"
	line "en solitario!"
	done

_OakRating15::
	text "¡Uau! ¡Tienes 200!"
	line "¡Tu #DEX es"
	cont "estupenda!"
	done

_OakRating16::
	text "¡Tienes tantos"
	line "#MON! ¡Me"

	para "has ayudado mucho"
	line "en mis estudios!"
	done

_OakRating17::
	text "¡Genial! ¡Podrías"
	line "convertirte en un"

	para "profesor #MON"
	line "ahora mismo!"
	done

_OakRating18::
	text "¡Tu #DEX es"
	line "increíble!"

	para "¡Eres muy"
	line "profesional!"
	done

_OakRating19::
	text "¡Uau! ¡Una #DEX"
	line "perfecta! ¡Mi"

	para "sueño cumplido!"
	line "¡Enhorabuena!"
	done

_OakPCText4::
	text "Cerrado enlace al"
	line "PC del PROF. OAK."
	done

UnknownText_0x1c1a6c::
	text "¿Salir del"
	line "concurso?"
	done

UnknownText_0x1c1a90::
	text "¿Cuántas unidades"
	line "quieres tirar?"
	done

UnknownText_0x1c1aad::
	text "¿Quieres tirar @"
	deciram wItemQuantityChangeBuffer, 1,2
	text ""
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1c1aca::
	text "Tiraste"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1c1adf::
	text "¡Es demasiado"
	line "importante para"
	cont "tirarlo!"
	prompt
	
UnknownText_0x1c1b03::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	done

UnknownText_0x1c1b2c::
	text "Quitaste"
	line "@"
	text_from_ram StringBuffer1
	text ""
	cont "de @"
	text_from_ram wMonOrItemNameBuffer
	text ""

	para "y le diste"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text "Equipar a"
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text ""
	cont "con @"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Primero quita"
	line "la CARTA."
	prompt

UnknownText_0x1c1b8e::
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "no lleva nada."
	prompt

UnknownText_0x1c1baa::
	text "Caja de objetos"
	line "llena."
	prompt

UnknownText_0x1c1bc4::
	text "Quitaste"
	line "@"
	text_from_ram StringBuffer1
	text ""
	cont "de @"
	text_from_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "ya va equipado con"

	para "@"
	text_from_ram StringBuffer1
	text "."
	line "¿Cambiar objetos?"
	done

UnknownText_0x1c1c09::
	text "Este objeto no"
	line "puede ser llevado."
	prompt

UnknownText_0x1c1c22::
	text "¿O prefieres"
	line "borrar el mensaje?"
	done

UnknownText_0x1c1c47::
	text "Quitada CARTA de"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "No hay bastante"
	line "espacio para"
	cont "quitar la CARTA."
	prompt

UnknownText_0x1c1c86::
	text "¿Enviar la"
	line "CARTA a tu PC?"
	done

UnknownText_0x1c1ca9::
	text "El BUZÓN de tu"
	line "PC está lleno."
	prompt

UnknownText_0x1c1cc4::
	text "La CARTA fue"
	line "enviada a tu PC."
	prompt

UnknownText_0x1c1ce3::
	text "¡PS insuficientes!"
	prompt

UnknownText_0x1c1cf3::
	text "Puedes asignar un"
	line "objeto de tu"

	para "MOCHILA al botón"
	line "SELECT."
	done

_OakText1::
	text "Bienvenido a las"
	line "ISLAS NARANJA."

	para "Soy la PROF. IVY."
	line "Dirijo el LAB"
	cont "de ISLA VALENCIA."

	prompt

_OakText2::
	text "Este mundo está"
	line "habitado por unas"

	cont "criaturas llamadas"
	cont "#MON.@@"
	done

_OakText3::
	text_waitbutton
	db "@@"

_OakText4::
	text "La gente y los"
	line "#MON conviven"

	para "ayudándose unos"
	line "a otros."

	para "Algunos juegan con"
	line "los #MON, otros"
	cont "luchan con ellos."
	prompt

_OakText5::
	text "Pero aún hay"
	line "muchas cosas que"
	cont "no sabemos."

	para "Quedan muchos"
	line "misterios por"
	cont "resolver. Por eso"

	para "estudio a diario"
	line "a los #MON."
	prompt
