;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module Snek
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _change
	.globl _update
	.globl _grow
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _S
	.globl _pastdir
	.globl _pasty
	.globl _pastx
	.globl _newdir
	.globl _newy
	.globl _newx
	.globl _i
	.globl _addy
	.globl _addx
	.globl _size
	.globl _food
	.globl _body
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_body::
	.ds 16
_food::
	.ds 16
_size::
	.ds 2
_addx::
	.ds 2
_addy::
	.ds 2
_i::
	.ds 2
_newx::
	.ds 2
_newy::
	.ds 2
_newdir::
	.ds 1
_pastx::
	.ds 2
_pasty::
	.ds 2
_pastdir::
	.ds 1
_S::
	.ds 50
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;Body.c:26: unsigned char body[] =
	ld	hl,#_body
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0001)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0002)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0003)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0004)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0005)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0006)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0007)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0008)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x0009)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x000a)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x000b)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x000c)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x000d)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x000e)
	ld	(hl),#0xff
	ld	hl,#(_body + 0x000f)
	ld	(hl),#0xff
;Food.c:26: unsigned char food[] =
	ld	hl,#_food
	ld	(hl),#0x00
	ld	hl,#(_food + 0x0001)
	ld	(hl),#0x3c
	ld	hl,#(_food + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x0003)
	ld	(hl),#0x42
	ld	hl,#(_food + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x0005)
	ld	(hl),#0x81
	ld	hl,#(_food + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x0007)
	ld	(hl),#0x81
	ld	hl,#(_food + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x0009)
	ld	(hl),#0x81
	ld	hl,#(_food + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x000b)
	ld	(hl),#0x81
	ld	hl,#(_food + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x000d)
	ld	(hl),#0x42
	ld	hl,#(_food + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_food + 0x000f)
	ld	(hl),#0x3c
;Snek.c:5: int size = 1; // Initial size.
	ld	hl,#_size
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;Snek.c:24: struct Snek S[10] ={
	ld	hl,#_S
	ld	(hl),#0x50
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0002)
	ld	(hl),#0x50
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0004)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x0005)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0007)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0009)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x000a)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x000c)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x000e)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x000f)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0011)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0013)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x0014)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0016)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0018)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x0019)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x001b)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x001d)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x001e)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0020)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0022)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x0023)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0025)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0027)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x0028)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x002a)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x002c)
	ld	(hl),#0x72
	ld	hl,#(_S + 0x002d)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x002f)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	ld	hl,#(_S + 0x0031)
	ld	(hl),#0x72
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;Snek.c:39: void grow()
;	---------------------------------
; Function grow
; ---------------------------------
_grow::
	add	sp, #-5
;Snek.c:42: set_sprite_tile(size,0);
	ld	hl,#_size
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;Snek.c:45: switch(S[size-1].dir)
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ldhl	sp,#0
	ld	(hl),a
;Snek.c:42: set_sprite_tile(size,0);
	push	hl
	ld	hl,#_size
	ld	a,(hl)
	ldhl	sp,#4
	ld	(hl),a
	pop	hl
;Snek.c:51: addy = S[size-1].ypos ;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
;Snek.c:45: switch(S[size-1].dir)
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x64
	jp	Z,00104$
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x6c
	jp	Z,00102$
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x72
	jr	Z,00101$
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x75
	jp	Z,00103$
	jp	00105$
;Snek.c:48: case 'r':
00101$:
;Snek.c:50: addx = S[size-1].xpos - 8 ;
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	add	a,#0xf8
	ld	hl,#_addx
	ld	(hl),a
	ld	a,b
	adc	a,#0xff
	inc	hl
	ld	(hl),a
;Snek.c:51: addy = S[size-1].ypos ;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_addy
	ld	(hl+),a
	inc	de
	ld	a,(de)
;Snek.c:52: move_sprite(size,addx,addy);
	ld	(hl-),a
	ld	d,(hl)
	ld	hl,#_addx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:53: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:56: S[size].xpos = S[size-1].xpos - 8;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	add	a,#0xf8
	ld	c,a
	ld	a,b
	adc	a,#0xff
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:57: S[size].ypos = S[size-1].ypos;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:58: S[size].dir = S[size-1].dir;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	pop	hl
	push	hl
	ld	(hl),c
