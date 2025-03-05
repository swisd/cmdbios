@echo off
@shift

set tag=
set date=
set time=
set "prio=[0m[47m[30m V [0m"
set pid=
set source=
set message=

set "pri_fat=[0m[0m F [0m"
set "pri_err=[0m[41m E [0m[31m"
set "pri_warn=[0m[43m W [0m[33m"
set "pri_inf=[0m[46m I [0m"
set "pri_deb=[0m[43m D [0m"
set "pri_ver=[0m[47m[30m V [0m"

:a
for /F "tokens=1 delims=;" %%A in (events.txt) do (
    set event=%%A
    echo %%A > temp
    for /F "tokens=3 delims=," %%a in (temp) do set tag=%%a
    for /F "tokens=5 delims=," %%a in (temp) do set priset=%%a
    for /F "tokens=6 delims=," %%a in (temp) do set datestamp=%%a
    for /F "tokens=7 delims=," %%a in (temp) do set timestamp=%%a

    set "stprio="
    if /I "%priset%" EQU "F" set "stprio=%pri_fat%"
    if /I "%priset%" EQU "E" set "stprio=%pri_err%"
    if /I "%priset%" EQU "W" set "stprio=%pri_warn%"
    if /I "%priset%" EQU "I" set "stprio=%pri_inf%"
    if /I "%priset%" EQU "D" set "stprio=%pri_deb%"
    if /I "%priset%" EQU "V" set "stprio=%pri_ver%"

    echo [0m%datestamp%-%timestamp% %pid% %tag% 	%stprio%   %message%
)
goto a
