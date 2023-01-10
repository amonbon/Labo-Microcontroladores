;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"firmware.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__modsint
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay
	global	_randomNum
	global	_randomRange

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_firmware_0	udata
r0x100F	res	1
r0x100E	res	1
r0x1010	res	1
r0x1007	res	1
r0x1006	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x1001	res	1
r0x1000	res	1
r0x1003	res	1
r0x1002	res	1
r0x1005	res	1
r0x1004	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_firmware	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _randomNum
;   _randomRange
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _randomRange
;   _randomNum
;   _randomRange
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _randomRange
;8 compiler assigned registers:
;   r0x100E
;   STK00
;   r0x100F
;   STK04
;   STK03
;   STK02
;   STK01
;   r0x1010
;; Starting pCode block
S_firmware__main	code
_main:
; 2 exit points
;	.line	32; "firmware.c"	TRISIO = 0b00000000; //Poner todos los pines como salidas
	BANKSEL	_TRISIO
	CLRF	_TRISIO
;	.line	33; "firmware.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	35; "firmware.c"	int lower = 1, upper = 6, aleatorio = randomNum();
	PAGESEL	_randomNum
	CALL	_randomNum
	PAGESEL	$
	MOVWF	r0x100E
	MOVF	STK00,W
;	.line	37; "firmware.c"	aleatorio = randomRange(lower, upper, aleatorio);
	MOVWF	r0x100F
	MOVWF	STK04
	MOVF	r0x100E,W
	MOVWF	STK03
	MOVLW	0x06
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomRange
	CALL	_randomRange
	PAGESEL	$
	MOVWF	r0x100E
	MOVF	STK00,W
	MOVWF	r0x100F
_00115_DS_:
;	.line	42; "firmware.c"	if(GP3)
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00113_DS_
;;signed compare: left < lit(0x1=1), size=2, mask=ffff
;	.line	44; "firmware.c"	switch (aleatorio)
	MOVF	r0x100E,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x01
	SUBWF	r0x100F,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x7=7), size=2, mask=ffff
	MOVF	r0x100E,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00140_DS_
	MOVLW	0x07
	SUBWF	r0x100F,W
_00140_DS_:
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
	DECF	r0x100F,W
	MOVWF	r0x1010
	MOVLW	HIGH(_00141_DS_)
	MOVWF	PCLATH
	MOVLW	_00141_DS_
	ADDWF	r0x1010,W
	BTFSC	STATUS,0
	INCF	PCLATH,F
	MOVWF	PCL
_00141_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
_00105_DS_:
;	.line	47; "firmware.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	48; "firmware.c"	delay(time);
	MOVLW	0xf4
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	49; "firmware.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	50; "firmware.c"	break;
	GOTO	_00113_DS_
_00106_DS_:
;	.line	53; "firmware.c"	GP1 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	54; "firmware.c"	delay(time);
	MOVLW	0xf4
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	55; "firmware.c"	GP1 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
;	.line	56; "firmware.c"	break;
	GOTO	_00113_DS_
_00107_DS_:
;	.line	59; "firmware.c"	GPIO = 0b00000011;
	MOVLW	0x03
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	60; "firmware.c"	delay(time);
	MOVLW	0xf4
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	61; "firmware.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	62; "firmware.c"	break;
	GOTO	_00113_DS_
_00108_DS_:
;	.line	65; "firmware.c"	GPIO = 0b00000110;
	MOVLW	0x06
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	66; "firmware.c"	delay(time);
	MOVLW	0xf4
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	67; "firmware.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	68; "firmware.c"	break;
	GOTO	_00113_DS_
_00109_DS_:
;	.line	71; "firmware.c"	GPIO = 0b00000111;
	MOVLW	0x07
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	72; "firmware.c"	delay(time);
	MOVLW	0xf4
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	73; "firmware.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	74; "firmware.c"	break;
	GOTO	_00113_DS_
