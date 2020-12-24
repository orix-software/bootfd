@echo off

SET BINARYFILE=bootfd
SET PATH_RELEASE=build\usr\share\%BINARYFILE%\
SET ORICUTRON="D:\Onedrive\oric\oricutron-iss2-debug\"

set VERSION=1.0.0
SET ORIGIN_PATH=%CD%
echo %osdk%
SET PATH=%PATH%;%CC65%

echo Cleaning build folder

del /F /S /Q build\

mkdir build\usr\bin
mkdir build\usr\share\doc\
mkdir build\usr\share\doc\%BINARYFILE%
mkdir build\usr\share\man

IF NOT EXIST build\usr\share\ipkg mkdir build\usr\share\ipkg      

echo #define VERSION "%VERSION%" > src\version.h
rem  123456789012345678
echo | set /p dummyName=bootfd    1.0.0  Start microdisc boot sector > src\ipkg\%BINARYFILE%.csv

copy src\ipkg\%BINARYFILE%.csv build\usr\share\ipkg 
copy src\man\%BINARYFILE%.hlp build\usr\share\man\
copy README.md build\usr\share\doc\%BINARYFILE%

%OSDK%\bin\xa.exe -R -cc src\bootbg.asm -o build\bootbg.o65 
co65  build\bootbg.o65 
cl65 -ttelestrat src/bootbg.c build/bootbg.s -o build/usr/bin/bootbg

%OSDK%\bin\xa.exe -R -cc src\boot-fd.asm -o build\%BINARYFILE%.o65 
co65  build\%BINARYFILE%.o65 
cl65 -ttelestrat src/bootfd.c build/%BINARYFILE%.s -o build/usr/bin/%BINARYFILE%

IF "%1"=="NORUN" GOTO End
rem py pyr %ORICUTRON%\usbdrive\bin
xcopy build\usr\bin\*  %ORICUTRON%\sdcard\bin /E /Q /Y
copy src\man\%BINARYFILE%.hlp  %ORICUTRON%\usbdrive\usr\share\man

copy src\ipkg\%BINARYFILE%.csv %ORICUTRON%\usbdrive\usr\share\ipkg\

cd %ORICUTRON%
Oricutron -mt
cd %ORIGIN_PATH%
:End


