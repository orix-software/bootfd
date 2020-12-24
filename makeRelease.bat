@echo off
Set VERSION=1.0.0

set PATH_TAR="C:\Program Files (x86)\GnuWin32\bin"
set PATH_UNZIP="C:\Program Files\7-Zip"

cd build
del bootfd.o65 
del bootfd.s
del bootfd.o
del bootfd.tar
cd ..

mkdir release\download\orix\%VERSION%\



rem xcopy build\* release\download\orix\%VERSION%\ /E /Q /Y


cd build

%PATH_TAR%\tar -cf bootfd.tar *

cd ..

del /S /F /Q release\download\orix\%VERSION%\*.*
rmdir /s /q release\download\orix\%VERSION%\usr
copy build\bootfd.tar release\download\orix\%VERSION%\
%PATH_UNZIP%\7z a  release\download\orix\%VERSION%\bootfd.tgz release\download\orix\%VERSION%\bootfd.tar
del /S /F /Q release\download\orix\%VERSION%\bootfd.tar


