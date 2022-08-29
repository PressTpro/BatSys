@echo off
:: Menu Pages
:index
title Index - BatSys Manual
echo Welcome to BatSys Manual, Type the name of the page you want to go
echo 1) Return to BatSys
echo 2) Getting Started
echo 3) Searching the Web with BBrowser
set /p page=""
goto return
:return
start batsys.bat
exit