;Snek.c:59: break ;
	jp	00105$
;Snek.c:62: case 'l':
00102$:
;Snek.c:64: addx = S[size-1].xpos + 8 ;
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x0008
	add	hl,bc
	ld	a,l
	ld	d,h
	ld	hl,#_addx
	ld	(hl+),a
	ld	(hl),d
;Snek.c:65: addy = S[size-1].ypos ;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_addy
	ld	(hl+),a
	inc	de
	ld	a,(de)
;Snek.c:66: move_sprite(size,addx,addy);
	ld	(hl-),a
	ld	d,(hl)
	ld	hl,#_addx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:67: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:68: S[size].xpos = S[size-1].xpos + 8;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x0008
	add	hl,bc
	ld	c,l
	ld	b,h
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:69: S[size].ypos = S[size-1].ypos;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:70: S[size].dir = S[size-1].dir;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	pop	hl
	push	hl
	ld	(hl),c
;Snek.c:71: break ;
	jp	00105$
;Snek.c:74: case 'u':
00103$:
;Snek.c:75: addx = S[size-1].xpos ;
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_addx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:76: addy = S[size-1].ypos +8 ;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x0008
	add	hl,bc
	ld	a,l
	ld	d,h
	ld	hl,#_addy
	ld	(hl+),a
	ld	(hl),d
;Snek.c:77: move_sprite(size,addx,addy);
	dec	hl
	ld	d,(hl)
	ld	hl,#_addx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:78: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:79: S[size].xpos = S[size-1].xpos;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:80: S[size].ypos = S[size-1].ypos + 8;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x0008
	add	hl,bc
	ld	c,l
	ld	b,h
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:81: S[size].dir = S[size-1].dir;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	pop	hl
	push	hl
	ld	(hl),c
;Snek.c:82: break ;
	jp	00105$
;Snek.c:85: case 'd':
00104$:
;Snek.c:86: addx = S[size-1].xpos ;
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_addx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:87: addy = S[size-1].ypos -8 ;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	add	a,#0xf8
	ld	hl,#_addy
	ld	(hl),a
	ld	a,b
	adc	a,#0xff
	inc	hl
;Snek.c:88: move_sprite(size,addx,addy);
	ld	(hl-),a
	ld	b,(hl)
	ld	hl,#_addx
	ld	d,(hl)
	push	bc
	inc	sp
	push	de
	inc	sp
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:89: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:90: S[size].xpos = S[size-1].xpos;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:91: S[size].ypos = S[size-1].ypos - 8;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ldhl	sp,#3
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	add	a,#0xf8
	ld	c,a
	ld	a,b
	adc	a,#0xff
	ld	b,a
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;Snek.c:92: S[size].dir = S[size-1].dir;
	ld	hl,#_size + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	ld	hl,#_size
	ld	c,(hl)
	dec	c
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
;Snek.c:94: }
00105$:
;Snek.c:96: SHOW_SPRITES ;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;Snek.c:97: size += 1 ;
	ld	hl,#_size
	inc	(hl)
	jr	NZ,00128$
	inc	hl
	inc	(hl)
00128$:
	add	sp, #5
	ret
