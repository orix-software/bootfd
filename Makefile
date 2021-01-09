CFLAGS=-ttelestrat
LDFILES=src/_copy_eeprom.asm


PROGRAM=bootfd
SOURCE=src/$(PROGRAM).c

ASFLAGS=-R -v -cc 

all: project docs

ifeq ($(CC65_HOME),)
	CC = cl65
	AS = ca65
	LD = ld65
	AR = ar65
else
	CC = $(CC65_HOME)/bin/cl65
	AS = $(CC65_HOME)/bin/ca65
	LD = $(CC65_HOME)/bin/ld65
	AR = $(CC65_HOME)/bin/ar65
endif

project:

	mkdir build/bin -p
	mkdir build/usr/share/bootfd -p
	$(CC) -o build/bin/$(PROGRAM) $(CFLAGS) $(SOURCE) $(LDFILES)
	cp microdis.rom build/usr/share/bootfd

test:

	echo nothing


docs:
	@echo -e "\nMake project $(PROJECT) man page\n"
	@$(MAKE) -C docs
