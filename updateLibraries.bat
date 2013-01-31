@echo off

echo ^<?xml version="1.0" encoding="UTF-8" ?^> > libraries.xml
echo ^<libraries^> >> libraries.xml
for /f %%f in ('dir /b .\libraries') do (
	FOR /F "tokens=*" %%i in ('bin\md5.exe libraries\%%f') do SET md5=%%i
	echo ^    ^<library url="https://raw.github.com/spudgy/BoL-Libs/master/libraries/%%f" md5="%md5:~0,32%" /^> >> libraries.xml
)
echo ^</libraries^> >> libraries.xml

echo libraries.xml was successfully updated!