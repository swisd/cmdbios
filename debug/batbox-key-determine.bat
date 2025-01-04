@echo off
title batbox-key-determine

:a
batbox.exe /k
echo %errorlevel%
goto a