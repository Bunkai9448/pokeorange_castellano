GetLandmarkCoords: ; 0x1ca896
; Return coordinates (d, e) of landmark e.

;erase underwater/surf bitflags
	ld a, e
	and LANDMARK_MASK
	ld e, a
	

	push hl
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, de
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret
; 0x1ca8a5


GetLandmarkName:: ; 0x1ca8a5
; Copy the name of landmark e to StringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, de
	ld de, Landmarks + 3
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, StringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret
; 0x1ca8c3

GetLandmarkFishGroup: ; 0x1ca896
; Return fishgroup of landmark e in d

;erase underwater/surf bitflags
	ld a, e
	and LANDMARK_MASK
	ld e, a

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, de
	ld de, Landmarks + 2
	add hl, de
	ld d, [hl]
	ret

Landmarks: ; 0x1ca8c3

landmark: MACRO
	db \1, \2, \3	; Xcoord, Ycoord, Fishgroup
	dw \4		 	; Name pointer
ENDM

	landmark    0,    0, FISHGROUP_NONE, SpecialMapName
	landmark   52,  140, FISHGROUP_OCEAN, ValenciaIslandName
	landmark   44,  132, FISHGROUP_SHORE, Route49Name
	landmark   28,  132, FISHGROUP_SHORE, TangeloIslandName
	landmark   20,  128, FISHGROUP_SHORE, Route50Name
	landmark   28,  124, FISHGROUP_SHORE, Route51Name
	landmark   20,  124, FISHGROUP_POND, TangeloJungleName
	landmark   28,  112, FISHGROUP_SHORE, Route52Name
	landmark   28,  100, FISHGROUP_POND, MikanIslandName
	landmark   40,  92,  FISHGROUP_SHORE, Route53Name
	landmark   52,  84,  FISHGROUP_SHORE, Route54Name
	landmark   52,  76,  FISHGROUP_SHORE, MandarinNorthName
	landmark   52,  100, FISHGROUP_SHORE, SunburstIslandName
	landmark   56,  116, FISHGROUP_SHORE, Route55Name
	landmark   52,  110, FISHGROUP_POND, CrystalCaveName
	landmark   72,  120, FISHGROUP_NONE, PinkanIslandName
	landmark   92,  124, FISHGROUP_SHORE, Route56Name
	landmark   108, 124, FISHGROUP_POND, Fukuhara4Name
	landmark   116, 108, FISHGROUP_SHORE, KinnowIslandName
	landmark   136,  96, FISHGROUP_SHORE, Route57Name
	landmark   136,  80, FISHGROUP_SHORE, UnnamedIsland1Name
	landmark   148,  76, FISHGROUP_SHORE, Route58Name
	landmark   156,  76, FISHGROUP_SHORE, NavelIslandName
	landmark   158,  74, FISHGROUP_NONE, MtNavelName
	landmark   148, 100, FISHGROUP_SHORE, GrapefruitName
	landmark   148, 108, FISHGROUP_SHORE, Route59Name
	landmark   148, 116, FISHGROUP_SHORE, MoroIslandName
	landmark   140, 124, FISHGROUP_SHORE, Route60Name
	landmark   142, 118, FISHGROUP_SHORE, WreckedShipName
	landmark   128, 128, FISHGROUP_SHORE, GoldenIslandName
	landmark   124, 140, FISHGROUP_OCEAN, Route61Name
	landmark   140, 148, FISHGROUP_POND, MurcottIslandName
	landmark   124, 156, FISHGROUP_CONTEST, UnnamedIsland2Name
	landmark   104, 144, FISHGROUP_OCEAN, Route62Name
	landmark   96,  144, FISHGROUP_SHORE, MandarinDesertName
	landmark   84,  140, FISHGROUP_SEWER, TrovitopolisName
	landmark   76,  148, FISHGROUP_SHORE, TrovitaIslandName
	landmark   128,  56, FISHGROUP_SHORE, CleopatraIslandName
	landmark   152,  52, FISHGROUP_SHORE, Route63Name
	landmark   164,  36, FISHGROUP_SHORE, AscorbiaIslandName
	landmark   152,  32, FISHGROUP_SHORE, Route64Name
	landmark   148,  36, FISHGROUP_SHORE, Route65Name
	landmark   136,  32, FISHGROUP_POND, ButwalIslandName
	landmark   112,  32, FISHGROUP_OCEAN, Route66Name
	landmark   108,  52, FISHGROUP_SHORE, KumquatIslandName
	landmark   82,   60, FISHGROUP_OCEAN, Route67Name
	landmark   60,   60, FISHGROUP_RIND, RindIslandName
	landmark   44,   60, FISHGROUP_OCEAN, Route68Name
	landmark   24,   56, FISHGROUP_POND, UnnamedIsland3Name
	landmark   20,   36, FISHGROUP_OCEAN, Route69Name
	landmark   28,   36, FISHGROUP_POND, VictoryRoadName
	landmark   36,   36, FISHGROUP_SHORE, PummeloIslandName
	landmark   52,   36, FISHGROUP_OCEAN, Route70Name
	landmark   64,   32, FISHGROUP_SHORE, TarrocoIslandName
	landmark   76,   36, FISHGROUP_OCEAN, Route71Name
	landmark   92,   36, FISHGROUP_NONE, HamlinIslandName ;Not accessible in normal gameplay, hence the FISHGROUP_NONE even if it is not in the mapheader
	landmark   96,   36, FISHGROUP_NONE, HamlinFieldsName ;Not accessible in normal gameplay, hence the FISHGROUP_NONE even if it is not in the mapheader
	landmark   92,   84, FISHGROUP_SHORE, ShamoutiIslandName
	landmark   84,   92, FISHGROUP_SHORE, FireIslandName
	landmark   100,  92, FISHGROUP_SHORE, IceIslandName
	landmark   108,  84, FISHGROUP_SHORE, LightningIslandName

	landmark   116,   28, FISHGROUP_NONE, VermilionCityName
	landmark   138,   28, FISHGROUP_NONE, Route11Name
	landmark   156,   36, FISHGROUP_NONE, Route12Name
	landmark   148,   44, FISHGROUP_NONE, Route13Name
	landmark   140,   52, FISHGROUP_NONE, Route14Name
	landmark   132,   60, FISHGROUP_NONE, Route15Name
	landmark   116,   60, FISHGROUP_NONE, FuchsiaCityName
	landmark   116,   58, FISHGROUP_NONE, SafariZoneName
	landmark   116,   72, FISHGROUP_NONE, Route19Name
	landmark   92,   76, FISHGROUP_NONE, Route20Name
	landmark   84,   76, FISHGROUP_NONE, SeafoamIslandsName
	landmark   60,   76, FISHGROUP_NONE, CinnabarIslandName
	landmark   62,   74, FISHGROUP_NONE, CinnabarVolcanoName
	landmark   60,   64, FISHGROUP_NONE, Route21Name
	landmark   60,   52, FISHGROUP_NONE, PalletTownName
	landmark   42,   68, FISHGROUP_NONE, CinnabarSeaName
	landmark   20,   60, FISHGROUP_NONE, SaydaIslandName
	landmark   84,   64, FISHGROUP_NONE, KantoSea1Name
	landmark   92,   52, FISHGROUP_NONE, CamomileIslandName
	landmark   100,   36, FISHGROUP_NONE, VermilionSeaName
	landmark   100,   92, FISHGROUP_NONE, KantoSea2Name
	landmark   84,   92, FISHGROUP_NONE, ChrysanthemumName
	landmark   100,   116, FISHGROUP_NONE, MetallicaIslandName
	landmark   116,   92, FISHGROUP_NONE, KantoSea3Name
	landmark   132,   92, FISHGROUP_NONE, WisteriaTownName
	landmark   124,   116, FISHGROUP_NONE, HutberCityName
	landmark   132,   128, FISHGROUP_NONE, PortaVistaName
	landmark   116,   132, FISHGROUP_NONE, AcapulcoTownName
	landmark   36,   116, FISHGROUP_NONE, NewIslandName
	landmark   68,   140, FISHGROUP_NONE, RainbowIslandName
	landmark 148, 132, FISHGROUP_NONE, FastShipName


