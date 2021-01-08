CC=cl65
CO=co65
AS=xa

CFLAGS=-ttelestrat
LDFILES=src/_copy_eeprom.asm

PROGRAM=bootfd
SOURCE=src/$(PROGRAM).c

ASFLAGS=-R -v -cc 

bootfd.o:

	mkdir build/bin -p
	mkdir build/usr/share/bootfd -p
	$(CC) -o build/bin/$(PROGRAM) $(CFLAGS) $(SOURCE) $(LDFILES)
	cp microdis.rom build/usr/share/bootfd

test:

	echo nothing


