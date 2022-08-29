@echo off
:: Menu Pages
:index
title Index - BatSys Manual
echo Welcome to BatSys Manual, Type the name of the page you want to go
echo 1) Return to BatSys
echo 2) Getting Started
echo 3) Searching the Web with BBrowser
set /p page=""
if %page% == 1 goto return
if %page% == 2 goto getting-started
if %page% == 3 goto bbrowser
:: Pages
:bbrowser
title BBrowser - BatSys Manual
echo BBrowser is a Built-In Search Browser you can use it to connect to webpages through microsoft edge
pause
goto index
:return
start batsys.bat
exit
