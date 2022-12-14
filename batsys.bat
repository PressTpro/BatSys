@echo off
set logfile=log.log
:boot
title Booting BatSys
:sysload
:: Load System Settings
set color=1f
echo color = %color% >>%logfile%
color %color%
set ver=v0.1
echo version %ver% >>%logfile%
echo Welcome to BatSys %ver%
echo The Public OS
set password=password
echo password "%password%" >>%logfile%
:: System Logic
if loggedin == false goto logsession
if ERRORLEVEL == 1 goto crash-invalid-response
echo logic build correctly >>%logfile%
:: System Login
title BatSys
:logsession
set location=logsession
cls
echo Welcome to BatSys %ver%
echo Please Put your BatSys Network Username
set /p myuser=""
echo login in %myuser% >>%logfile%
:logsessionpswdcheck
echo Hello %myuser%, Just to Verify its you
echo Please Enter your BatSys Network Password
set /p mypass=""
echo password entered: %mypass% >>%logfile%
if %mypass% == %password% goto load
goto logsessionerror
:: Desktop
:load
set loggedin=true
:desktop
echo Welcome, %myuser%
echo Please Select an Option
echo 1) Enter BatNotepad
echo 2) Search The Web using BBrowser
echo 3) Delete, Rename and more using RENAMER and DELETER
echo 4) Read about BatSys in BatSys Operations Manual
echo 5) Run Commands in our CMD
echo 6) Settings
set /p deskt-option=""
if %deskt-option% == 1 goto notepad
if %deskt-option% == 2 goto bbrowser
if %deskt-option% == 3 goto extras
if %deskt-option% == 4 goto manual
if %deskt-option% == 5 goto batsyscommand
if %deskt-option% == 6 goto settings
goto crash-undefined-value

:: Tools
:notepad
cls
title BatNotepad
set /p filecontent="File Content, Press ENTER when you're done :"
set /p filename="Filename:"
echo %filecontent% >>%filename%
echo Saved in /%filename%
pause
goto desktop
:bbrowser
cls
title BBrowser Lite
set /p site="URL:"
start msedge.exe %site%
pause
goto desktop
:extras
cls
title BatSys Extras
echo 1) Renamer
echo 2) Deleter
set /p extras-tool="Tool: "
if %extras-tool% == 1 goto renamer
if %extras-tool% == 2 goto deleter

:settings
cls
title BatSys Settings
echo 1) Change color
echo 2) Change Password
echo 3) Logout
set /p settings-option=""
if %settings-option% == 1 goto change-color
if %settings-option% == 2 goto change-password
:change-password
title BatSys Password
set /p oldpass="Existing Password: "
if %oldpass% == %password% goto change-password-c2
goto logsessionerror
:change-password-c2
set /p newpass="New Password: "
cls
set /p confirmpass=""Confirm New Password: "
if %confirmpass% == %newpass% goto change-password-c3
goto logsessionerror
:change-password-c3
cls
echo Please Wait...
set password=%newpass%
goto logsession
:change-color
title BatSys color
set /p newcolor="New Color (Default 1f) "
set color = %newcolor%
goto settings
:manual
start manual.bat
exit
:deleter
cls
title DELETER - Powered by BatSys
echo Welcome to DELETER, please Type the name of the File you want to delete
set /p file="Please Insert File Location:"
echo Deleting...
DEL %file%
echo Deleted, %file% is Gone
echo Thanks for Steping by!
pause
goto desktop
:renamer
cls
title RENAMER - Powered by BatSys
echo Welcome to RENAMER, please Type the name of the File you want to rename
set /p file="Please Insert File Location:"
echo Ok, You will rename %file%, Now Place the name you want to name the file
set /p rename="Put any Name you want, end with a file extension to make file work!:"
echo Transforming %file% into %rename% please wait...
RENAME %file% %rename%
echo Renamed, Check the File
echo Thanks for Steping by!
pause
goto desktop
:batsyscommand
cls
title BatSys COMMAND
echo Type goto desktop to return to the system
:runloop
:run
set /p command=">"
%command%
goto runloop





:: Errors
:logsessionerror
title BatSys Crash
echo BatSys has Crashed
echo Error 505 INVALID_SESSION
echo The Session is Invalid, Please Try Again
echo Restarting the system
pause
goto boot
echo error 505 >>%logfile%
:crash-undefined-value
title BatSys Crash
echo BatSys has Crashed
echo Error 500 UNDEFINED_VALUE
echo System Received a Undefined Value to run, The System Tried to Run the Undefined Value, Operation Aborted 
echo Restarting the system
pause
goto boot
:crash-invalid-response
title BatSys Crash
echo BatSys has Crashed
echo Error 100 INVALID_RESPONSE
echo System Received a Invalid Response
echo Restarting the system
pause
goto boot