;Snek.c:101: void update(){
;	---------------------------------
; Function update
; ---------------------------------
_update::
	add	sp, #-5
;Snek.c:103: switch(S[0].dir)
	ld	bc,#_S + 4
	ld	a,(bc)
	ld	c,a
	sub	a, #0x64
	jp	Z,00116$
	ld	a,c
	cp	a,#0x6c
	jr	Z,00101$
	cp	a,##0x72
	jp	Z,00106$
	sub	a, #0x75
	jp	Z,00111$
	jp	00134$
;Snek.c:105: case 'l':
00101$:
;Snek.c:109: for(i = 0; i != size; i++)
	ld	hl,#_i
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00123$:
	ld	hl,#_i
	ld	a,(hl)
	ld	hl,#_size
	sub	a, (hl)
	jr	NZ,00204$
	ld	hl,#_i + 1
	ld	a,(hl)
	ld	hl,#_size + 1
	sub	a, (hl)
	jp	Z,00105$
00204$:
;Snek.c:115: move_sprite(i,newx,newy);
	push	hl
	ld	hl,#_i
	ld	a,(hl)
	ldhl	sp,#2
	ld	(hl),a
	pop	hl
;Snek.c:111: if(i == 0){
	ld	hl,#_i + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00103$
;Snek.c:112: newx = S[i].xpos - 8;
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	add	a,#0xf8
	ld	hl,#_newx
	ld	(hl),a
	ld	a,b
	adc	a,#0xff
	inc	hl
	ld	(hl),a
;Snek.c:113: newy = S[i].ypos;
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_newy
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:114: newdir = S[i].dir;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	hl,#_newdir
	ld	(hl),a
;Snek.c:115: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:116: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:117: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:118: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:120: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:121: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:122: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
	jp	00124$
00103$:
;Snek.c:126: newx = pastx ;
	ld	hl,#_pastx
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newx
	ld	(hl+),a
	ld	(hl),e
;Snek.c:127: newy = pasty;
	ld	hl,#_pasty
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newy
	ld	(hl+),a
	ld	(hl),e
;Snek.c:128: newdir = pastdir;
	push	hl
	ld	hl,#_pastdir
	ld	a,(hl)
	ld	hl,#_newdir
	ld	(hl),a
	pop	hl
;Snek.c:129: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:130: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:131: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:132: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:133: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:134: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:135: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
00124$:
;Snek.c:109: for(i = 0; i != size; i++)
	ld	hl,#_i
	inc	(hl)
	jp	NZ,00123$
	inc	hl
	inc	(hl)
	jp	00123$
00105$:
;Snek.c:138: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:139: break;
	jp	00134$
;Snek.c:141: case 'r':
00106$:
;Snek.c:143: for(i = 0; i != size; i++)
	ld	hl,#_i
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00126$:
	ld	hl,#_i
	ld	a,(hl)
	ld	hl,#_size
	sub	a, (hl)
	jr	NZ,00206$
	ld	hl,#_i + 1
	ld	a,(hl)
	ld	hl,#_size + 1
	sub	a, (hl)
	jp	Z,00110$
00206$:
;Snek.c:115: move_sprite(i,newx,newy);
	push	hl
	ld	hl,#_i
	ld	a,(hl)
	ldhl	sp,#5
	ld	(hl),a
	pop	hl
;Snek.c:145: if(i == 0){
	ld	hl,#_i + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00108$
;Snek.c:146: newx = S[i].xpos + 8;
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#1
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0008
	add	hl,de
	ld	a,l
	ld	d,h
	ld	hl,#_newx
	ld	(hl+),a
	ld	(hl),d
;Snek.c:147: newy = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_newy
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:148: newdir = S[i].dir;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	hl,#_newdir
	ld	(hl),a
;Snek.c:149: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:150: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:151: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:152: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:154: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:155: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:156: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
	jp	00127$
00108$:
;Snek.c:160: newx = pastx ;
	ld	hl,#_pastx
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newx
	ld	(hl+),a
	ld	(hl),e
;Snek.c:161: newy = pasty;
	ld	hl,#_pasty
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newy
	ld	(hl+),a
	ld	(hl),e
;Snek.c:162: newdir = pastdir;
	push	hl
	ld	hl,#_pastdir
	ld	a,(hl)
	ld	hl,#_newdir
	ld	(hl),a
	pop	hl
;Snek.c:163: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:164: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:165: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:166: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:167: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:168: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:169: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
00127$:
;Snek.c:143: for(i = 0; i != size; i++)
	ld	hl,#_i
	inc	(hl)
	jp	NZ,00126$
	inc	hl
	inc	(hl)
	jp	00126$
00110$:
;Snek.c:172: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:173: break ;
	jp	00134$
;Snek.c:175: case 'u':
00111$:
;Snek.c:177: for(i = 0; i != size; i++)
	ld	hl,#_i
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00129$:
	ld	hl,#_i
	ld	a,(hl)
	ld	hl,#_size
	sub	a, (hl)
	jr	NZ,00208$
	ld	hl,#_i + 1
	ld	a,(hl)
	ld	hl,#_size + 1
	sub	a, (hl)
	jp	Z,00115$
00208$:
;Snek.c:115: move_sprite(i,newx,newy);
	push	hl
	ld	hl,#_i
	ld	a,(hl)
	ldhl	sp,#3
	ld	(hl),a
	pop	hl
;Snek.c:179: if(i == 0){
	ld	hl,#_i + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00113$
;Snek.c:180: newx = S[i].xpos;
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_newx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:181: newy = S[i].ypos - 8;
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	add	a,#0xf8
	ld	hl,#_newy
	ld	(hl),a
	ld	a,b
	adc	a,#0xff
	inc	hl
	ld	(hl),a
;Snek.c:182: newdir = S[i].dir;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	hl,#_newdir
	ld	(hl),a
;Snek.c:183: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:184: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:185: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:186: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:188: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:189: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:190: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
	jp	00130$
00113$:
;Snek.c:194: newx = pastx ;
	ld	hl,#_pastx
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newx
	ld	(hl+),a
	ld	(hl),e
;Snek.c:195: newy = pasty;
	ld	hl,#_pasty
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newy
	ld	(hl+),a
	ld	(hl),e
;Snek.c:196: newdir = pastdir;
	push	hl
	ld	hl,#_pastdir
	ld	a,(hl)
	ld	hl,#_newdir
	ld	(hl),a
	pop	hl
;Snek.c:197: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:198: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:199: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:200: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:201: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:202: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:203: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
00130$:
;Snek.c:177: for(i = 0; i != size; i++)
	ld	hl,#_i
	inc	(hl)
	jp	NZ,00129$
	inc	hl
	inc	(hl)
	jp	00129$
00115$:
;Snek.c:206: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:208: break ;
	jp	00134$
;Snek.c:210: case 'd':
00116$:
;Snek.c:212: for(i = 0;i != size; i++)
	ld	hl,#_i
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00132$:
	ld	hl,#_i
	ld	a,(hl)
	ld	hl,#_size
	sub	a, (hl)
	jr	NZ,00210$
	ld	hl,#_i + 1
	ld	a,(hl)
	ld	hl,#_size + 1
	sub	a, (hl)
	jp	Z,00120$
00210$:
;Snek.c:115: move_sprite(i,newx,newy);
	push	hl
	ld	hl,#_i
	ld	a,(hl)
	ldhl	sp,#3
	ld	(hl),a
	pop	hl
;Snek.c:214: if(i == 0){
	ld	hl,#_i + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00118$
;Snek.c:215: newx = S[i].xpos;
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_newx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:216: newy = S[i].ypos + 8;
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x0008
	add	hl,bc
	ld	a,l
	ld	d,h
	ld	hl,#_newy
	ld	(hl+),a
	ld	(hl),d
;Snek.c:217: newdir = S[i].dir;
	ldhl	sp,#(4 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	hl,#_newdir
	ld	(hl),a
;Snek.c:218: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	b,(hl)
	ld	hl,#_newx
	ld	d,(hl)
	push	bc
	inc	sp
	push	de
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:219: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:220: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:221: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:223: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:224: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:225: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
	jp	00133$
00118$:
;Snek.c:229: newx = pastx ;
	ld	hl,#_pastx
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newx
	ld	(hl+),a
	ld	(hl),e
;Snek.c:230: newy = pasty;
	ld	hl,#_pasty
	ld	a,(hl+)
	ld	e, (hl)
	ld	hl,#_newy
	ld	(hl+),a
	ld	(hl),e
;Snek.c:231: newdir = pastdir;
	push	hl
	ld	hl,#_pastdir
	ld	a,(hl)
	ld	hl,#_newdir
	ld	(hl),a
	pop	hl
;Snek.c:232: move_sprite(i,newx,newy);
	ld	hl,#_newy
	ld	d,(hl)
	ld	hl,#_newx
	ld	b,(hl)
	push	de
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:233: pastx = S[i].xpos ;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	hl,#_pastx
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:234: pasty = S[i].ypos;
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pasty
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;Snek.c:235: pastdir = S[i].dir;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	hl,#_pastdir
	ld	(hl),a
;Snek.c:236: S[i].xpos = newx;
	ld	hl,#_newx
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:237: S[i].ypos = newy;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	ld	hl,#_newy
	ld	a,(hl)
	ld	(bc),a
	inc	bc
	inc	hl
	ld	a,(hl)
	ld	(bc),a
;Snek.c:238: S[i].dir = newdir;
	ld	hl,#_i + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	hl,#_S
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl,#_newdir
	ld	a,(hl)
	ld	(bc),a
00133$:
;Snek.c:212: for(i = 0;i != size; i++)
	ld	hl,#_i
	inc	(hl)
	jp	NZ,00132$
	inc	hl
	inc	(hl)
	jp	00132$
00120$:
;Snek.c:241: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
;Snek.c:245: }
00134$:
	add	sp, #5
	ret
;Snek.c:248: void change() {
;	---------------------------------
; Function change
; ---------------------------------
_change::
;Snek.c:249: switch (joypad()) {
	call	_joypad
	ld	a,e
	dec	a
	jr	Z,00104$
	ld	a,e
	cp	a,#0x02
	jr	Z,00101$
	cp	a,##0x04
	jr	Z,00107$
	cp	a,#0x08
	jr	Z,00110$
	sub	a, #0x10
	jr	Z,00113$
	ret
;Snek.c:251: case J_LEFT:
00101$:
;Snek.c:252: if(S[0].dir != 'r')
	ld	de,#_S+4
	ld	a,(de)
	sub	a, #0x72
	ret	Z
;Snek.c:254: S[0].dir = 'l';
	ld	a,#0x6c
	ld	(de),a
;Snek.c:257: break;
	ret
;Snek.c:259: case J_RIGHT:
00104$:
;Snek.c:260: if(S[0].dir != 'l')
	ld	de,#_S+4
	ld	a,(de)
	sub	a, #0x6c
	ret	Z
;Snek.c:262: S[0].dir = 'r';
	ld	a,#0x72
	ld	(de),a
;Snek.c:265: break;
	ret
;Snek.c:267: case J_UP:
00107$:
;Snek.c:268: if(S[0].dir != 'd')
	ld	de,#_S+4
	ld	a,(de)
	sub	a, #0x64
	ret	Z
;Snek.c:270: S[0].dir = 'u' ;
	ld	a,#0x75
	ld	(de),a
;Snek.c:273: break;
	ret
;Snek.c:275: case J_DOWN:
00110$:
;Snek.c:276: if(S[0].dir != 'u')
	ld	de,#_S+4
	ld	a,(de)
	sub	a, #0x75
	ret	Z
;Snek.c:278: S[0].dir = 'd';
	ld	a,#0x64
	ld	(de),a
;Snek.c:281: break;
	ret
;Snek.c:283: case J_A:
00113$:
;Snek.c:285: grow();
;Snek.c:287: }
	jp	_grow
;Snek.c:290: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;Snek.c:292: SPRITES_8x8 ;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	res	2, c
	ld	b,#0x00
	ld	hl,#0xff40
	ld	(hl),c
;Snek.c:293: set_sprite_data(0,0,body) ;
	ld	hl,#_body
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;Snek.c:294: set_sprite_tile(0,0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;Snek.c:295: move_sprite(0,S[0].xpos,S[0].ypos);
	ld	de, #(_S + 0x0002) + 0
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,c
	ld	de, #_S + 0
	push	af
	ld	a,(de)
	ld	b,a
	inc	de
	ld	a,(de)
	ld	c,a
	pop	af
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;Snek.c:296: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;Snek.c:298: while(1)
00104$:
;Snek.c:300: if(joypad())
	call	_joypad
	ld	a,e
	or	a, a
	jr	Z,00102$
;Snek.c:302: wait_vbl_done();
	call	_wait_vbl_done
;Snek.c:303: change();
	call	_change
00102$:
;Snek.c:305: wait_vbl_done();
	call	_wait_vbl_done
;Snek.c:306: update() ;
	call	_update
	jr	00104$
	ret
	.area _CODE
	.area _CABS (ABS)
