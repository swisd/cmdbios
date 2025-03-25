rem @shift
@echo off
cls
mode con: cols=100 lines=26
batbox.exe /f 0
set currentScreenMode=F
if /I "%1" EQU "defaultcolor" (
  set background=[44m
)
if /I "%2" EQU "min" (
    batbox.exe /f 1
    set currentScreenMode=W
)

echo %1
echo %2

rem mode 150,40
rem Default color for display is 1f, 79, 9f, 0b, 0a, or 17
rem  [96m regular
rem  .
set background=[96m
set uicolor=0b ANSI (ESC[96m)

echo %background%
title CMDBIOS

rem if exist %~dp0/hash/hash256sha.bat (
rem    for /f "tokens=1 delims=" %%a in ('%~dp0/hash/hash256sha.bat %~dp0/bios.bat') do set hash=%%a
rem )
rem chcp 65001

set hash=
rem for /f "tokens=*" %%a in ('powershell -command "Get-FileHash -Path '%~dp0/bios.bat' -Algorithm SHA256 | Select-Object -ExpandProperty Hash"') do set "hash=%%a"
set "doublespace=  "
set "pointerspace=- "
set "pointerspace=➤ "
rem set "pointerspace=➽ "
rem set "pointerspace=➧ "
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
rem  Uncomment if you want selected text to be shifted

rem set "pointerspace=➤  "

set removeonstart=True

rem if "%1" == "spaceshift" (
rem    set "pointerspace=➤  "
rem )

set cItem=item1

::::::::::::::::::::
::General Choices
::::::::::::::::::::

::Enable/Disable
set enabledisable_0=Disabled
set enabledisable_1=Enabled
set onoff_0=Off
set onoff_1=On

::::::::::::::::::::::::::
::General/Misc Variables
::::::::::::::::::::::::::

set iBackground=off
set clear=[0m
set inverse=[7m
set pageback=%background%

::BIOS
set sysbioscache=Enabled
set vidbioscache=Enabled

set file=%~dp0/bios.bat

:: PowerShell command to compute SHA-256 hash
for /f "tokens=*" %%a in ('powershell -command "Get-FileHash -Path '%file%' -Algorithm SHA256 | Select-Object -ExpandProperty Hash"') do set "hash=%%a"

echo SHA-256 Hash: %hash%

:: PowerShell command to convert hexadecimal hash to byte array and then to base64
for /f "tokens=*" %%a in ('powershell -command "$hash = '%hash%'; $bytes = [convert]::FromHexString($hash); [convert]::ToBase64String($bytes)"') do set "base64Hash=%%a"

echo Base64 Hash: %base64Hash%

echo cs

set hash=%base64Hash%
set biosversion=3.31
set bootpriority=Disk
set boot2=USB
set boot3=Network
set basepath=
set biospath=%~dp0\
set language=English
set isSuperPass=Disabled
set isSuperPass_1=Disabled
set isSuperPass_2=Enabled
set isUserPass=Disabled
set isUserPass_1=Disabled
set isUserPass_2=Enabled
set bootnl=On
set fastbt=On
set halton=All Errors
set "videooffoption=Suspend ^> Off"
set vidoffmethod=DPMS OFF
set hddpowerdn=Disabled
set ramsuscap=Disabled
::CPU
set cpuVcoreVoltage=1.45
set cpuL1Enb=Enabled
set cpuL1Enb_1=Enabled
set cpuL1Enb_2=Disabled
set cpuL2Enb=Enabled
set cpuL2ECCEnb=Disabled
set cpuL3Enb=Enabled
set bclk=4600
set boostclk=5600
set csfm=2.0
set susmode=Disabled
set pbtnfour=Soft Off
set cputherm=Disabled
set cpupowlim=95W
set cputs=100C
set ivtx=On
set hyperthread=Enabled
set loadperf=Normal

::CHIPSET
set pchVoltage=1.0
set emmcOK=Enabled
set emmcSpeed=HS400
set iWIFI=Enabled, OK
set fanAC=Enabled

::MEM
set meminstalled=8192 MB DDR4 2666
set xmpprofile=Enabled
set os2mem=Enabled
set ramfreq=2666

::IO
set ps2mfc=Auto
set usblegacy=Auto
set onbaudio=Enabled
set onbserial=Enabled
set onbserialmode=RS232                         
set ps2supp=Enabled

::PCIE
set spciratio=10/100
set pciefreq=8000
set pciespeed=3.0
set pcieaspm=Enabled
set avcardpri=Disabled
set pcielane116spd=3.0
set pcielane1720spd=3.0
set pcielane2124spd=3.0
set pcielane25spd=3.0
set pcielane26spd=3.0
set pcieslt1enb=Enabled
set pcieslt2enb=Enabled
set pcieslt3enb=Enabled
set pcieslt4enb=Enabled
set pcieslt5enb=Enabled
set pcielanebifur=Enabled


::NET
set onlan1=Enabled
set onlan2=Enabled
set wlan1=Disabled
set wlan2=Disabled
set onbbt=Disabled
set onbwifi=Disabled

::DISK
set satamode=RAID
set nvmeconfig=BOOT

::POWER
set acpif=Enabled
set acpisust=S1
set powman=User-Define
set restorePL=Last-State
set poweronmthd=PWRBTN
set intspeedstep=Disabled
set cpucstate=Enabled
set s3powman=Enabled
set s4powman=Enabled
set bootperfmode=Normal
set onbdevpowcon=Enabled
set pdelay=Disabled
set aspo=Disabled
set pwrbtnbehav=Normal


::FAN
set fan_mode_1=Silent
set fan_mode_2=Normal
set fan_mode_3=Performance
set fan_mode_4=Full Speed

set fan_c_mode_1=PWM
set fan_c_mode_2=DC

set CPUFAN1=%fan_mode_3%
set CPUFAN1MODE=%fan_c_mode_1%
set CHAFAN1=%fan_mode_3%
set CHAFAN1MODE=%fan_c_mode_1%
set CHAFAN2=%fan_mode_3%
set CHAFAN2MODE=%fan_c_mode_1%
set CHAFAN3=%fan_mode_3%
set CHAFAN3MODE=%fan_c_mode_1%
set CHAFAN4=%fan_mode_3%
set CHAFAN4MODE=%fan_c_mode_1%
set fanFailWarning=Enabled

::SECURITY
set tpm2in=Enabled
set intlsgx=Enabled
set secBoot=Enabled

::PAGE
set "c1r=["
set "c1l=]"
set "c2r= "
set "c2l= "
set "c3r= "
set "c3l= "
set "c4r= "
set "c4l= "
set "c5r= "
set "c5l= "
set "c6r= "
set "c6l= "
set "c7r= "
set "c7l= "
set tab=1

set item1=%pointerspace%
set item2=%doublespace%
set item3=%doublespace%
set item4=%doublespace%
set item5=%doublespace%
set item6=%doublespace%
set item7=%doublespace%
set item8=%doublespace%
set item9=%doublespace%
set item10=%doublespace%
set item11=%doublespace%
set item12=%doublespace%
set item13=%doublespace%
set item14=%doublespace%
set item15=%doublespace%
set item16=%doublespace%
set item17=%doublespace%
set item18=%doublespace%
set item19=%doublespace%
set item20=%doublespace%


echo loadvars,0,bios,orange,D,%datestamp%,%timestamp%,%random%%random%%random%%random%;>events.txt
ping localhost -n 3 >nul


cls
batbox.exe /g 0 0
call %~dp0/biosvars.bat
if "%errorlevel%" EQU "1" (
    goto svar
)
set fileerror=Found BIOSVARS in %~dp0
set vrset=BIOSVARS saved
goto title

:svar
set fileerror=No variable file found. Using default variable set.
set vrset=Program Default
goto title
::Main Menu

:title
echo start,0,bios,orange,D,%datestamp%,%timestamp%,%random%%random%%random%%random%;>events.txt
cls
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
echo %fileerror%
echo.
call cinderblock-small-notext.bat
echo.
echo.
ping localhost -n 2 >nul
echo [ VR ] Using varset: %vrset%
::mklink /D "circular.k" "circular.k">nul
echo st:
for /f "tokens=2" %%i in ('wmic os get caption') do set VERSION1=%%i
echo v1
for /f "tokens=3" %%i in ('wmic os get caption') do set VERSION2=%%i
echo v2
for /f "tokens=4" %%i in ('wmic os get caption') do set VERSION3=%%i
echo v3
FOR /F "tokens=2*" %%A IN ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion 2^> nul') DO SET "CODENAME= %%B "
echo cdnm
FOR /F "skip=2 tokens=2,*" %%A IN ('reg.exe query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId"') DO set "DFMT7= %%B "
echo dfmt7
FOR /F "skip=2 tokens=2,*" %%A IN ('reg.exe query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild"') DO set "DFMT5= %%B"
echo dfmt5
FOR /F "tokens=2*" %%a in ('Reg Query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v UBR') do set "UBRHEX=%%~b"
set /a UBRDEC=%UBRHEX%
echo ubr
for /f "tokens=3 delims=()" %%a in ('wmic timezone get caption /value') do set tzone1=%%a
echo tzne0
for /f "tokens=2 delims=()" %%a in ('wmic timezone get caption /value') do set tzone2=%%a
echo tzne1


if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set "OSARC= 64bit ")
if "%PROCESSOR_ARCHITECTURE%"=="x86" (set "OSARC= 32bit ")


set "downloadDir=%USERPROFILE%\Downloads"

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "arch=64"
) else (
    set "arch=32"
)
ping localhost -n 1 >nul
echo [ OK ] Variables loaded
::fsutil sparse create "utils_dsk.sparse" 17179869000000 >nul
ping localhost -n 1 >nul
echo [ OK ] BATBOX exe exists; found: %~dp0
ping localhost -n 1 >nul
echo [ OK ] Deleting errormsg
del errormsg.vbs >nul
ping localhost -n 1 >nul
echo [ OK ] batbox keyinput ready
echo.
echo RTDEVICES -----------------------------------------
ping localhost -n 2 >nul
wmic cpu get DeviceID, NumberOfCores, NumberOfLogicalProcessors
echo 0x01  CPU [32mOK%background%
ping localhost -n 2 >nul
echo 0x31  GPU [32mOK%background%
ping localhost -n 2 >nul
wmic memorychip get devicelocator, capacity, speed
echo 0x11  RAM [32mOK%background%
ping localhost -n 2 >nul
wmic diskdrive get model,serialNumber,size,mediaType
echo 0x21  DSK [32mOK%background%
ping localhost -n 2 >nul
echo 0x41  NET [32mOK%background%
echo ----------------------------------------------------
ping localhost -n 2 >nul
echo \\ [32m7F%background%
echo \\ SYS OK.


set "btmbar=[104m[37m %VERSION1% %VERSION2% %VERSION3% [0m[41m[37m%DFMT7%[0m[42m%CODENAME%[0m[44m%DFMT5%.%UBRDEC% [0m[45m%OSARC%[0m"
batbox.exe /h 0

rem pause>nul
rem cls
setlocal ENABLEDELAYEDEXPANSION

:updatemx
title CMDBIOS T[%tab%] %cItem%
rem for /f "tokens=3" %%A in ('reg query HKCU\Console /v WindowSize') do set /a window_height=%%A/65535
goto determinetab

:tabupdate

if /I "%iBackground%" EQU "on" (
   set pageback=%inverse%
)
if /I "%iBackground%" EQU "off" (
   set pageback=%background%
)

if "%tab%"=="1" (
  set "c1r=[%inverse%"
  set "c1l=%clear%%background%]"
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r= "
  set "c5l= "
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="2" (
  set "c1r= "
  set "c1l= "
  set "c2r=[%inverse%"
  set "c2l=%clear%%background%]"
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r= "
  set "c5l= "
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="3" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r=[%inverse%"
  set "c3l=%clear%%background%]"
  set "c4r= "
  set "c4l= "
  set "c5r= "
  set "c5l= "
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="4" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r=[%inverse%"
  set "c4l=%clear%%background%]"
  set "c5r= "
  set "c5l= "
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="5" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r=[%inverse%"
  set "c5l=%clear%%background%]"
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="6" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r= "
  set "c5l= "
  set "c6r=[%inverse%"
  set "c6l=%clear%%background%]"
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="7" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r= "
  set "c5l= "
  set "c6r= "
  set "c6l= "
  set "c7r=[%inverse%"
  set "c7l=%clear%%background%]"
)
if "%tab%"=="11" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r=[%inverse%"
  set "c5l=%clear%%background%]"
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="12" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r=[%inverse%"
  set "c5l=%clear%%background%]"
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="13" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r=[%inverse%"
  set "c5l=%clear%%background%]"
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
if "%tab%"=="90" (
  set "c1r= "
  set "c1l= "
  set "c2r= "
  set "c2l= "
  set "c3r= "
  set "c3l= "
  set "c4r= "
  set "c4l= "
  set "c5r= "
  set "c5l= "
  set "c6r= "
  set "c6l= "
  set "c7r= "
  set "c7l= "
)
for /l %%x in (1, 1, 20) do (
   if NOT "%cItem%" == "item%%x" (
     set item%%x=%doublespace%
   )
   if "%cItem%" == "item%%x" (
     set item%%x=%pointerspace%
   )
)


goto menubar

:menubar
cls
rem batbox.exe /g 0 0
echo %clear%%background%⌬  CMDBIOS %biosversion%    ⤷ select menu  +/- change value  ↑/↓ switch item  ←/→ switch tab  ⌫  go back
echo   %c1r%Main%c1l%    %c2r%Advanced%c2l%    %c3r%Power%c3l%    %c4r%Boot%c4l%    %c5r%Hardware%c5l%    %c6r%Security%c6l%    %c7r%Exit%c7l%    [%tab%]
if /I "%tab%" EQU "0" (
    goto help
)
if /I "%tab%" EQU "1" (
    goto mainmenu
)
if /I "%tab%" EQU "2" (
    goto advancedtab
)
if /I "%tab%" EQU "3" (
    goto powertab
)
if /I "%tab%" EQU "4" (
    goto boottab
)
if /I "%tab%" EQU "5" (
    goto hardwaretab
)
if /I "%tab%" EQU "6" (
  goto securitytab
)
if /I "%tab%" EQU "7" (
  goto exittab
)
if /I "%tab%" EQU "8" (
  goto fanmenu
)
if /I "%tab%" EQU "9" (
  goto powerupcontrol
)
if /I "%tab%" EQU "10" (
  goto hardwaremonitor
)

if /I "%tab%" EQU "11" (
  goto chipconfig
)

if /I "%tab%" EQU "12" (
  goto iodevconfig
)

if /I "%tab%" EQU "13" (
  goto pcieconfig
)
if /I "%tab%" EQU "14" (
  goto diskconfig
)
if /I "%tab%" EQU "90" (
  goto propreties
)
::for /f "delims=" %%a in ('"BatBox.exe" -key') do set key=%%a

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /m') DO (
SET _Click=%%C
SET _Y=%%B
SET _X=%%A
)


:mainmenu
echo %pageback%
echo   BIOS Core Version              %biosversion%
echo   BIOS ACI Key                   %hash%
echo.
echo %item1%System Time                    [%time%]
echo %item2%System Date                    [%date%]
echo.
echo %item3%System Language                [%language%]
echo.
echo %item4%UI Color Scheme                [%uicolor%]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:advancedtab
echo %pageback%
echo %item1%BIOS Update                    [%biosupdate%]
echo %item2%PS/2 Mouse Function Control    [%ps2mfc%]
echo %item3%USB Legacy Support             [%usblegacy%]
echo %item4%OS/2 Onboard Memory ^> 64 M     [%os2mem%]
echo %item5%Halt On                        [%halton%]
echo %item6%Installed Memory               %meminstalled%
echo %item7%XMP Profile                    [%xmpprofile%]
echo.
echo %item8%Fan Configuration
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:powertab
echo %pageback%

echo %item1%Power Management               [%powman%]
echo %item2%ACPI Function                  [%acpif%]
echo %item3%ACPI Suspend Type              [%acpisust%]
echo %item4%Video Off Option               [%videooffoption%]
echo %item5%Video Off Method               [%vidoffmethod%]
echo %item6%HDD Power Down                 [%hddpowerdn%]
echo %item7%Suspend-RAM Capability         [%ramsuscap%]
echo.
echo %item8%Suspend Mode                   [%susmode%]
echo %item9%PWR Button ^< 4 Secs            [%pbtnfour%]
echo.
echo %item10%CPU Thermal Option             [%cputherm%]
echo %item11%CPU Power Limit                [%cpupowlim%]
echo %item12%CPU Thermal Shutdown           [%cputs%]
echo.
echo %item13%Power Up Control
echo %item14%Hardware Monitor
echo.
echo.
echo.
echo.
echo %btmbar%

goto updatemx

:boottab
echo %pageback%
echo %item1%Boot NumLock State              [%bootnl%]
echo %item2%Fast Boot                       [%fastbt%]
echo.
echo %item3%1. %bootpriority%                         [Kingston NV2 SNV2S/250G]
echo %item4%2. %boot2%                          [None]
echo %item5%3. %boot3%                      [I219-V]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:hardwaretab
echo %pageback%
echo %item1%CPU Speed                       [%bclk% Mhz]
echo %item2%CPU Boost Speed                 [%boostclk% Mhz]
echo %item3%CPU: System Frequency Multiple  [%csfm% x]
echo %item4%Intel VT-x                      [%ivtx%]
echo %item5%Hyper-Threading                 [%hyperthread%]
echo %item6%System/PCIe Frequency (Mhz)     [%spciratio%]
echo %item7%PCIe Frequency (Mhz)            [%pciefreq%]
echo %item8%Load Performance Setting        [%loadperf%]
echo %item9%CPU Vcore                       [%cpuVcoreVoltage%V]
echo %item10%PCH +1.0V                       [%pchVoltage%V]
echo %item11%CPU Level 1 Cache               [%cpuL1Enb%]
echo %item12%CPU Level 2 Cache               [%cpuL2Enb%]
echo %item13%CPU Level 3 Cache               [%cpuL3Enb%]
echo %item14%CPU Level 2 Cache ECC Check     [%cpuL2ECCEnb%]
echo.
echo %item15%Chipset Configuration
echo %item16%I/O Device Configuration
echo %item17%PCIe Configuration
echo %item18%Disk Configuration
echo.
echo.
echo %btmbar%
goto updatemx

:securitytab
echo %pageback%
echo %item1%Supervisor Password             [%isSuperPass%]
echo %item2%User Password                   [%isUserPass%]
echo.
echo %item3%Secure Boot                     [%secBoot%]
echo %item4%TPM 2.0                         [%tpm2In%]
echo.
echo %item5%Intel SGX                       [%intlsgx%]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:exittab
echo %pageback%
echo %item1%Save and Exit                   F10
echo %item2%Discard and Exit                None
echo %item3%Save                            None
echo %item4%Discard                         None
echo %item5%Exit                            ESC
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx


:chipconfig

echo %pageback%
echo %item1%eMMC Support                    [%emmcOK%]
echo %item2%eMMC Max Speed                  [%emmcSpeed%]
echo.
echo %item3%Onboard LAN1                    [%onlan1%]
echo %item4%Onboard LAN2                    [%onlan2%]
echo %item5%Wake on LAN1                    [%wlan1%]
echo %item6%Wake on LAN2                    [%wlan2%]
echo.
echo %item7%Restore on Power Loss           [%restorePL%]
echo.
echo %item8%System BIOS Cacheable           [%sysbioscache%]
echo %item9%Video BIOS Cacheable            [%vidbioscache%]
echo.
echo %item10%RAM Frequency                   [%ramfreq%]
echo.
echo %item11%Integrated Wifi                 [%iWIFI%]
echo %item12%FAN Autocontrol                 [%fanAC%]
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx


:iodevconfig
echo %pageback%
echo %item1%Onboard Audio                   [%onbaudio%]
echo.
echo %item2%Onboard BT                      [%onbbt%]
echo %item3%Onboard Wifi                    [%onbwifi%]
echo.
echo %item4%Onboard Serial                  [%onbserial%]
echo %item5%Onboard Serial Mode             [%onbserialmode%]
echo.
echo %item6%PS/2 Port Support               [%ps2supp%]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx


:pcieconfig
echo %pageback%
echo %item1%PCIe Speed                      [%pciespeed%]
echo %item2%PCIe ASPM                       [%pcieaspm%]
echo.
echo %item3%A/V Card Priority               [%avcardpri%]
echo.
echo   PCIe Lane Speeds
echo    %item4%Lane 1-16                    [%pcielane116spd%]
echo    %item5%Lane 17-20                   [%pcielane1720spd%]
echo    %item6%Lane 21-24                   [%pcielane2124spd%]
echo    %item7%Lane 25                      [%pcielane25spd%]
echo    %item8%Lane 26                      [%pcielane26spd%]
echo.
echo   PCIe Slot Enable/Disable
echo    %item9%Slot 1 (x16)                 [%pcieslt1enb%]
echo    %item10%Slot 2 (x4)                  [%pcieslt2enb%]
echo    %item11%Slot 3 (x4)                  [%pcieslt3enb%]
echo    %item12%Slot 4 (x1)                  [%pcieslt4enb%]
echo    %item13%Slot 5 (x1)                  [%pcieslt5enb%]
echo.
echo %item14%PCIe Lane Bifurcation           [%pcielanebifur%]
echo.
echo %btmbar%

goto updatemx

:powerupcontrol
echo %pageback%
echo %item1%Power On Method                 [%poweronmthd%]
echo %item2%Intel SpeedStep                 [%intspeedstep%]
echo %item3%CPU C-State Support             [%cpucstate%]
echo.
echo %item4%S3 Power Management             [%s3powman%]
echo %item5%S4 Power Management             [%s4powman%]
echo.
echo %item6%Boot Performance Mode           [%bootperfmode%]
echo %item7%Onboard Device Power Control    [%onbdevpowcon%]
echo %item8%POST Delay                      [%pdelay%]
echo %item9%Automatic System Power-On       [%aspo%]
echo.
echo %item10%Power Button Behavior           [%pwrbtnbehav%]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:hardwaremonitor
echo %pageback%
echo %item1%None
echo %item2%None
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:fanmenu
echo %pageback%
echo   Fan Control
echo     %item1%CPU FAN 1/WP 1              [%CPUFAN1%]
echo     %item2%CPU FAN 1/WP 1 MODE         [%CPUFAN1MODE%]
echo     %item3%CHA FAN 1                   [%CHAFAN1%]
echo     %item4%CHA FAN 1 MODE              [%CHAFAN1MODE%]
echo     %item5%CHA FAN 2                   [%CHAFAN2%]
echo     %item6%CHA FAN 2 MODE              [%CHAFAN2MODE%]
echo     %item7%CHA FAN 3                   [%CHAFAN3%]
echo     %item8%CHA FAN 3 MODE              [%CHAFAN3MODE%]
echo     %item9%CHA FAN 4                   [%CHAFAN4%]
echo     %item10%CHA FAN 4 MODE              [%CHAFAN4MODE%]
echo.
echo %item11%Fan Fail Warning                [%fanFailWarning%]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%

goto updatemx

:diskconfig
echo %pageback%
echo %item1%SATA Mode                       [%satamode%]
echo %item2%NVMe Configuration              [%nvmeconfig%]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%

goto updatemx

:propreties
echo %pageback%
echo.
echo - - - - - - - - BIOS Propreties Secret Menu - - - - - - - -
echo.
echo.
echo File Var 1:%1
echo File Var 2:%2
echo File Var 3:%3
echo.
echo HASH:%hash%
echo.
echo TAB ITEM CSM BCKGD
echo %tab%:%cItem%:%currentScreenMode%:%iBackground%
echo.
echo Most Recent Keypress
echo 1 - %keyinput%
echo 2 - %keyinput2%
echo 3 - %keyinput3%
echo 4 - %keyinput4%
echo 5 - %keyinput5%
echo.
echo.
echo %btmbar%
goto updatemx

:help
echo %pageback%
echo.
echo ------------------------------------- CMDBIOS HELP Menu -------------------------------------
echo.
echo.
echo                 ____˅
echo Current Cursor: ^|%item1%^|
echo  [P] to change
echo  cursor
echo.
echo.
echo.
echo [I]          Change Background
echo [H]          Help Menu
echo [SHIFT + `]  Fullscreen/Windowed
echo [R]          Refresh-Reset
echo.
echo.
echo.
echo.
echo.
echo.
echo %btmbar%
goto updatemx

:determinetab
set keyinput5=%keyinput4%
set keyinput4=%keyinput3%
set keyinput3=%keyinput2%
set keyinput2=%keyinput%
batbox.exe /k
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
echo keypress,%errorlevel%,KeypressReg,blue,I,%datestamp%,%timestamp%,%random%%random%%random%%random%;>events.txt
set currenttab=%tab%
set keyinput=%errorlevel%
if /I "%keyinput%" EQU "9009" (
set "cause=batbox.exe /k"
set "errfunc=determinetab"
set "errline=797"
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "7" (
    if /I "%cItem%" EQU "item1" (
      (
      echo set hash=
      echo set "doublespace=  "
      echo set "pointerspace=- "
      echo set "pointerspace=➤ "
      echo set cItem=item1
      echo ::::::::::::::::::::
      echo ::General Choices
      echo ::::::::::::::::::::
      echo ::Enable/Disable
      echo set enabledisable_0=Disabled
      echo set enabledisable_1=Enabled
      echo set onoff_0=Off
      echo set onoff_1=On
      echo ::::::::::::::::::::::::::
      echo ::General/Misc Variables
      echo ::::::::::::::::::::::::::
      echo set secBoot=%secBoot%
      echo set iBackground=%iBackground%
      echo set clear=%clear%
      echo set inverse=%inverse%
      echo set pageback=%background%
      echo ::BIOS
      echo set sysbioscache=%sysbioscache%
      echo set vidbioscache=%vidbioscache%
      echo set hash=%hash%
      echo set biosupdate=%biosupdate%
      echo set biosversion=%biosversion%
      echo set bootpriority=%bootpriority%
      echo set boot2=%boot2%
      echo set boot3=%boot3%
      echo set basepath=%basepath%
      echo set biospath=%~dp0\
      echo set language=%language%
      echo set isSuperPass=%isSuperPass%
      echo set isUserPass=%isUserPass%
      echo set bootnl=%bootnl%
      echo set fastbt=%fastbt%
      echo set halton=%halton%
      echo set "videooffoption=%videooffoption%"
      echo set vidoffmethod=%vidoffmethod%
      echo set hddpowerdn=%hddpowerdn%
      echo set ramsuscap=%ramsuscap%
      echo ::CPU
      echo set cpuVcoreVoltage=%cpuVcoreVoltage%
      echo set cpuL1Enb=%cpuL1Enb%
      echo set cpuL2Enb=%cpuL2Enb%
      echo set cpuL2ECCEnb=%cpuL2ECCEnb%
      echo set cpuL3Enb=%cpuL3Enb%
      echo set bclk=%bclk%
      echo set boostclk=%boostclk%
      echo set csfm=%csfm%
      echo set susmode=%susmode%
      echo set pbtnfour=%pbtnfour%
      echo set cputherm=%cputherm%
      echo set cpupowlim=%cpupowlim%
      echo set cputs=%cputs%
      echo set ivtx=%ivtx%
      echo set hyperthread=%hyperthread%
      echo set loadperf=%loadperf%
      echo ::CHIPSET
      echo set pchVoltage=%pchVoltage%
      echo ::MEM
      echo set meminstalled=%meminstalled%
      echo set xmpprofile=%xmpprofile%
      echo set os2mem=%os2mem%
      echo set ramfreq=%ramfreq%
      echo ::IO
      echo set ps2mfc=%ps2mfc%
      echo set usblegacy=%usblegacy%
      echo set onbaudio=%onbaudio%
      echo set onbserial=%onbserial%
      echo set onbserialmode=%onbserialmode%
      echo set ps2supp=%ps2supp%
      echo ::PCIE
      echo set spciratio=%spciratio%
      echo set pciefreq=%pciefreq%
      echo set pciespeed=%pciespeed%
      echo set pcieaspm=%pcieaspm%
      echo set avcardpri=%avcardpri%
      echo set pcielane116spd=%pcielane116spd%
      echo set pcielane1720spd=%pcielane1720spd%
      echo set pcielane2124spd=%pcielane2124spd%
      echo set pcielane25spd=%pcielane25spd%
      echo set pcielane26spd=%pcielane26spd%
      echo set pcieslt1enb=%pcieslt1enb%
      echo set pcieslt2enb=%pcieslt2enb%
      echo set pcieslt3enb=%pcieslt3enb%
      echo set pcieslt4enb=%pcieslt4enb%
      echo set pcieslt5enb=%pcieslt5enb%
      echo set pcielanebifur=%pcielanebifur%
      echo ::NET
      echo set onlan1=%onlan1%
      echo set onlan2=%onlan2%
      echo set wlan1=%wlan1%
      echo set wlan2=%wlan2%
      echo set onbbt=%onbbt%
      echo set onbwifi=%onbwifi%
      echo ::DISK
      echo set satamode=%satamode%
      echo set nvmeconfig=%nvmeconfig%
      echo ::POWER
      echo set acpif=%acpif%
      echo set acpisust=%acpisust%
      echo set powman=%powman%
      echo set restorePL=%restorePL%
      echo set poweronmthd=%poweronmthd%
      echo set intspeedstep=%intspeedstep%
      echo set cpucstate=%cpucstate%
      echo set s3powman=%s3powman%
      echo set s4powman=%s4powman%
      echo set bootperfmode=%bootperfmode%
      echo set onbdevpowcon=%onbdevpowcon%
      echo set pdelay=%pdelay%
      echo set aspo=%aspo%
      echo set pwrbtnbehav=%pwrbtnbehav%
      echo ::FAN
      echo set fan_mode_1=Silent
      echo set fan_mode_2=Normal
      echo set fan_mode_3=Performance
      echo set fan_mode_4=Full Speed
      echo set fan_c_mode_1=PWM
      echo set fan_c_mode_2=DC
      echo set CPUFAN1=%CPUFAN1%
      echo set CPUFAN1MODE=%CPUFAN1MODE%
      echo set CHAFAN1=%CHAFAN1%
      echo set CHAFAN1MODE=%CHAFAN1MODE%
      echo set CHAFAN2=%CHAFAN2%
      echo set CHAFAN2MODE=%CHAFAN2MODE%
      echo set CHAFAN3=%CHAFAN3%
      echo set CHAFAN3MODE=%CHAFAN3MODE%
      echo set CHAFAN4=%CHAFAN4%
      echo set CHAFAN4MODE=%CHAFAN4MODE%
      echo set fanFailWarning=%fanFailWarning%
      echo ::SECURITY
      echo set tpm2in=%tpm2in%
      echo set intlsgx=%intlsgx%
      ) >%~dp0/biosvars.bat
      timeout -t 2
      exit
    )
  )
)
if /I "%keyinput%" EQU "332" (
  if /I "%tab%" EQU "1" (
    set tab=2
  )
  if /I "%tab%" EQU "2" (
      set tab=3
  )
  if /I "%tab%" EQU "3" (
      set tab=4
  )
  if /I "%tab%" EQU "4" (
      set tab=5
  )
  if /I "%tab%" EQU "5" (
      set tab=6
  )
  if /I "%tab%" EQU "6" (
      set tab=7
  )
)
if /I "%keyinput%" EQU "330" (
  if /I "%tab%" EQU "2" (
    set tab=1
  )
  if /I "%tab%" EQU "3" (
      set tab=2
  )
  if /I "%tab%" EQU "4" (
      set tab=3
  )
  if /I "%tab%" EQU "5" (
      set tab=4
  )
  if /I "%tab%" EQU "6" (
      set tab=5
  )
  if /I "%tab%" EQU "7" (
      set tab=6
  )
)

if /I "%keyinput%" EQU "327" (
  if /I "%cItem%" EQU "item2" (
      set cItem=item1
  )
  if /I "%cItem%" EQU "item3" (
      set cItem=item2
  )
  if /I "%cItem%" EQU "item4" (
      set cItem=item3
  )
  if /I "%cItem%" EQU "item5" (
      set cItem=item4
  )
  if /I "%cItem%" EQU "item6" (
      set cItem=item5
  )
  if /I "%cItem%" EQU "item7" (
      set cItem=item6
  )
  if /I "%cItem%" EQU "item8" (
      set cItem=item7
  )
  if /I "%cItem%" EQU "item9" (
      set cItem=item8
  )
  if /I "%cItem%" EQU "item10" (
      set cItem=item9
  )
  if /I "%cItem%" EQU "item11" (
      set cItem=item10
  )
  if /I "%cItem%" EQU "item12" (
      set cItem=item11
  )
  if /I "%cItem%" EQU "item13" (
      set cItem=item12
  )
  if /I "%cItem%" EQU "item14" (
      set cItem=item13
  )
  if /I "%cItem%" EQU "item15" (
      set cItem=item14
  )
  if /I "%cItem%" EQU "item16" (
        set cItem=item15
  )
  if /I "%cItem%" EQU "item17" (
        set cItem=item16
  )
  if /I "%cItem%" EQU "item18" (
        set cItem=item17
  )
)
if /I "%keyinput%" EQU "335" (
  if /I "%cItem%" EQU "item1" (
      set cItem=item2
  )
  if /I "%cItem%" EQU "item2" (
      set cItem=item3
  )
  if /I "%cItem%" EQU "item3" (
      set cItem=item4
  )
  if /I "%cItem%" EQU "item4" (
      set cItem=item5
  )
  if /I "%cItem%" EQU "item5" (
      set cItem=item6
  )
  if /I "%cItem%" EQU "item6" (
      set cItem=item7
  )
  if /I "%cItem%" EQU "item7" (
      set cItem=item8
  )
  if /I "%cItem%" EQU "item8" (
      set cItem=item9
  )
  if /I "%cItem%" EQU "item9" (
      set cItem=item10
  )
  if /I "%cItem%" EQU "item10" (
      set cItem=item11
  )
  if /I "%cItem%" EQU "item11" (
      set cItem=item12
  )
  if /I "%cItem%" EQU "item12" (
      set cItem=item13
  )
  if /I "%cItem%" EQU "item13" (
      set cItem=item14
  )
  if /I "%cItem%" EQU "item14" (
      set cItem=item15
  )
  if /I "%cItem%" EQU "item15" (
        set cItem=item16
  )
  if /I "%cItem%" EQU "item16" (
        set cItem=item17
  )
  if /I "%cItem%" EQU "item17" (
        set cItem=item18
  )

)

if /I "%currenttab%" NEQ "%tab%" (
        set cItem=item1
)

if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item15" (
      set tab=11
      set cItem=item1
    )
  )
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item16" (
      set tab=12
      set cItem=item1
    )
  )
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item17" (
      set tab=13
      set cItem=item1
    )
  )
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item18" (
      set tab=14
      set cItem=item1
    )
  )
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item13" (
      set tab=9
      set cItem=item1
    )
  )
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item14" (
      set tab=10
      set cItem=item1
    )
  )
)
if /I "%keyinput%" EQU "13" (
  if /I "%tab%" EQU "2" (
    if /I "%cItem%" EQU "item8" (
      set tab=8
      set cItem=item1
    )
  )
)

if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "11" (
    set tab=5
  )
)
if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "12" (
    set tab=5
  )
)
if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "13" (
    set tab=5
  )
)
if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "8" (
    set tab=2
  )
)
if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "9" (
    set tab=3
  )
)
if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "10" (
    set tab=3
  )
)
if /I "%keyinput%" EQU "8" (
  if /I "%tab%" EQU "14" (
    set tab=5
  )
)
if /I "%keyinput%" EQU "27" (
  exit
)

if /I "%keyinput%" EQU "" (
  cls
  echo %keyinput%
  timeout -t 2
  cls
  goto tabupdate
)
if /I "%keyinput%" EQU "104" (
    set tab=0
    goto tabupdate
)
if /I "%keyinput%" EQU "8" (
    if /I "%tab%" EQU "0" (
        set tab=1
        goto tabupdate
    )
)

if /I "%keyinput%" EQU "9009" (
  goto dependencyerror
)

if /I "%keyinput%" EQU "126" (
    if "%currentScreenMode%" EQU "F" (
        batbox.exe /f 1
        set currentScreenMode=W
        goto tabupdate
    )
    if "%currentScreenMode%" EQU "W" (
        batbox.exe /f 0
        set currentScreenMode=F
        goto tabupdate
    )
)
if /I "%keyinput%" EQU "105" (
    if "%iBackground%" EQU "off" (
        set iBackground=on
        goto tabupdate
    )
    if "%iBackground%" EQU "on" (
        set iBackground=off
        goto tabupdate
    )
)

if /I "%keyinput%" EQU "114" (
    cls
    echo %keyinput%
    echo timeout reset triggered
    echo %tab%:%cItem%:%currentScreenMode%:%iBackground%
    timeout -t 2
    cls
    goto tabupdate
)

if /I "%keyinput%" EQU "1" (
    set tab=90
    goto tabupdate
)
if /I "%keyinput%" EQU "0" (
    if /I "%tab%" EQU "90" (
        set tab=1
    )
)


if /I "%keyinput%" EQU "43" (
rem  +
    goto valuechange
)
if /I "%keyinput%" EQU "61" (
rem  +
    set keyinput=43
    goto valuechange
)
if /I "%keyinput%" EQU "45" (
rem  -
    goto valuechange
)
if /I "%keyinput%" EQU "112" (
    if /I "%pointerspace%" EQU "➤ " (
        set "pointerspace=➤  "
    )
    if /I "%pointerspace%" EQU "➤  " (
        set "pointerspace=~ "
    )
    if /I "%pointerspace%" EQU "~ " (
        set "pointerspace=##"
        set "doublespace=\ "
    )
    if /I "%pointerspace%" EQU "##" (
        set "pointerspace=- "
        set "doublespace=  "
    )
    if /I "%pointerspace%" EQU "- " (
        set "pointerspace=Δ "
    )
    if /I "%pointerspace%" EQU "Δ " (
        set "pointerspace=➤ "
    )
)

goto tabupdate





:valuechange

if /I "%tab%" EQU "2" (
    if /I "%cItem%" EQU "item1" (
        if /I "%keyinput%" EQU "43" (
            if /I "%biosupdate%" EQU "Disabled" (
                set biosupdate=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%biosupdate%" EQU "Enabled" (
                set biosupdate=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item2" (
        if /I "%keyinput%" EQU "43" (
            if /I "%ps2mfc%" EQU "Auto" (
                set ps2mfc=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%ps2mfc%" EQU "Enabled" (
                set ps2mfc=Auto
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item3" (
        if /I "%keyinput%" EQU "43" (
            if /I "%usblegacy%" EQU "Disabled" (
                set usblegacy=Auto
                goto tabupdate
            )
            if /I "%usblegacy%" EQU "Auto" (
                set usblegacy=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%usblegacy%" EQU "Enabled" (
                set usblegacy=Auto
                goto tabupdate
            )
            if /I "%usblegacy%" EQU "Auto" (
                set usblegacy=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item4" (
        if /I "%keyinput%" EQU "43" (
            if /I "%os2mem%" EQU "Disabled" (
                set os2mem=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%os2mem%" EQU "Enabled" (
                set os2mem=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item7" (
        if /I "%keyinput%" EQU "43" (
            if /I "%xmpprofile%" EQU "Disabled" (
                set xmpprofile=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%xmpprofile%" EQU "Enabled" (
                set xmpprofile=Disabled
                goto tabupdate
            )
        )
    )
)
if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item1" (
        if /I "%keyinput%" EQU "43" (
            if /I "%powman%" EQU "Auto" (
                set powman=User-Define
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%powman%" EQU "User-Define" (
                set powman=Auto
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item2" (
        if /I "%keyinput%" EQU "43" (
            if /I "%acpif%" EQU "Disabled" (
                set acpif=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%acpif%" EQU "Enabled" (
                set acpif=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item3" (
        if /I "%keyinput%" EQU "43" (
            if /I "%acpisust%" EQU "S1" (
                set acpisust=S3
                goto tabupdate
            )
            if /I "%acpisust%" EQU "S3" (
                set acpisust=S1+S3
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%acpisust%" EQU "S1+S3" (
                set acpisust=S3
                goto tabupdate
            )
            if /I "%acpisust%" EQU "S3" (
                set acpisust=S1
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item6" (
        if /I "%keyinput%" EQU "43" (
            if /I "%hddpowerdn%" EQU "Disabled" (
                set hddpowerdn=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%hddpowerdn%" EQU "Enabled" (
                set hddpowerdn=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item7" (
        if /I "%keyinput%" EQU "43" (
            if /I "%ramsuscap%" EQU "Disabled" (
                set ramsuscap=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%ramsuscap%" EQU "Enabled" (
                set ramsuscap=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item8" (
        if /I "%keyinput%" EQU "43" (
            if /I "%susmode%" EQU "Disabled" (
                set susmode=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%susmode%" EQU "Enabled" (
                set susmode=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item9" (
        if /I "%keyinput%" EQU "43" (
            if /I "%pbtnfour%" EQU "Soft Off" (
                set pbtnfour=Full Off
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%pbtnfour%" EQU "Full Off" (
                set pbtnfour=Soft Off
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item10" (
        if /I "%keyinput%" EQU "43" (
            if /I "%cputherm%" EQU "Disabled" (
                set cputherm=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%cputherm%" EQU "Enabled" (
                set cputherm=Disabled
                goto tabupdate
            )
        )
    )
)
if /I "%tab%" EQU "4" (
    if /I "%cItem%" EQU "item1" (
        if /I "%keyinput%" EQU "43" (
            if /I "%bootnl%" EQU "Off" (
                set bootnl=On
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%bootnl%" EQU "On" (
                set bootnl=Off
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item2" (
        if /I "%keyinput%" EQU "43" (
            if /I "%fastbt%" EQU "Off" (
                set fastbt=On
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%fastbt%" EQU "On" (
                set fastbt=Off
                goto tabupdate
            )
        )
    )
)
if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item4" (
        if /I "%keyinput%" EQU "43" (
            if /I "%ivtx%" EQU "Off" (
                set ivtx=On
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%ivtx%" EQU "On" (
                set ivtx=Off
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item5" (
        if /I "%keyinput%" EQU "43" (
            if /I "%hyperthread%" EQU "Disabled" (
                set hyperthread=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%hyperthread%" EQU "Enabled" (
                set hyperthread=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item8" (
        if /I "%keyinput%" EQU "43" (
            if /I "%loadperf%" EQU "Normal" (
                set loadperf=Performance
                goto tabupdate
            )
            if /I "%loadperf%" EQU "Performance" (
                set loadperf=Turbo
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%loadperf%" EQU "Turbo" (
                set loadperf=Performance
                goto tabupdate
            )
            if /I "%loadperf%" EQU "Performance" (
                set loadperf=Normal
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item11" (
        if /I "%keyinput%" EQU "43" (
            if /I "%cpuL1Enb%" EQU "Disabled" (
                set cpuL1Enb=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%cpuL1Enb%" EQU "Enabled" (
                set cpuL1Enb=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item12" (
        if /I "%keyinput%" EQU "43" (
            if /I "%cpuL2Enb%" EQU "Disabled" (
                set cpuL2Enb=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%cpuL2Enb%" EQU "Enabled" (
                set cpuL2Enb=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item13" (
        if /I "%keyinput%" EQU "43" (
            if /I "%cpuL3Enb%" EQU "Disabled" (
                set cpuL3Enb=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%cpuL3Enb%" EQU "Enabled" (
                set cpuL3Enb=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item14" (
        if /I "%keyinput%" EQU "43" (
            if /I "%cpuL2ECCEnb%" EQU "Disabled" (
                set cpuL2ECCEnb=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%cpuL2ECCEnb%" EQU "Enabled" (
                set cpuL2ECCEnb=Disabled
                goto tabupdate
            )
        )
    )
)
if /I "%tab%" EQU "6" (
    if /I "%cItem%" EQU "item3" (
        if /I "%keyinput%" EQU "43" (
            if /I "%secBoot%" EQU "Disabled" (
                set secBoot=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%secBoot%" EQU "Enabled" (
                set secBoot=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item4" (
        if /I "%keyinput%" EQU "43" (
            if /I "%tpm2In%" EQU "Disabled" (
                set tpm2In=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%tpm2In%" EQU "Enabled" (
                set tpm2In=Disabled
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item5" (
        if /I "%keyinput%" EQU "43" (
            if /I "%intlsgx%" EQU "Disabled" (
                set intlsgx=Enabled
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%intlsgx%" EQU "Enabled" (
                set intlsgx=Disabled
                goto tabupdate
            )
        )
    )
)
if /I "%tab%" EQU "8" (
    if /I "%cItem%" EQU "item1" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CPUFAN1%" EQU "%fan_mode_1%" (
                set CPUFAN1=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CPUFAN1%" EQU "%fan_mode_2%" (
                set CPUFAN1=%fan_mode_3%
                goto tabupdate
            )
            if /I "%CPUFAN1%" EQU "%fan_mode_3%" (
                set CPUFAN1=%fan_mode_4%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CPUFAN1%" EQU "%fan_mode_2%" (
                set CPUFAN1=%fan_mode_1%
                goto tabupdate
            )
            if /I "%CPUFAN1%" EQU "%fan_mode_3%" (
                set CPUFAN1=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CPUFAN1%" EQU "%fan_mode_4%" (
                set CPUFAN1=%fan_mode_3%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item2" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CPUFAN1MODE%" EQU "%fan_c_mode_1%" (
                set CPUFAN1MODE=%fan_c_mode_2%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CPUFAN1MODE%" EQU "%fan_c_mode_2%" (
                set CPUFAN1MODE=%fan_c_mode_1%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item3" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN1%" EQU "%fan_mode_1%" (
                set CHAFAN1=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN1%" EQU "%fan_mode_2%" (
                set CHAFAN1=%fan_mode_3%
                goto tabupdate
            )
            if /I "%CHAFAN1%" EQU "%fan_mode_3%" (
                set CHAFAN1=%fan_mode_4%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN1%" EQU "%fan_mode_2%" (
                set CHAFAN1=%fan_mode_1%
                goto tabupdate
            )
            if /I "%CHAFAN1%" EQU "%fan_mode_3%" (
                set CHAFAN1=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN1%" EQU "%fan_mode_4%" (
                set CHAFAN1=%fan_mode_3%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item4" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN1MODE%" EQU "%fan_c_mode_1%" (
                set CHAFAN1MODE=%fan_c_mode_2%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN1MODE%" EQU "%fan_c_mode_2%" (
                set CHAFAN1MODE=%fan_c_mode_1%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item5" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN2%" EQU "%fan_mode_1%" (
                set CHAFAN2=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN2%" EQU "%fan_mode_2%" (
                set CHAFAN2=%fan_mode_3%
                goto tabupdate
            )
            if /I "%CHAFAN2%" EQU "%fan_mode_3%" (
                set CHAFAN2=%fan_mode_4%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN2%" EQU "%fan_mode_2%" (
                set CHAFAN2=%fan_mode_1%
                goto tabupdate
            )
            if /I "%CHAFAN2%" EQU "%fan_mode_3%" (
                set CHAFAN2=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN2%" EQU "%fan_mode_4%" (
                set CHAFAN2=%fan_mode_3%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item6" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN2MODE%" EQU "%fan_c_mode_1%" (
                set CHAFAN2MODE=%fan_c_mode_2%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN2MODE%" EQU "%fan_c_mode_2%" (
                set CHAFAN2MODE=%fan_c_mode_1%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item7" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN3%" EQU "%fan_mode_1%" (
                set CHAFAN3=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN3%" EQU "%fan_mode_2%" (
                set CHAFAN3=%fan_mode_3%
                goto tabupdate
            )
            if /I "%CHAFAN3%" EQU "%fan_mode_3%" (
                set CHAFAN3=%fan_mode_4%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN3%" EQU "%fan_mode_2%" (
                set CHAFAN3=%fan_mode_1%
                goto tabupdate
            )
            if /I "%CHAFAN3%" EQU "%fan_mode_3%" (
                set CHAFAN3=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN3%" EQU "%fan_mode_4%" (
                set CHAFAN3=%fan_mode_3%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item8" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN3MODE%" EQU "%fan_c_mode_1%" (
                set CHAFAN3MODE=%fan_c_mode_2%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN3MODE%" EQU "%fan_c_mode_2%" (
                set CHAFAN3MODE=%fan_c_mode_1%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item9" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN4%" EQU "%fan_mode_1%" (
                set CHAFAN4=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN4%" EQU "%fan_mode_2%" (
                set CHAFAN4=%fan_mode_3%
                goto tabupdate
            )
            if /I "%CHAFAN4%" EQU "%fan_mode_3%" (
                set CHAFAN4=%fan_mode_4%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN4%" EQU "%fan_mode_2%" (
                set CHAFAN4=%fan_mode_1%
                goto tabupdate
            )
            if /I "%CHAFAN4%" EQU "%fan_mode_3%" (
                set CHAFAN4=%fan_mode_2%
                goto tabupdate
            )
            if /I "%CHAFAN4%" EQU "%fan_mode_4%" (
                set CHAFAN4=%fan_mode_3%
                goto tabupdate
            )
        )
    )
    if /I "%cItem%" EQU "item10" (
        if /I "%keyinput%" EQU "43" (
            if /I "%CHAFAN4MODE%" EQU "%fan_c_mode_1%" (
                set CHAFAN4MODE=%fan_c_mode_2%
                goto tabupdate
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%CHAFAN4MODE%" EQU "%fan_c_mode_2%" (
                set CHAFAN4MODE=%fan_c_mode_1%
                goto tabupdate
            )
        )
    )
)
if /I "%tab%" EQU "9" (
    if /I "%cItem%" EQU "item1" (
     echo.
    )
    if /I "%cItem%" EQU "item2" (
         if /I "%keyinput%" EQU "43" (
             if /I "%intspeedstep%" EQU "Disabled" (
                set intspeedstep=Enabled
             )
         )
         if /I "%keyinput%" EQU "45" (
             if /I "%intspeedstep%" EQU "Enabled" (
                set intspeedstep=Disabled
             )
         )
    )
    if /I "%cItem%" EQU "item3" (
         if /I "%keyinput%" EQU "43" (
             if /I "%cpucstate%" EQU "Disabled" (
                set cpucstate=Enabled
             )
         )
         if /I "%keyinput%" EQU "45" (
             if /I "%cpucstate%" EQU "Enabled" (
                set cpucstate=Disabled
             )
         )
    )
    if /I "%cItem%" EQU "item4" (
         if /I "%keyinput%" EQU "43" (
             if /I "%s3powman%" EQU "Disabled" (
                set s3powman=Enabled
             )
         )
         if /I "%keyinput%" EQU "45" (
             if /I "%s3powman%" EQU "Enabled" (
                set s3powman=Disabled
             )
         )
    )
    if /I "%cItem%" EQU "item5" (
         if /I "%keyinput%" EQU "43" (
             if /I "%s4powman%" EQU "Disabled" (
                set s4powman=Enabled
             )
         )
         if /I "%keyinput%" EQU "45" (
             if /I "%s4powman%" EQU "Enabled" (
                set s4powman=Disabled
             )
         )
    )
    if /I "%cItem%" EQU "item6" (
        if /I "%keyinput%" EQU "43" (
            if /I "%bootperfmode%" EQU "Disabled" (
               set bootperfmode=Normal
            )
            if /I "%bootperfmode%" EQU "Normal" (
               set bootperfmode=Performance
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%bootperfmode%" EQU "Performance" (
               set bootperfmode=Normal
            )
            if /I "%bootperfmode%" EQU "Normal" (
               set bootperfmode=Disabled
            )
        )
    )
    if /I "%cItem%" EQU "item7" (
        if /I "%keyinput%" EQU "43" (
            if /I "%onbdevpowcon%" EQU "Disabled" (
                set onbdevpowcon=Enabled
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%onbdevpowcon%" EQU "Enabled" (
                 set onbdevpowcon=Disabled
            )
        )
    )
    if /I "%cItem%" EQU "item8" (
        if /I "%keyinput%" EQU "43" (
            if /I "%pdelay%" EQU "Disabled" (
                set pdelay=Enabled
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%pdelay%" EQU "Enabled" (
                set pdelay=Disabled
            )
        )
    )
    if /I "%cItem%" EQU "item9" (
        if /I "%keyinput%" EQU "43" (
            if /I "%aspo%" EQU "Disabled" (
                set aspo=Enabled
            )
        )
        if /I "%keyinput%" EQU "45" (
            if /I "%aspo%" EQU "Enabled" (
                set aspo=Disabled
            )
        )
    )
    if /I "%cItem%" EQU "item10" (
        if /I "%keyinput%" EQU "43" (
            echo %pwrbtnbehav%
        )
    )
)


goto tabupdate

:error
cls
echo An error has occured.
pause
exit

:dependencyerror
cls
echo event: deperror, value: 9009, tag: bios, tcol: orange, prio: F, tdate: %datestamp%, tx: %timestamp% uid:%random%%random%%random%%random%;
echo.
echo event: deperror, value: 9009, tag: bios, tcol: orange, prio: F, tdate: %datestamp%, tx: %timestamp% uid:%random%%random%%random%%random%;>events.txt
for /F "tokens=2 delims==." %%I in ('%SystemRoot%\System32\wbem\wmic.exe OS GET LocalDateTime /VALUE') do set "LocalTime=%%I"
set "LocalTime=%LocalTime:~8,4%"
set dxa=%errorlevel%
echo y=msgbox("%time% dependency not found (Error %dxa%)                         cd: %~dp0", 1+16, "Fatal Error") >%~dp0\errormsg.vbs
%~dp0/errormsg.vbs
(
echo %time% func: %errfunc%
echo %time% cd: %~dp0
echo %time% %cause%
echo %time% dependency not found error [Error %dxa%]
) >%~dp0\errorfile%LocalTime%.log
echo error in line %errline%
echo error trace:
echo   %time% func: %errfunc%
echo   %time% cd: %~dp0
echo   %time% %cause%
echo   %time% dependency not found error (Error %dxa%)
echo.
echo ERROR %dxa%
echo.
echo Error: A dependency required for this
echo program to run does not currently exist.
echo.
echo Consider updating or reinstalling
echo this program to solve this issue.
echo.
echo An error log of the problem can be found
echo here: %~dp0\errorfile%LocalTime%.log
echo.
echo.
echo.
pause
echo terminating process...
ping -n 2 localhost>nul
exit


