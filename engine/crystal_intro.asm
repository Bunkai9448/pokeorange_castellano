Copyright_GFPresents: ; e4579
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	farcall OpeningLines
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	farcall GBCOnlyScreen
	call .GetGFLogoGFX
.joy_loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call .StopGamefreakAnim
	scf
	ret

.finish
	call .StopGamefreakAnim
	call creditos_naranjito ; pantalla creditos esp
	and a
	ret
; e45e8

.GetGFLogoGFX: ; e45e8
	ld de, GameFreakLogo
	ld hl, VTiles2
	lb bc, BANK(GameFreakLogo), $1c
	call Get1bpp

	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, wDecompressScratch
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, VTiles0
	ld de, wDecompressScratch
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, VTiles1
	ld de, wDecompressScratch + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ld [rSVBK], a

	farcall ClearSpriteAnims
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_GAMEFREAK_LOGO
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $a0
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $60
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	lb de, %11100100, %11100100
	jp DmgToCgbObjPals
; e465e

.StopGamefreakAnim: ; e465e
	farcall ClearSpriteAnims
	call ClearTileMap
	call ClearSprites
	ld c, 16
	jp DelayFrames
; e4670

PlaceGameFreakPresents: ; e4670
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e467f

.dw ; e467f
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3
; e4687

PlaceGameFreakPresents_AdvanceIndex: ; e4687
	ld hl, wJumptableIndex
	inc [hl]
PlaceGameFreakPresents_0: ; no-optimize stub function
	ret
; e468c

PlaceGameFreakPresents_1: ; e468d
	ld hl, wcf65
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak:
	ld [hl], 0
	ld hl, .GAME_FREAK
	decoord 5, 10
	ld bc, .end - .GAME_FREAK
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ld de, SFX_GAME_FREAK_PRESENTS
	jp PlaySFX
; e46af

.GAME_FREAK:
	;  P  I  A  _    C  A  R  R  O  T
	db 0, 1, 2, 13,  3, 2, 4, 4, 5, 6
.end
	db "@"
; e46ba

PlaceGameFreakPresents_2: ; e46ba
	ld hl, wcf65
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7,11
	ld bc, .end - .presents
	call CopyBytes
	jp PlaceGameFreakPresents_AdvanceIndex
; e46d6

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"
; e46dd

PlaceGameFreakPresents_3: ; e46dd
	ld hl, wcf65
	ld a, [hl]
	cp $80
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; e46ed


GameFreakLogoJumper: ; e46ed (39:46ed)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GameFreakLogoScenes: ; e46fd (39:46fd)
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5

GameFreakLogoScene1: ; e4707 (39:4707)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
GameFreakLogoScene5: ; no-optimize stub function
	ret

GameFreakLogoScene2: ; e470d (39:470d)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and $3f
	cp $20
	jr nc, .asm_e4723
	add $20
.asm_e4723
	ld e, a
	farcall BattleAnim_Sine_e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	jp PlaySFX

.asm_e4747
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	jp PlaySFX

GameFreakLogoScene3: ; e4759 (39:4759)
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret

.asm_e4764
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	jp PlaySFX

GameFreakLogoScene4: ; e4776 (39:4776)
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $40
	jr z, .asm_e47a3
	inc [hl]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, GameFreakLogoPalettes
	add hl, de
	add hl, de
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [OBPals + 12], a
	ld a, [hli]
	ld [OBPals + 13], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	jp PlaceGameFreakPresents_AdvanceIndex
; e47ac (39:47ac)

GameFreakLogoPalettes: ; e47ac
; Ditto's color as it turns into the Game Freak logo.
; Fade from pink to orange.
; One color per step.
	RGB 23, 12, 28
	RGB 23, 12, 27
	RGB 23, 13, 26
	RGB 23, 13, 24

	RGB 24, 14, 22
	RGB 24, 14, 20
	RGB 24, 15, 18
	RGB 24, 15, 16

	RGB 25, 16, 14
	RGB 25, 16, 12
	RGB 25, 17, 10
	RGB 25, 17, 08

	RGB 26, 18, 06
	RGB 26, 18, 04
	RGB 26, 19, 02
	RGB 26, 19, 00

