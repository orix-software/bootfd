CC=cl65
CO=co65
AS=xa

CFLAGS=-ttelestrat
LDFILES=src/bootfdcc65.s src/_copy_eeprom.asm

PROGRAM=bootfd
SOURCE=src/$(PROGRAM).c

ASFLAGS=-R -v -cc 

bootfd.o: src/boot-fd.asm
	$(AS)  $(ASFLAGS) src/boot-fd.asm -o src/bootfd.o
	$(CO) src/bootfd.o -o src/bootfdcc65.s
	$(CC) -o $(PROGRAM) $(CFLAGS) $(SOURCE) $(LDFILES)

test:

	echo nothing