ValenciaIslandName:  db "ISLA VALENCIA@"
Route49Name:         db "RUTA 49@"
TangeloIslandName:   db "ISLA TANGELO@"
Route50Name:         db "RUTA 50@"
Route51Name:         db "RUTA 51@"
TangeloJungleName:   db "JUNGLA TANGELO@"
Route52Name:         db "RUTA 52@"
MikanIslandName:     db "ISLA MIKAN@"
Route53Name:         db "RUTA 53@"
Route54Name:         db "RUTA 54@"
MandarinNorthName:   db "MANDARIN NORTE@"
SunburstIslandName:  db "ISLA SUNBURST@"
Route55Name:         db "RUTA 55@"
CrystalCaveName:     db "CUEVA CRYSTAL@"
PinkanIslandName:    db "ISLA ROSADA@"
Route56Name:         db "RUTA 56@"
Fukuhara4Name:       db "FUKUHARA №.4@"
KinnowIslandName:    db "KINNOW@"
Route57Name:         db "RUTA 57@"
UnnamedIsland1Name:  db "ISLA SIN NOMBRE@"
Route58Name:         db "RUTA 58@"
NavelIslandName:     db "ISLA NAVEL@"
MtNavelName:         db "MT.NAVEL@"
GrapefruitName:      db "7 ISLAS POMELO@"
Route59Name:         db "RUTA 59@"
MoroIslandName:      db "ISLA MORO@"
Route60Name:         db "RUTA 60@"
WreckedShipName:     db "BARCO HUNDIDO@"
GoldenIslandName:    db "ISLA GOLDEN@"
Route61Name:         db "RUTA 61@"
MurcottIslandName:   db "ISLA MURCOTT@"
UnnamedIsland2Name:  db "ISLA SIN NOMBRE@"
Route62Name:         db "RUTA 62@"
MandarinDesertName:  db "DESIERTO MANDARINA@"
TrovitopolisName:    db "TROVITOPOLIS@"
TrovitaIslandName:   db "ISLA TROVITA@"
CleopatraIslandName: db "ISLA CLEOPATRA@"
Route63Name:         db "RUTA 63@"
AscorbiaIslandName:  db "ISLA ASCORBIA@"
Route64Name:         db "RUTA 64@"
Route65Name:         db "RUTA 65@"
ButwalIslandName:    db "ISLA BUTWAL@"
Route66Name:         db "RUTA 66@"
KumquatIslandName:   db "ISLA KUMQUAT@"
Route67Name:         db "RUTA 67@"
RindIslandName:      db "ISLA RIND@"
Route68Name:         db "RUTA 68@"
UnnamedIsland3Name:  db "ISLA SIN NOMBRE@"
Route69Name:         db "RUTA 69@"
VictoryRoadName:     db "CALLE VICTORIA@"
PummeloIslandName:   db "ISLA POMELO@"
Route70Name:         db "RUTA 70@"
TarrocoIslandName:   db "ISLA TARROCO@"
Route71Name:         db "RUTA 71@"
HamlinIslandName:    db "ISLA HAMLIN@"
HamlinFieldsName:    db "CAMPOS DE HAMLIN@"
ShamoutiIslandName:  db "ISLA SHAMOUTI@"
FireIslandName:      db "ISLA DEL FUEGO@"
IceIslandName:       db "ISLA DEL HIELO@"
LightningIslandName: db "ISLA DEL TRUENO@"