; e47cc

GameFreakLogo: ; e47cc
INCBIN "gfx/splash/logo.1bpp"
; e48ac

creditos_naranjito: ; rutina para incluir pantalla creditos al final de la intro, antes de pantalla titulo
; el codigo es pura fuerza bruta, el unico "esquema" que tiene detras es llenar los bloques de background
; en ram y mostrarlos en pantalla. 
; El TileMap se imprime en bloques del 1 al 5 para que el buffer coincida con el VBlank

	; Desactivar BG Mode Automatico
	xor a
	ld [hBGMapMode], a

WaitVBlank:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank

	; get image data from ROM
	ld hl, CreditsScreenGFX_naranjito
	ld de, wDecompressScratch
	ld bc, 1835 ; Tam en Bytes a copiar del binario de la imagen 2bpp
	call CopyBytes

	; Convert data to tiles in VRAM
	ld hl, $9000
	ld de, wDecompressScratch
	ld bc,380 ; Tam en tiles (2 Bytes Por Pixel) a copiar de la imagen obtenida
	call Request2bpp
	

WaitVBlank2:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank2

	; Copy tilemap for display
	ld de, TileMap_creditos_0
	ld hl, $9800
	ld bc, 96 ; Tam en tiles a copiar del tilemap, limitado por el buffer de RAM usado
CopyTilemap:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or a, c
	jp nz, CopyTilemap

WaitVBlank3:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank3

	; Copy tilemap for display
	ld de, TileMap_creditos_1
	ld hl, $9860
	ld bc, 96 
CopyTilemap_1:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or a, c
	jp nz, CopyTilemap_1

WaitVBlank4:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank4

	; Copy tilemap for display
	ld de, TileMap_creditos_2
	ld hl, $98C0
	ld bc, 96 
CopyTilemap_2:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or a, c
	jp nz, CopyTilemap_2

WaitVBlank5:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank5

	; Copy tilemap for display
	ld de, TileMap_creditos_3
	ld hl, $9920
	ld bc, 96 
CopyTilemap_3:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or a, c
	jp nz, CopyTilemap_3

WaitVBlank6:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank6

	; Copy tilemap for display
	ld de, TileMap_creditos_4
	ld hl, $9980
	ld bc, 96 
CopyTilemap_4:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or a, c
	jp nz, CopyTilemap_4

WaitVBlank7:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank7

	; Copy tilemap for display
	ld de, TileMap_creditos_5
	ld hl, $99E0
	ld bc, 96
CopyTilemap_5:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or a, c
	jp nz, CopyTilemap_5


	ld b, 2
.wait
	ld c, 255
	call DelayFrames
	dec b
	jr nz, .wait

	ret

CreditsScreenGFX_naranjito:
INCBIN "gfx/credits/naranjito.2bpp" ; Imagen Font que se usa para luego mapear los tiles (caracteres) como un texto
CreditsScreenGFX_font_naranjito:

TileMap_creditos_0:
; row 1
	db 1, 20, 13, 10, 0, 8 ; Bunkai
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 2
	db 2, 0, 11, 4, 13, 19, 0, 3, 0, 18, 19, 2, 6 ; CalentadasTCG
	db 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 3
	db 12, 0, 6, 13, 14, 19, 21 ; MagnoTV
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row

TileMap_creditos_1:
; row 4
	db 0, 11, 23, 8, 17, 0, 31; Alxira5 
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 5
	db 111, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 6
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row

TileMap_creditos_2:
; row 7
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 8
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 9
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row

TileMap_creditos_3:
; row 10
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 11
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 12
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row

TileMap_creditos_4:
; row 13
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 14
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 15
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row

TileMap_creditos_5:
; row 16
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 17
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row
; row 18
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill row (20 col) with blank tiles
	db 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31 ; fill non displayed ram (12 col) for the row

TileMap_creditos_end:

