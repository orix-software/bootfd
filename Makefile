CC=cl65
CO=co65
AS=xa

CFLAGS=-ttelestrat
LDFILES=src/_copy_eeprom.asm

PROGRAM=bootfd
SOURCE=src/$(PROGRAM).c

ASFLAGS=-R -v -cc 

bootfd.o: src/boot-fd.asm
	#$(AS)  $(ASFLAGS) src/boot-fd.asm -o src/bootfd.o
	#$(CO) src/bootfd.o -o src/bootfdcc65.s
	mkdir build/bin -p
	mkdir build/usr/share/bootfd -p
	$(CC) -o build/bin/$(PROGRAM) $(CFLAGS) $(SOURCE) $(LDFILES)
	cp microdis.rom build/usr/share/bootfd

test:

	echo nothing


