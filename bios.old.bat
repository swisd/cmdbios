@echo off
color 1f
::Main Variables
set biosversion=1.30
set bootpriority=
set basepath=
set corepath=%cd%

set bclk=

ping localhost -n 3 >nul
::Main Menu
:biosmenu
set biosmenu=
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
echo ============================
echo [1] Boot device priority
echo [2] System time and date
echo [3] Power management
echo [4] Security
echo [5] Overclocking
echo [6] Hardware
echo [7] Sysinfo
echo [8] Exit
echo ============================

set /p biosmenu=^>
if /I "%biosmenu%" EQU "1" (
  goto bootprio
)
if /I "%biosmenu%" EQU "2" (
  goto systime
)
if /I "%biosmenu%" EQU "3" (
  goto powerman
)
if /I "%biosmenu%" EQU "4" (
  goto security
)
if /I "%biosmenu%" EQU "5" (
  goto overclock
)
if /I "%biosmenu%" EQU "6" (
  goto hardware
)
if /I "%biosmenu%" EQU "7" (
  goto systeminfo
)
if /I "%biosmenu%" EQU "8" (
  exit
)
goto biosmenu

:bootprio
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| find "Boot Device"') do set currentbootdevice=%%a
echo Current Boot Device: %currentbootdevice%
echo ============================
echo Boot Device Priority Menu
echo ============================
echo 1. Boot from Disk
echo 2. Boot from USB
echo 3. Boot from LAN
echo ============================
set /p bootChoice="> "

if "%bootChoice%"=="1" (
    echo Setting Boot Device Priority to Hard Drive...
    rem Simulate the change in boot priority
    timeout /t 2 /nobreak >nul
    goto biosmenu
) else if "%bootChoice%"=="2" (
    echo Setting Boot Device Priority to USB...
    rem Simulate the change in boot priority
    timeout /t 2 /nobreak >nul
    goto biosmenu
) else if "%bootChoice%"=="3" (
    echo Setting Boot Device Priority to Network...
    rem Simulate the change in boot priority
    timeout /t 2 /nobreak >nul
    goto biosmenu
)
goto biosmenu

:systime
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
for /f "tokens=2 delims=(" %%a in ('systeminfo ^| find "Time Zone"') do set currenttimezone=%%a
echo Current Time Zone: %currenttimezone%
echo Current Time: %time%
echo Current Date: %date%
echo ============================
echo 1. Set Date
echo 2. Set Time
echo ============================
set /p clockChoice="> "
if "%clockChoice%"=="1" (
    goto SetTime
)
if "%clockChoice%"=="2" (
    goto SetDate
)
goto biosmenu

:SetTime
cls
echo System Time Setup
echo ============================
echo Current System Time: %time%
echo 1. Set System Time
echo ============================
set /p timeChoice="> "

if "%timeChoice%"=="1" (
    set /p newTime="Enter new system time (HH:MM:SS): "
    time %newTime%
    echo System time updated to %newTime%.
    timeout /t 2 /nobreak >nul
    goto biosmenu
)
goto biosmenu


:SetDate
cls
echo System Date Setup
echo ============================
echo Current System Date: %date%
echo 1. Set System Date
echo ============================
set /p dateChoice="> "

if "%dateChoice%"=="1" (
    set /p newDate="Enter new system date (MM-DD-YYYY): "
    date %newDate%
    echo System date updated to %newDate%.
    timeout /t 2 /nobreak >nul
    goto biosmenu
)
goto biosmenu

:powerman
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
echo Power Management Settings
echo ============================
echo 1. Enable Sleep Mode
echo 2. Disable Sleep Mode
echo ============================
set /p powerChoice="> "

if "%powerChoice%"=="1" (
    echo Enabling sleep mode...
    rem Simulate enabling sleep mode
    timeout /t 2 /nobreak >nul
    goto biosmenu
) else if "%powerChoice%"=="2" (
    echo Disabling sleep mode...
    rem Simulate disabling sleep mode
    timeout /t 2 /nobreak >nul
    goto biosmenu
)
goto biosmenu

:security
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
echo Security Settings
echo ============================
echo 1. Set BIOS Password
echo 2. Disable BIOS Password
echo ============================
set /p securityChoice="> "

if "%securityChoice%"=="1" (
    set /p password="Enter a new BIOS password: "
    echo BIOS password set.
    timeout /t 2 /nobreak >nul
    goto biosmenu
) else if "%securityChoice%"=="2" (
    echo BIOS password disabled.
    timeout /t 2 /nobreak >nul
    goto biosmenu
)
goto biosmenu

:overclock
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
echo Overclocking Settings
echo ============================
echo 1. Increase CPU Multiplier
echo 2. Decrease CPU Multiplier
echo ============================
set /p ocChoice="> "

if "%ocChoice%"=="1" (
    echo Increasing CPU multiplier...
    rem Simulate overclocking action
    timeout /t 2 /nobreak >nul
    goto biosmenu
) else if "%ocChoice%"=="2" (
    echo Decreasing CPU multiplier...
    rem Simulate overclocking action
    timeout /t 2 /nobreak >nul
    goto biosmenu
)
goto biosmenu

:hardware
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
echo Hardware Information Menu
echo ============================
echo 1. View CPU Information
echo 2. View RAM Information
echo 3. View Disk Drives
echo ============================
set /p hardwareChoice="> "

if "%hardwareChoice%"=="1" (
    echo Displaying CPU Information...
    wmic cpu get caption, deviceid, name, maxclockspeed, currentclockspeed
    timeout /t 15 /nobreak >nul
    goto :hardware
) else if "%hardwareChoice%"=="2" (
    echo Displaying RAM Information...
    wmic memorychip get capacity, speed, devicelocator, manufacturer
    timeout /t 15 /nobreak >nul
    goto :hardware
) else if "%hardwareChoice%"=="3" (
    echo Displaying Disk Drives Information...
    wmic diskdrive get model, size, mediaType
    timeout /t 15 /nobreak >nul
    goto :hardware
)
goto biosmenu

:systeminfo
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
systeminfo
pause>nul
goto biosmenu