; Kanto
VermilionCityName:   db "CIUDAD CARMIN@"
Route11Name:         db "RUTA 11@"
Route12Name:         db "RUTA 12@"
Route13Name:         db "RUTA 13@"
Route14Name:         db "RUTA 14@"
Route15Name:         db "RUTA 15@"
FuchsiaCityName:     db "CIUDAD FUCSIA@"
SafariZoneName:		 db "ZONA SAFARI@"
Route19Name:         db "RUTA 19@"
Route20Name:         db "RUTA 20@"
SeafoamIslandsName:  db "ISLAS ESPUMA@"
CinnabarIslandName:  db "ISLA CANELA@"
CinnabarVolcanoName: db "VOLCAN CANELA@"
Route21Name:         db "RUTA 21@"
PalletTownName:      db "PUEBLO PALETA@"
CinnabarSeaName:     db "MAR CANELA@"
SaydaIslandName:     db "ISLA SAYDA@"
KantoSea1Name:       db "MAR DE KANTO@"
CamomileIslandName:  db "ISLA CAMOMILE@"
VermilionSeaName:    db "MAR CARMIN@"
KantoSea2Name:       db "MAR DE KANTO@"
ChrysanthemumName:   db "CHRYSANTHEMUM@"
MetallicaIslandName: db "ISLA METALICA@"
KantoSea3Name:       db "MAR DE KANTO@"
WisteriaTownName:    db "CIUDAD WISTERIA@"
HutberCityName:      db "HUTBER CITY@"
PortaVistaName:      db "PORTA VISTA@"
AcapulcoTownName:    db "CIUDAD ACAPULCO@"
NewIslandName:       db "ISLA NUEVA@"
RainbowIslandName:   db "ISLA ARCO IRIS@"

SpecialMapName:      db "ESPECIAL@"
FastShipName:        db "VIAJE RAPIDO@"

RegionCheck: ; 0x1caea1
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP ; S.S. Aqua
	jr z, .johto
	cp SPECIAL_MAP
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp KANTO_LANDMARK
	jr c, .johto

; Victory Road area is considered to be Johto.
	cp VALENCIA_ISLAND
	jr c, .kanto

.johto
	ld e, 0
	ret
.kanto
	ld e, 1
	ret
