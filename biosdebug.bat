@echo off
@shift

set "filePath=events.txt"
set "lastModified="

:loop
for /f "delims=" %%a in ('powershell -command "(Get-Item '%filePath%').LastWriteTime.Ticks"') do set "currentModified=%%a"

if not defined lastModified (
    set "lastModified=%currentModified%"
) else if not "%lastModified%"=="%currentModified%" (
    set "lastModified=%currentModified%"
    call :processFile
)

timeout /t 1 >nul
goto loop

:processFile
setlocal

set "pri_fat=[0m[0m F [0m[31m"
set "pri_err=[0m[41m E [0m[31m"
set "pri_warn=[0m[43m W [0m[33m"
set "pri_inf=[0m[46m I [0m[34m"
set "pri_deb=[0m[43m D [0m[35m"
set "pri_ver=[0m[47m[30m V [0m"

for /F "tokens=1* delims=;" %%A in (%filePath%) do (
    if "%%A"=="" goto :continueLoop
    set "event=%%A"
    echo %%A
    echo %event%

    for /F "tokens=1,2,3,4,5,6,7,8 delims=," %%b in ("%%A") do (
        set "tag=%%c"
        set "priset=%%e"
        set "datestamp=%%f"
        set "timestamp=%%g"
        set "pid=%%h"

        set "stprio="
        if /I "%%e" EQU "F" set "stprio=%pri_fat%"
        if /I "%%e" EQU "E" set "stprio=%pri_err%"
        if /I "%%e" EQU "W" set "stprio=%pri_warn%"
        if /I "%%e" EQU "I" set "stprio=%pri_inf%"
        if /I "%%e" EQU "D" set "stprio=%pri_deb%"
        if /I "%%e" EQU "V" set "stprio=%pri_ver%"

        set "outputLine=[0m%datestamp%-%timestamp%"

        if defined pid (
          set "outputLine=%outputLine% %pid%"
        )

        set "outputLine=%outputLine% %tag%    %stprio%"

        echo %outputLine%
    )

    :continueLoop
)

del temp >nul
endlocal
exit /b