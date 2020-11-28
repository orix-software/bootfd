#define FLOPPY_LOADER_TRACK 0   // Track where the loader is stored
#define FLOPPY_LOADER_SECTOR 2   // Sector where the loader is stored
#define FLOPPY_LOADER_ADDRESS $6000   // Address where the loader is loaded on boot ($fd00)

#ifdef TARGET_ORIX
.text
*=$1000-20
; include header
	.byt $01,$00		; non-C64 marker like o65 format
	.byt "o", "r", "i"      ; "ori" MAGIC number :$6f, $36, $35 like o65 format
	.byt $01                ; version of this header
cpu_mode
	.byt $00                ; CPU see below for description
language_type
  .byt $00	        ; reserved in the future, it will define if it's a Hyperbasic file, teleass file, forth file 
  .byt $00                ; reserved
  .byt $00		; reserved
	.byt $00	        ; operating system id for telemon $00 means telemon 3.0 version
  .byt $00	        ; reserved
	.byt $00                ; reserved
type_of_file
	.byt %01001001                   ; Auto, direct, data for stratsed, sedoric, ftdos compatibility
	.byt <start_adress,>start_adress ; loading adress
	.byt <EndOfMemory,>EndOfMemory   ; end of loading adress
	.byt <start_adress,>start_adress ; starting adress
 
start_adress
#endif

.text
_boot_microdisc:
.(
#include "src/sector_2-microdisc_bootbg.asm"
.)
	rts

EndOfMemory
