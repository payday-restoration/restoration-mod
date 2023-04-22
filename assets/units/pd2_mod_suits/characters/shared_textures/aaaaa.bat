@ECHO OFF
CLS

:MENU
CLS

ECHO ============= FILE CONVERSION OPTIONS =============
ECHO -------------------------------------
ECHO 1.  DDS TO TEXTURE
ECHO 2.  TEXTURE TO DDS
ECHO ==========INPUT 'Q' TO QUIT==========
ECHO.

SET INPUT=
SET /P INPUT=Please select an option:

IF /I '%INPUT%'=='1' GOTO Selection1
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='Q' GOTO Quit
CLS

ECHO ============INVALID INPUT============
ECHO -------------------------------------
ECHO Please select a number from the Main
echo Menu [1-2] or select 'Q' to quit.
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE > NUL
GOTO MENU

:Selection1

forfiles /S /M *texture.dds /C "cmd /c rename @file @fname."
forfiles /S /M *.dds /C "cmd /c rename @file @fname.texture"
GOTO Quit


:Selection2
forfiles /S /M *.texture /C "cmd /c rename @file @fname.dds"
GOTO Quit

:Quit
CLS
ECHO ==============CONVERSION COMPLETE===============
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE>NUL
EXIT

















