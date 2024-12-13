@echo off
setlocal enabledelayedexpansion
:a
:: Set the characters to be used for the password
set chars=ABCDEF0123456789

:: Set the length of the password
set passwordLength=256

:: Initialize an empty password variable
set password=

:: Generate the password
for /L %%i in (1,1,%passwordLength%) do (
    set /a rand=!random! %% 16
    call :getRandomChar !rand!
    set password=!password!!randomChar!
)

:: Display the generated password
echo %password%>key
:: pause>nul
:: goto a
goto :eof

:getRandomChar
setlocal
set /a index=%1
set chars=ABCDEF0123456789
set randomChar=!chars:~%index%,1!
endlocal & set randomChar=%randomChar%
goto :eof