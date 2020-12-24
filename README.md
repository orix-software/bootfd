# bootfd

bootfd is an Orix program to read bootsector on microdisc and start this boot sector.

launch : 
 * cd /usr/bin/
 * ./bootfd 

It reads boot sector and start it. It's useful to start demo on the oric from disc for example (barbitoric, asm2k2, etc). It does not work on real telestrat for some demo because these demo are coded without the microdisc bug corrected on telestrat

Code : Jede

Language : 6502 assembly. This version only works with emulator

## Software working on the real hardware with Orix and bootfd 
* Blake's 7 (not released yet, but beta works)
* Pushing the envelope
* Oric Tech

## Use

Demo working with this way (emulator only for instance):

* asm2k2  (not working on real telestrat : need to fix telestrat bug into this demo)
* barbitoric   (not working on real telestrat : need to fix telestrat bug into this demo)
* quintessential (but it crashed after picture of super tomato, maybe it tries to return to atmos rom.)
* Kindergarden2014  (not working on real telestrat : need to fix telestrat bug into this demo)
* OricTech (Working en real telestrat, please download the corrected version on oric.org)
* pushingtheenvelope (not working on real telestrat : need to fix telestrat bug into this demo)
* bornin1983  (not working on real telestrat : need to fix telestrat bug into this demo)


Demo does not work yet :

* BuggyBoy
* VIP2014

## how to compile
 you need osdk and cc65
 $ make.bat
 $ makeRelease.bat to build binary
 
## TODO
 * man page
 * jasmin management boot sector

 

