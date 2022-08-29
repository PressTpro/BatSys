@echo off
:: Set Variables
set ver=installer-0.1
color 1f
:: Installer
:index
cls
title BatSys Installer
echo This Program Installs BatSys in your Computer
echo Make Sure you're connected to internet
pause
goto install
:install
echo BatSys Location
set /p location="Where you want to Install BatSys? "
echo Downloading Files...
powershell Invoke-WebRequest https://github.com/PressTpro/BatSys/raw/main/batsys.bat -OutFile %location%/batsys.bat
echo Downloading Manual
powershell Invoke-WebRequest https://raw.githubusercontent.com/PressTpro/BatSys/main/manual.bat -OutFile %location%/manual.bat
goto check
:check
echo Checking...
if exist batsys.bat == true goto installed
if exist manual.bat == true goto installed
if not exist batsys.bat == true goto no-installedbatsys
if not exist manual.bat == true goto no-installedmanual
:installed
echo Installed, Check %location%
echo Login with these info
echo Username: (you can put any username)
echo Password: password
pause
start %location%/batsys.bat
exit
:no-installedbatsys
echo BatSys has been not installed
goto error-nofeatureinstalled
:no-installedmanual
echo Manual has been not installed
:error-nofeatureinstalled
echo Some of the Features has been not installed
pause
exit
