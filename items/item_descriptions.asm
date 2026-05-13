PrintItemDescription: ; 0x1c8955
; Print the description for item [CurSpecies] at de.

	ld a, [CurSpecies]
	cp TM01
	jr c, .not_a_tm

	ld [wCurItem], a
	push de
	farcall GetTMHMItemMove
	pop hl
	ld a, [wd265]
	ld [CurSpecies], a
	predef_jump PrintMoveDesc

.not_a_tm
	push de
	ld hl, ItemDescriptions
	ld a, [CurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString
; 0x1c8987


ItemDescriptions:
	dw MasterBallDesc
	dw UltraBallDesc
	dw BrightpowderDesc
	dw GreatBallDesc
	dw PokeBallDesc
	dw TownMapDesc
	dw SkateboardDesc
	dw MoonStoneDesc
	dw AntidoteDesc
	dw BurnHealDesc
	dw IceHealDesc
	dw AwakeningDesc
	dw ParlyzHealDesc
	dw FullRestoreDesc
	dw MaxPotionDesc
	dw HyperPotionDesc
	dw SuperPotionDesc
	dw PotionDesc
	dw EscapeRopeDesc
	dw RepelDesc
	dw MaxElixerDesc
	dw FireStoneDesc
	dw ThunderStoneDesc
	dw WaterStoneDesc
	dw PinkanBerryDesc
	dw HPUpDesc
	dw ProteinDesc
	dw IronDesc
	dw CarbosDesc
	dw LuckyPunchDesc
	dw CalciumDesc
	dw RareCandyDesc
	dw XAccuracyDesc
	dw LeafStoneDesc
	dw MetalPowderDesc
	dw NuggetDesc
	dw PokeDollDesc
	dw FullHealDesc
	dw ReviveDesc
	dw MaxReviveDesc
	dw GuardSpecDesc
	dw SuperRepelDesc
	dw MaxRepelDesc
	dw DireHitDesc
	dw MasterRodDesc
	dw FreshWaterDesc
	dw SodaPopDesc
	dw LemonadeDesc
	dw XAttackDesc
	dw XDefendDesc
	dw XSpeedDesc
	dw XSpclAtkDesc
	dw CoinCaseDesc
	dw ItemfinderDesc
	dw PokeFluteDesc
	dw ExpAllDesc
	dw OldRodDesc
	dw GoodRodDesc
	dw SuperRodDesc
	dw PPUpDesc
	dw PPMaxDesc
	dw EtherDesc
	dw MaxEtherDesc
	dw ElixerDesc
	dw PinkCureDesc
	dw HeartScaleDesc
	dw QuickClawDesc
	dw PsnCureBerryDesc
	dw SoftSandDesc
	dw SharpBeakDesc
	dw PrzCureBerryDesc
	dw BurntBerryDesc
	dw IceBerryDesc
	dw PoisonBarbDesc
	dw KingsRockDesc
	dw BitterBerryDesc
	dw MintBerryDesc
	dw TinyMushroomDesc
	dw BigMushroomDesc
	dw SilverPowderDesc
	dw AmuletCoinDesc
	dw CleanseTagDesc
	dw MysticWaterDesc
	dw TwistedSpoonDesc
	dw BlackbeltDesc
	dw BlackGlassesDesc
	dw PinkBowDesc
	dw StickDesc
	dw SmokeBallDesc
	dw NeverMeltIceDesc
	dw MagnetDesc
	dw MiracleBerryDesc
	dw PearlDesc
	dw BigPearlDesc
	dw EverStoneDesc
	dw SpellTagDesc
	dw SweetOrangeDesc
	dw GSBallDesc
	dw MiracleSeedDesc
	dw ThickClubDesc
	dw FocusBandDesc
	dw EnergyPowderDesc
	dw EnergyRootDesc
	dw HealPowderDesc
	dw RevivalHerbDesc
	dw HardStoneDesc
	dw LuckyEggDesc
	dw StardustDesc
	dw StarPieceDesc
	dw CharcoalDesc
	dw BerryJuiceDesc
	dw ScopeLensDesc
	dw MetalCoatDesc
	dw DragonFangDesc
	dw LeftoversDesc
	dw MysteryBerryDesc
	dw DragonScaleDesc
	dw HeavyBallDesc
	dw LevelBallDesc
	dw LureBallDesc
	dw FastBallDesc
	dw LightBallDesc
	dw FriendBallDesc
	dw MoonBallDesc
	dw LoveBallDesc
	dw SunStoneDesc
	dw PolkadotBowDesc
	dw UpGradeDesc
	dw BerryDesc
	dw GoldBerryDesc
	dw SquirtBottleDesc
	dw ParkBallDesc
	dw BerserkGeneDesc
	dw SacredAshDesc
	dw SilverWingDesc
	dw RainbowWingDesc
	dw ShinyStoneDesc
	dw TradeStoneDesc
	dw MoroTrophyDesc
	dw DubiousDiscDesc
	dw ShinyCharmDesc
	dw SoulDewDesc
	dw DiveBallDesc
	dw HealBallDesc
	dw DuskBallDesc
	dw FlowerMailDesc
	dw SurfMailDesc
	dw LiteBlueMailDesc
	dw PortraitMailDesc
	dw LovelyMailDesc
	dw EonMailDesc
	dw MorphMailDesc
	dw BlueSkyMailDesc
	dw MusicMailDesc
	dw MewMailDesc
	dw XSpclDefDesc
	dw IceStoneDesc
	dw QuickPowderDesc
	dw MagmarizerDesc
	dw ElectirizerDesc
	dw ProtectorDesc
	dw SalveyoWeedDesc
	dw CatStatueDesc
	dw ShellBoxDesc
	dw ElectricOrbDesc
	dw FireOrbDesc
	dw IceOrbDesc
	dw KantoStoneDesc

MasterBallDesc:
	db   "Es la mejor BALL."
	next "Nunca falla.@"

UltraBallDesc:
	db   "BALL con un gran"
	next "índice de éxito.@"

BrightpowderDesc:
	db   "Disminuye la prec."
	next "enemiga. (EQ.)@"

GreatBallDesc:
	db   "BALL con un buen"
	next "índice de éxito.@"

PokeBallDesc:
	db   "Objeto para"
	next "capturar #MON.@"

TownMapDesc:
	db   "Un mapa de las"
	next "ISLAS NARANJA.@"

SkateboardDesc:
	db   "Un moderno SKATE-"
	next "BOARD para viajar.@"

MoonStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

AntidoteDesc:
	db   "Cura a los #MON"
	next "envenenados.@"

BurnHealDesc:
	db   "Cura a los #MON"
	next "quemados.@"

IceHealDesc:
	db   "Descongela a los"
	next "#MON."

AwakeningDesc:
	db   "Despierta a los"
	next "#MON dormidos.@"

ParlyzHealDesc:
	db   "Cura a los #MON"
	next "paralizados.@"

FullRestoreDesc:
	db   "Restaura todos los"
	next "PS y el estado.@"

MaxPotionDesc:
	db   "Restaura todos los"
	next "PS del #MON.@"

HyperPotionDesc:
	db   "Restaura 200 PS"
	next "del #MON.@"

SuperPotionDesc:
	db   "Restaura 50 PS"
	next "del #MON.@"

PotionDesc:
	db   "Restaura 20 PS"
	next "del #MON.@"

EscapeRopeDesc:
	db   "Se usa para salir"
	next "de cuevas, etc.@"

RepelDesc:
	db   "Repele #MON"
	next "débiles 100 pasos.@"

MaxElixerDesc:
	db   "Restaura todos los"
	next "PP de un #MON.@"

FireStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

ThunderStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

WaterStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

PinkanBerryDesc:
	db   "¡Vuelve rosa a"
	next "los #MON!@"

HPUpDesc:
	db   "Aumenta los PS de"
	next "un #MON.@"

ProteinDesc:
	db   "Mejora el ATAQUE"
	next "de un #MON.@"

IronDesc:
	db   "Mejora la DEFENSA"
	next "de un #MON.@"

CarbosDesc:
	db   "Eleva la VELOCIDAD"
	next "de un #MON.@"

LuckyPunchDesc:
	db   "Sube golpe crítico"
	next "de CHANSEY.@"

CalciumDesc:
	db   "Sube caract. ESP."
	next "de un #MON.@"

RareCandyDesc:
	db   "Sube de nivel a"
	next "un #MON.@"

XAccuracyDesc:
	db   "Sube la PRECISIÓN."
	next "(1 BAT.)@"

LeafStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

MetalPowderDesc:
	db   "Mejora la DEFENSA"
	next "de DITTO. (EQ.)@"

NuggetDesc:
	db   "Hecha de oro puro."
	next "Es muy cara.@"

PokeDollDesc:
	db   "Sirve para huir de"
	next "#MON salvajes.@"

FullHealDesc:
	db   "Cura los problemas"
	next "de estado.@"

ReviveDesc:
	db   "Restaura 1/2 PS del"
	next "#MON debilitado.@"

MaxReviveDesc:
	db   "Cura a un #MON"
	next "debilitado.@"

GuardSpecDesc:
	db   "Previene merma de"
	next "stats. (1 BAT)@"

SuperRepelDesc:
	db   "Repele #MON"
	next "débiles 200 pasos.@"

MaxRepelDesc:
	db   "Repele #MON"
	next "débiles 250 pasos.@"

DireHitDesc:
	db   "Sube prob. golpe"
	next "crítico. (1 BAT.)@"

MasterRodDesc:
	db   "Caña legendaria"
	next "para #MON.@"

FreshWaterDesc:
	db   "Restaura 50 PS de"
	next "un #MON.@"

SodaPopDesc:
	db   "Restaura 60 PS de"
	next "un #MON.@"

LemonadeDesc:
	db   "Restaura 80 PS de"
	next "un #MON.@"

XAttackDesc:
	db   "Mejora el ATAQUE."
	next "(1 BAT.))@"

XDefendDesc:
	db   "Mejora la"
	next "DEFENSA. (1 BAT.)@"

XSpeedDesc:
	db   "Más VELOCIDAD."
	next "(1 BAT.)@"

XSpclAtkDesc:
	db   "Sube ATAQUE"
	next "ESPECIAL. (1 BAT.)@"

CoinCaseDesc:
	db   "Guarda hasta 9.999"
	next "fichas de juego.@"

ItemfinderDesc:
	db   "Busca objetos"
	next "ocultos.@"

PokeFluteDesc:
	db   "Una flauta para"
	next "tocar melodías.@"

ExpAllDesc:
	db   "Comparte la EXP."
	next "con tu grupo.@"

OldRodDesc:
	db   "Sirve para pescar"
	next "#MON.@"

GoodRodDesc:
	db   "CAÑA buena para"
	next "atrapar #MON.@"

SuperRodDesc:
	db   "La mejor CAÑA para"
	next "atrapar #MON.@"

PPUpDesc:
	db   "Aumenta los PP"
	next "máx. de un ataque.@"
	
PPMaxDesc:
	db   "Maximiza los PP"
	next "máx. de un ataque.@"

EtherDesc:
	db   "Restaura 10 PP de"
	next "un movimiento.@"

MaxEtherDesc:
	db   "Restaura todos los"
	next "PP de un ataque.@"

ElixerDesc:
	db   "Restaura 10 PP de"
	next "todos los ataques.@"

PinkCureDesc:
	db   "Quita el color"
	next "rosa de un #MON.@"

SilverWingDesc:
	db   "Hoja muy extraña"
	next "de color plateado.@"

HeartScaleDesc:
	db   "Una escama"
	next "adorable .@"

QuickClawDesc:
	db   "Sube probabilidad"
	next "primer golpe.(EQ.)@"

PsnCureBerryDesc:
	db   "Cura automática"
	next "del veneno. (EQ.)@"

SoftSandDesc:
	db   "Mejora los ataques"
	next "tipo tierra. (EQ.)@"

SharpBeakDesc:
	db   "Mejora los ataques"
	next "tipo volador.(EQ.)@"

PrzCureBerryDesc:
	db   "Cura automática"
	next "de parálisis.(EQ.)@"

BurntBerryDesc:
	db   "Cura automática de"
	next "congelación. (EQ.)@"

IceBerryDesc:
	db   "Cura automática de"
	next "quemaduras. (EQ.)@"

PoisonBarbDesc:
	db   "Mejora los ataques"
	next "tipo veneno. (EQ.)@"

KingsRockDesc:
	db   "El enemigo podría"
	next "retroceder. (EQ.)@"

BitterBerryDesc:
	db   "Cura automática"
	next "de confusión.(EQ.)@"

MintBerryDesc:
	db   "Cura automática"
	next "del sueño. (EQ.)@"

TinyMushroomDesc:
	db   "Una seta común."
	next "Es muy barata.@"

BigMushroomDesc:
	db   "Una seta rara."
	next "Es muy cara.@"

SilverPowderDesc:
	db   "Mejora los ataques"
	next "tipo bicho. (EQ.)@"

AmuletCoinDesc:
	db   "Dobla el dinero"
	next "que ganas. (EQ.)@"

CleanseTagDesc:
	db   "Repele a #MON"
	next "salvajes. (EQ.)@"

MysticWaterDesc:
	db   "Mejora ataques"
	next "tipo agua. (EQ.)@"

TwistedSpoonDesc:
	db   "Mejora ataques"
	next "psíquicos. (EQ.)@"

BlackbeltDesc:
	db   "Mejora ataques"
	next "tipo lucha. (EQ.)@"

BlackGlassesDesc:
	db   "Mejora ataques"
	next "siniestros. (EQ.)@"

PinkBowDesc:
	db   "Mejora ataques"
	next "normales. (EQ.)@"

StickDesc:
	db   "Un palo corriente."
	next "Es muy barato.@"

SmokeBallDesc:
	db   "Huye de #-"
	next "MON salvajes.(EQ.)@"

NeverMeltIceDesc:
	db   "Mejora ataques"
	next "tipo hielo. (EQ.)@"

MagnetDesc:
	db   "Mejora ataques"
	next "eléctricos. (EQ.)@"

MiracleBerryDesc:
	db   "Cura problemas"
	next "de estado. (EQ.)@"

PearlDesc:
	db   "Una perla bonita."
	next "Es barata.@"

BigPearlDesc:
	db   "Perla preciosa y"
	next "enorme. Carísima.@"

EverStoneDesc:
	db   "Detiene la"
	next "evolución. (EQ.)@"

SpellTagDesc:
	db   "Sube ataques tipo"
	next "fantasma. (EQ.)@"

SweetOrangeDesc:
	db   "Restaura 20 PS de"
	next "un #MON.@"

GSBallDesc:
	db   "La BALL"
	next "misteriosa.@"

MiracleSeedDesc:
	db   "Mejora ataques"
	next "tipo planta. (EQ.)@"

ThickClubDesc:
	db   "Un tipo de hueso."
	next "Es muy barato.@"

FocusBandDesc:
	db   "Podría evitar caer"
	next "debilitado. (EQ.)@"

EnergyPowderDesc:
	db   "Restaura 50 PS del"
	next "#MON. Amarga.@"

EnergyRootDesc:
	db   "Restaura 200 PS al"
	next "#MON. Amarga.@"

HealPowderDesc:
	db   "Cura todos los"
	next "males. Amarga.@"

RevivalHerbDesc:
	db   "Revive #MON."
	next "Amarga.@"

HardStoneDesc:
	db   "Mejora ataques"
	next "tipo roca. (EQ.)@"

LuckyEggDesc:
	db   "Gana puntos de"
	next "EXP. extra. (EQ.)@"

StardustDesc:
	db   "Bonita arena roja."
	next "Muy cara.@"

StarPieceDesc:
	db   "Un trozo de gema"
	next "roja. Carísima.@"

CharcoalDesc:
	db   "Mejora ataques"
	next "tipo fuego. (EQ.)@"

BerryJuiceDesc:
	db   "Restaura 20 PS"
	next "del #MON.@"

ScopeLensDesc:
	db   "Sube prob. golpe"
	next "crítico. (EQ.)@"

MetalCoatDesc:
	db   "Mejora ataques"
	next "tipo acero. (EQ.)@"

DragonFangDesc:
	db   "Mejora ataques"
	next "tipo dragón. (EQ.)@"

LeftoversDesc:
	db   "Restaura PS en"
	next "el combate. (EQ.)@"

MysteryBerryDesc:
	db   "Restaura PP auto-"
	next "máticamente. (EQ.)@"

DragonScaleDesc:
	db   "Un objeto extraño"
	next "de tipo dragón.@"

BerserkGeneDesc:
	db   "Mejora el ATAQUE"
	next "pero confunde.@"

SacredAshDesc:
	db   "Revive #MON"
	next "debilitados.@"

HeavyBallDesc:
	db   "BALL para capturar"
	next "#MON pesados.@"

FlowerMailDesc:
	db   "CARTA con dibujos"
	next "de flores. (EQ.)@"

LevelBallDesc:
	db   "BALL para #MON"
	next "de bajo nivel.@"

LureBallDesc:
	db   "BALL para #MON"
	next "pescados con CAÑA.@"

FastBallDesc:
	db   "BALL para atrapar"
	next "#MON veloces.@"

LightBallDesc:
	db   "Un extraño orbe"
	next "eléctrico. (EQ.)@"

FriendBallDesc:
	db   "Una BALL que"
	next "enternece #MON.@"

MoonBallDesc:
	db   "BALL para PKMN que"
	next "evol. con P.LUNAR.@"

LoveBallDesc:
	db   "Para capturar al"
	next "género opuesto.@"

SunStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

PolkadotBowDesc:
	db   "Mejora los ataques"
	next "normales. (EQ.)@"

UpGradeDesc:
	db   "Caja misteriosa"
	next "de SILPH S.A.@"

BerryDesc:
	db   "Objeto de autocu-"
	next "ración.(10PS, EQ.)@"

GoldBerryDesc:
	db   "Objeto de autocu-"
	next "ración.(30PS, EQ.)@"

SquirtBottleDesc:
	db   "Recipiente para"
	next "regar las plantas.@"

ParkBallDesc:
	db   "BALL del Concurso"
	next "Captura de Bichos.@"

RainbowWingDesc:
	db   "Pluma mística de"
	next "color arcoiris.@"

ShinyStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

TradeStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"

MoroTrophyDesc:
	db   "Un trofeo robado"
	next "hace 300 años.@"

DubiousDiscDesc:
	db   "Un disco"
	next "misterioso.@"

ShinyCharmDesc:
	db   "Un amuleto"
	next "para shinys #MON.@"

SoulDewDesc:
	db   "Un orbe para"
	next "LATIOS o LATIAS.@"

DiveBallDesc:
	db   "Una BALL para"
	next "#MON submarinos.@"

HealBallDesc:
	db   "Una BALL curativa"
	next "para sanar #MON.@"

DuskBallDesc:
	db   "Una BALL para"
	next "zonas oscuras.@"

SurfMailDesc:
	db   "CARTA con dibujos"
	next "de LAPRAS. (EQ.)@"

LiteBlueMailDesc:
	db   "CARTA con dibujos"
	next "de DRATINI. (EQ.)@"

PortraitMailDesc:
	db   "Aparece el #MON"
	next "que la tiene.@"

LovelyMailDesc:
	db   "CARTA con dibujos"
	next "de corazones.(EQ.)@"

EonMailDesc:
	db   "CARTA con dibujos"
	next "de EEVEE. (EQ.)@"

MorphMailDesc:
	db   "CARTA con dibujos"
	next "de DITTO. (EQ.)@"

BlueSkyMailDesc:
	db   "CARTA con dibujos"
	next "del cielo. (EQ.)@"

MusicMailDesc:
	db   "Carta de TOGEKISS"
	next "(EQ)@"

MewMailDesc:
	db   "CARTA con dibujos"
	next "de MEW. (EQ.)"
	
XSpclDefDesc:
	db   "Sube DEFENSA"
	next "ESPECIAL. (1 BAT.)@"
	
IceStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"
	
QuickPowderDesc:
	db   "Mejora la VEL"
	next "de DITTO. (EQ.)@"
	
MagmarizerDesc:
	db   "Almacena energía"
	next "magmática.@"
	
ElectirizerDesc:
	db   "Almacena mucha"
	next "electricidad.@"
	
ProtectorDesc:
	db   "Extremadamente"
	next "duro y pesado.@"
	
SalveyoWeedDesc:
	db   "Smells like pond"
	next "water. For fevers.@"
	
CatStatueDesc:
	db   "Estatua de oro"
	next "muy pesada.@"
	
ShellBoxDesc:
	db   "Una cajita para"
	next "guardar conchas.@"
	
ElectricOrbDesc:
	db   "Tesoro de la Isla"
	next "del.rayo.@"

FireOrbDesc:
	db   "Tesoro de la Isla"
	next "del.fuego.@"

IceOrbDesc:
	db   "Tesoro de la Isla"
	next "del.hielo.@"

KantoStoneDesc:
	db   "Evoluciona ciertos"
	next "tipos de #MON.@"