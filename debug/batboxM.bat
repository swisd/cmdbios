@echo off
cls
set char=+
:a
batbox.exe /h 0
FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /m') DO (
     SET z=%%C
     SET y=%%B
     SET x=%%A
     batbox.exe /g 0 0
     echo %x% %y% %z%   .
)
if /I "%z%" EQU "2" (
    if /I "%char%" EQU "-" (
        set char=+
        goto a
    )
    if /I "%char%" EQU "+" (
        set char=-
        goto a
    )
)
batbox.exe /g %x% %y% /d %char%
batbox.exe /h 0
goto a