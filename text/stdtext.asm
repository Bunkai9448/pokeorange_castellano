NurseMornText:
	text "¡Bienvenidos a"
	line "nuestro CENTRO"
	cont "#MON!"
	done

NurseDayText:
	text "¡Bienvenidos a"
	line "nuestro CENTRO"
	cont "#MON!"
	done

NurseNiteText:
	text "¡Buenas noches!"
	line "Bienvenidos a"

	para "nuestro CENTRO"
	line "#MON."
	done

PokeComNurseMornText:
	text "¡Buenas!"

	para "Éste es el CENTRO"
	line "de COMUNICACIONES"

	para "#MON o"
	line "CENTRO #COM."
	done

PokeComNurseDayText:
	text "¡Hola!"

	para "Éste es el CENTRO"
	line "de COMUNICACIONES"

	para "#MON o"
	line "CENTRO #COM."
	done

PokeComNurseNiteText:
	text "Te veo trabajando"
	line "hasta tarde…"

	para "Éste es el CENTRO"
	line "de COMUNICACIONES"

	para "#MON o"
	line "CENTRO #COM."
	done

NurseAskHealText:
	text "Nosotros curamos"
	line "a tus #MON."

	para "¿Quieres curar a"
	line "tus #MON?"
	done

NurseTakePokemonText:
	text "Muy bien, déjame"
	line "tus #MON."
	done

NurseReturnPokemonText:
	text "¡Gracias por"
	line "esperar!"

	para "Tus #MON están"
	line "en plena forma."
	done

NurseGoodbyeText:
	text "¡Vuelve siempre"
	line "que quieras!"
	done

NursePokerusText:
	text "Tus #MON"
	line "tienen minúsculas"

	para "formas de vida"
	line "unidas a ellos."

	para "Tus #MON están"
	line "sanos y parecen"
	cont "contentos."

	para "Pero no podemos"
	line "darte más"

	para "información en un"
	line "CENTRO #MON."
	done

PokeComNursePokerusText:
	text "Tus #MON"
	line "tienen minúsculas"

	para "formas de vida"
	line "unidas a ellos."

	para "Tus #MON están"
	line "sanos y parecen"
	cont "contentos."

	para "Pero no podemos"
	line "darte más"
	cont "información."
	done

DifficultBookshelfText:
	text "Está llena de"
	line "libros complejos."
	done

PictureBookshelfText:
	text "¡Una colección de"
	line "libros ilustrados"
	cont "de #MON!"
	done

MagazineBookshelfText:
	text "Revistas #MON…"
	line "TELEVISOR #MON,"

	para "MANUAL #MON,"
	line "GRÁFICA #MON…"
	done

IncenseBurnerText:
	text "¿Qué es esto?"

	para "¡Oh! ¡Es un"
	line "pebetero!"
	done

MerchandiseShelfText:
	text "¡Cantidad de"
	line "artículos #MON!"
	done

TownMapText:
	text "MAPA del PUEBLO."
	done

WindowText:
	text "¡Mi reflejo!"
	line "¡Qué guay!"
	done

TVText:
	text "Es una TV."
	done

WrongSideText:
	text "Ups, no lo veo."
	done

RadioText:
	text "Solo se oye"
	line "estática<...>"
	done

TrashCanText:
	text "No hay nada"
	line "aquí<...>"
	done

PokeCenterSignText:
	text "Cura a tus #MON"
	line "CENTRO #MON"
	done

MartSignText:
	text "Todo lo necesario"
	line "para tus #MON"

	para "TIENDA #MON"
	done

ContestResults_ReadyToJudgeText:
	text "Vamos a evaluar"
	line "a tus #MON."

	para "<……>"
	line "<……>"

	para "¡Hemos elegido a"
	line "los ganadores!"

	para "Aquí van…"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER> gana el"
	line "premio n.°@"
	text_from_ram StringBuffer3
	text ":"
	cont "¡una @"
	text_from_ram StringBuffer4
	text "!"
	done

ReceivedItemText::
	text "<PLAYER> recibió"
	line "@"
	text_from_ram StringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "¡Participa en el"
	line "próximo concurso!"
	done

ContestResults_ConsolationPrizeText:
	text "¡Todos los demás"
	line "reciben una BAYA"
	cont "como consolación!"
	done

ContestResults_DidNotWinText:
	text "A ver si mejoras"
	line "la próxima vez."
	done

ContestResults_ReturnPartyText:
	text "Aquí tienes los"
	line "#MON que"

	para "te estábamos"
	line "cuidando."
	done

ContestResults_PartyFullText:
	text "¡Equipo completo!"
	line "El #MON fue"

	para "enviado a tu CAJA"
	line "en el PC de BILL."
	done

GymStatue_CityGymText:
	text "GIMNASIO #MON"
	line "DE @"
	text_from_ram StringBuffer3
	done

GymStatue_WinningTrainersText:
	text "LÍDER: @"
	text_from_ram StringBuffer4
	text ""

	para "GANADORES:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Bienvenidos al"
	line "CASINO."
	done

CoinVendor_NoCoinCaseText:
	text "¿Necesitas fichas"
	line "de juego?"

	para "¡Oh! No tienes"
	line "un MONEDERO"
	cont "para tus fichas."
	done

CoinVendor_IntroText:
	text "¿Necesitas fichas"
	line "de juego?"

	para "50 fichas por"
	line "¥1000. ¿Quieres"
	cont "comprar?"
	done

CoinVendor_Buy50CoinsText:
	text "¡Gracias! Aquí"
	line "tienes 50 fichas."
	done

CoinVendor_Buy500CoinsText:
	text "¡Gracias! Aquí"
	line "tienes 500 fichas."
	done
	
CoinVendor_Buy1000CoinsText:
	text "¡Gracias! Aquí"
	line "tienes 1000 fichas."
	done

CoinVendor_NotEnoughMoneyText:
	text "No tienes"
	line "bastante dinero."
	done

CoinVendor_CoinCaseFullText:
	text "¡Uups! Tu MONEDERO"
	line "está lleno."
	done

CoinVendor_CancelText:
	text "¿No quieres"
	line "fichas? Vuelve"
	cont "cuando quieras."
	done

BugContestPrizeNoRoomText:
	text "¡Oh! Tu MOCHILA"
	line "está llena."

	para "Te guardaremos"
	line "esto. Vuelve"

	para "cuando tengas"
	line "sitio."
	done

HappinessText3:
	text "¡Uauu! ¡Tú y tus"
	line "#MON estáis"
	cont "muy unidos!"
	done

HappinessText2:
	text "Cuanto más tiempo"
	line "pases con los"

	para "#MON, más"
	line "te querrán."
	done

HappinessText1:
	text "No has domesticado"
	line "a tu #MON."

	para "Si no eres amable,"
	line "éste se enfadará."
	done

FullBoxText:
	text "¡La CAJA DEL"
	line "PC está llena!"

	para "¡Debes cambiar"
	line "de caja si"

	para "quieres atrapar"
	line "más #MON!"
	done

NewEggCallText:
	text "☎ GUARD.: Hola"
	line "<PLAYER>, tus"
	cont "#MON han"
	cont "tenido un huevo."

	para "Cuidaremos de él"
	line "en Murcott hasta"
	cont "que lo recojas."
	done