_00110_DS_:
;	.line	77; "firmware.c"	GPIO = 0b00010111;
	MOVLW	0x17
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	78; "firmware.c"	delay(time);
	MOVLW	0xf4
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	79; "firmware.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
_00113_DS_:
;	.line	88; "firmware.c"	aleatorio = randomRange(lower, upper, aleatorio);		
	MOVF	r0x100F,W
	MOVWF	STK04
	MOVF	r0x100E,W
	MOVWF	STK03
	MOVLW	0x06
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomRange
	CALL	_randomRange
	PAGESEL	$
	MOVWF	r0x100E
	MOVF	STK00,W
	MOVWF	r0x100F
	GOTO	_00115_DS_
;	.line	91; "firmware.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modsint
;   __modsint
;11 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   STK01
;   r0x1002
;   STK02
;   r0x1003
;   STK03
;   r0x1004
;   STK04
;   r0x1005
;; Starting pCode block
S_firmware__randomRange	code
_randomRange:
; 2 exit points
;	.line	110; "firmware.c"	int randomRange( int min, int max, int past_num )  
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
	MOVF	STK01,W
	MOVWF	r0x1002
	MOVF	STK02,W
	MOVWF	r0x1003
	MOVF	STK03,W
	MOVWF	r0x1004
	MOVF	STK04,W
	MOVWF	r0x1005
;	.line	112; "firmware.c"	return past_num % (max+1-min) + min ;  
	INCF	r0x1003,F
	BTFSC	STATUS,2
	INCF	r0x1002,F
	MOVF	r0x1001,W
	SUBWF	r0x1003,F
	MOVF	r0x1000,W
	BTFSS	STATUS,0
	INCFSZ	r0x1000,W
	SUBWF	r0x1002,F
	MOVF	r0x1003,W
	MOVWF	STK02
	MOVF	r0x1002,W
	MOVWF	STK01
	MOVF	r0x1005,W
	MOVWF	STK00
	MOVF	r0x1004,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
	MOVF	r0x1001,W
	ADDWF	r0x1003,W
	MOVWF	r0x1001
	MOVF	r0x1002,W
	BTFSC	STATUS,0
	INCFSZ	r0x1002,W
	ADDWF	r0x1000,F
	MOVF	r0x1001,W
	MOVWF	STK00
	MOVF	r0x1000,W
;	.line	113; "firmware.c"	}
	RETURN	
; exit point of _randomRange

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   STK00
;; Starting pCode block
S_firmware__randomNum	code
_randomNum:
; 2 exit points
;	.line	107; "firmware.c"	return next ; 
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xfe
;	.line	108; "firmware.c"	} 
	RETURN	
; exit point of _randomNum

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;; Starting pCode block
S_firmware__delay	code
_delay:
; 2 exit points
;	.line	93; "firmware.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1007
;	.line	98; "firmware.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1008
	CLRF	r0x1009
_00152_DS_:
	MOVF	r0x1006,W
	SUBWF	r0x1009,W
	BTFSS	STATUS,2
	GOTO	_00173_DS_
	MOVF	r0x1007,W
	SUBWF	r0x1008,W
_00173_DS_:
	BTFSC	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3307: created from rifx:00000000047A5780
;	.line	99; "firmware.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x100A
	MOVLW	0x04
	MOVWF	r0x100B
_00150_DS_:
	MOVLW	0xff
	ADDWF	r0x100A,W
	MOVWF	r0x100C
	MOVLW	0xff
	MOVWF	r0x100D
	MOVF	r0x100B,W
	BTFSC	STATUS,0
	INCFSZ	r0x100B,W
	ADDWF	r0x100D,F
	MOVF	r0x100C,W
	MOVWF	r0x100A
	MOVF	r0x100D,W
	MOVWF	r0x100B
	MOVF	r0x100D,W
	IORWF	r0x100C,W
	BTFSS	STATUS,2
	GOTO	_00150_DS_
;	.line	98; "firmware.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1008,F
	BTFSC	STATUS,2
	INCF	r0x1009,F
	GOTO	_00152_DS_
_00154_DS_:
;	.line	100; "firmware.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  202+   35 =   237 instructions (  544 byte)

	end
