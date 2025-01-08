@shift
@echo off
::if "%1" == "fullscreen" (
::  batbox.exe /f 0
::  if "%2" == "defaultcolor" (
::    set background=[44m
::  )
::
::)
batbox.exe /f 0
set currentScreenMode=F
if "%1" == "defaultcolor" (
  set background=[44m
)

::mode 150,40
::Default color for display is 1f, 79, 9f, 0b, 0a, or 17
:: [96m regular
:: .
set background=[96m
set uicolor=0b ANSI (ESC[96m)

echo %background%
title CMDBIOS

::if exist %cd%/hash/hash256sha.bat (
::   for /f "tokens=1 delims=" %%a in ('%cd%/hash/hash256sha.bat %cd%/bios.bat') do set hash=%%a
::)
::chcp 65001

set hash=
::for /f "tokens=*" %%a in ('powershell -command "Get-FileHash -Path '%cd%/bios.bat' -Algorithm SHA256 | Select-Object -ExpandProperty Hash"') do set "hash=%%a"
set "doublespace=  "
set "pointerspace=- "
set "pointerspace=➤ "
::set "pointerspace=➽ "
::set "pointerspace=➧ "

:: Uncomment if you want selected text to be shifted

::set "pointerspace=➤  "


::if "%1" == "spaceshift" (
::   set "pointerspace=➤  "
::)

set cItem=item1
::Main Variables
set biosversion=3.31
set bootpriority=Disk
set boot2=USB
set boot3=Network
set basepath=
set biospath=%cd%\
set language=English
set cpuVcoreVoltage=1.45
set cpuL1Enb=Enabled
set cpuL2Enb=Enabled
set cpuL2ECCEnb=Disabled
set cpuL3Enb=Enabled
set bclk=4600
set spciratio=10/100
set boostclk=5600
set csfm=2.0
set pcifreq=8000
set fastbt=On
set pchVoltage=1.0
set tpm2in=Enabled
set secBoot=Enabled
set isSuperPass=Disabled
set isUserPass=Disabled
set acpif=Enabled
set acpisust=S1
set powman=User-Define
set bootnl=On
set onlan1=Enabled
set onlan2=Enabled
set wlan1=Disabled
set wlan2=Disabled
set restorePL=Last-State
set sysbioscache=Enabled
set vidbioscache=Enabled
set iBackground=off
set clear=[0m
set inverse=[7m
set hash=2B3FB78BBDDB5E2AA8043231A2278BC7E279F33AF7D61635C31989FC21CE338D
set pageback=%background%

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



ping localhost -n 3 >nul
::Main Menu

:title
echo    ________  _______  ____  ________  _____
echo   / ____/  ¦/  / __ \/ __ )/  _/ __ \/ ___/
echo  / /   / /¦_/ / / / / __  ¦/ // / / /\__ \
echo / /___/ /  / / /_/ / /_/ // // /_/ /___/ /
echo \____/_/  /_/_____/_____/___/\____//____/ v%biosversion%
echo.
call cinderblock-small-notext.bat

setlocal ENABLEDELAYEDEXPANSION

:updatemx
title CMDBIOS T[%tab%] %cItem%
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
echo %clear%%background%#  CMDBIOS %biosversion%    ⤷ select menu  +/- change value  ↑/↓ switch item  ←/→ switch tab  ⌫  go back
echo   %c1r%Main%c1l%    %c2r%Advanced%c2l%    %c3r%Power%c3l%    %c4r%Boot%c4l%    %c5r%Hardware%c5l%    %c6r%Security%c6l%    %c7r%Exit%c7l%      %tab%   %cItem%
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
goto updatemx

:advancedtab
echo %pageback%
echo %item1%BIOS Update                    [Enabled]
echo %item2%PS/2 Mouse Function Control    [Auto]
echo %item3%USB Legacy Support             [Auto]
echo %item4%OS/2 Onboard Memory ^> 64 M     [Enabled]
echo %item5%Halt On                        [All Errors]
echo %item6%Installed Memory               8192 MB DDR4 2666
echo %item7%XMP Profile                    [Enabled]
echo.
echo %item8%Fan Configuration
goto updatemx

:powertab
echo %pageback%

echo %item1%Power Management               [%powman%]
echo %item2%ACPI Function                  [%acpif%]
echo %item3%ACPI Suspend Type              [%acpisust%]
echo %item4%Video Off Option               [Suspend ^> Off]
echo %item5%Video Off Method               [DPMS OFF]
echo %item6%HDD Power Down                 [Disabled]
echo %item7%Suspend-RAM Capability         [Disabled]
echo.
echo %item8%Suspend Mode                   [Disabled]
echo %item9%PWR Button ^< 4 Secs            [Soft Off]
echo.
echo %item10%CPU Thermal Option             [Disabled]
echo %item11%CPU Power Limit                [95W]
echo %item12%CPU Thermal Shutdown           [100C]
echo.
echo %item13%Power Up Control
echo %item14%Hardware Monitor

goto updatemx

:boottab
echo %pageback%
echo %item1%Boot NumLock State              [%bootnl%]
echo %item2%Fast Boot                       [%fastbt%]
echo.
echo %item3%1. %bootpriority%                         [Kingston NV2 SNV2S/250G]
echo %item4%2. %boot2%                          [None]
echo %item5%3. %boot3%                      [I219-V]
goto updatemx

:hardwaretab
echo %pageback%
echo %item1%CPU Speed                       [%bclk% Mhz]
echo %item2%CPU Boost Speed                 [%boostclk% Mhz]
echo %item3%CPU: System Frequency Multiple  [%csfm% x]
echo %item4%Intel VT-x / AMD-V              [On]
echo %item5%Hyper-Threading                 [Enabled]
echo %item6%System/PCIe Frequency (Mhz)     [Auto]
echo %item7%PCIe Frequency (Mhz)            [Auto]
echo %item8%Load Performance Setting        [Normal]
echo %item9%CPU Vcore                       [%cpuVcoreVoltage%V]
echo %item10%PCH +1.0V                       [%pchVoltage%V]
echo %item11%CPU Level 1 Cache               [%cpuL1Enb%]
echo %item12%CPU Level 2 Cache               [%cpuL2Enb%]
echo %item13%CPU Level 3 Cache               [%cpuL3Enb%]
echo %item14%CPU Level 2 Cache ECC Check     [%cpuL2ECCEnb%]
echo.
echo %item15%Chip Configuration
echo %item16%I/O Device Configuration
echo %item17%PCIe Configuration
echo %item18%Disk Configuration
goto updatemx

:securitytab
echo %pageback%
echo %item1%Supervisor Password             [%isSuperPass%]
echo %item2%User Password                   [%isUserPass%]
echo.
echo %item3%Secure Boot                     [%secBoot%]
echo %item4%TPM 2.0                         [%tpm2In%]
echo.
echo %item5%Intel SGX                       [Enabled]
goto updatemx

:exittab
echo %pageback%
echo %item1%Save and Exit                   F10
echo %item2%Discard and Exit                None
echo %item3%Save                            None
echo %item4%Discard                         None
echo %item5%Exit                            ESC
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
echo %item10%RAM Frequency                   [2666]
goto updatemx


:iodevconfig
echo %pageback%
echo %item1%Onboard Audio                   [Enabled]
echo.
echo %item2%Onboard BT                      [Disabled]
echo %item3%Onboard Wifi                    [Disabled]
echo.
echo %item4%Onboard Serial                  [Enabled]
echo %item5%Onboard Serial Mode             [RS232]
echo.
echo %item6%PS/2 Port Support               [Enabled]
goto updatemx


:pcieconfig
echo %pageback%
echo %item1%PCIe Speed                      [3.0]
echo %item2%PCIe ASPM                       [Enabled]
echo.
echo %item3%A/V Card Priority               [Disabled]
echo.
echo   PCIe Lane Speeds
echo    %item4%Lane 1-16                    [3.0]
echo    %item5%Lane 17-20                   [3.0]
echo    %item6%Lane 21-24                   [3.0]
echo    %item7%Lane 25                      [3.0]
echo    %item8%Lane 26                      [3.0]
echo.
echo   PCIe Slot Enable/Disable
echo    %item9%Slot 1 (x16)                 [Enabled]
echo    %item10%Slot 2 (x4)                  [Enabled]
echo    %item11%Slot 3 (x4)                  [Enabled]
echo    %item12%Slot 4 (x1)                  [Enabled]
echo    %item13%Slot 5 (x1)                  [Enabled]
echo.
echo %item14%PCIe Lane Bifurcation           [Enabled]

goto updatemx

:powerupcontrol
echo %pageback%
echo %item1%Power On Method                 [PWRBTN]
echo %item2%Intel SpeedStep                 [Disabled]
echo %item3%CPU C-State Support             [Enabled]
echo.
echo %item4%S3 Power Management             [Enabled]
echo %item5%S4 Power Management             [Enabled]
echo.
echo %item6%Boot Performance Mode           [Normal]
echo %item7%Onboard Device Power Control    [Enabled]
echo %item8%POST Delay                      [Disabled]
echo %item9%Automatic System Power-On       [Disabled]
echo.
echo %item10%Power Button Behavior          [Normal]
goto updatemx

:hardwaremonitor
echo %pageback%
echo %item1%None
echo %item2%None
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

goto updatemx

:diskconfig
echo %pageback%
echo %item1%SATA Mode                       [RAID]
echo %item2%NVMe Configuration

goto updatemx

:determinetab
batbox.exe /k
set currenttab=%tab%
if /I "%errorlevel%" EQU "9009" (
set "cause=batbox.exe /k"
set "errfunc=determinetab"
set "errline=505"
)
echo %errorlevel%
echo %tab%
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "7" (
    if /I "%cItem%" EQU "item1" (
      (
      echo color 17

      echo set "doublespace=%doublespace%"
      echo set "pointerspace=%pointerspace%"
      echo set cItem=item1
      echo ::Main Variables
      echo set biosversion=2.30
      echo set bootpriority=Disk
      echo set boot2=USB
      echo set boot3=Network
      echo set basepath=
      echo set biospath=%cd%\
      echo set language=English
      echo set cpuVcoreVoltage=1.45
      echo set cpuL1Enb=Enabled
      echo set cpuL2Enb=Enabled
      echo set cpuL2ECCEnb=Disabled
      echo set cpuL3Enb=Enabled
      echo set bclk=4600
      echo set spciratio=10/100
      echo set boostclk=5600
      echo set csfm=2.0
      echo set pcifreq=8000
      echo set fastbt=On
      echo set pchVoltage=1.0
      echo set tpm2in=Enabled
      echo set secBoot=Enabled
      echo set isSuperPass=Disabled
      echo set isUserPass=Disabled
      echo set acpif=Enabled
      echo set acpisust=S1
      echo set powman=User-Define
      echo.
      echo set bootnl=On

      ) >%cd%/biosvars
      exit
    )
  )
)
if /I "%errorlevel%" EQU "332" (
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
if /I "%errorlevel%" EQU "330" (
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

if /I "%errorlevel%" EQU "327" (
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
if /I "%errorlevel%" EQU "335" (
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

if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item15" (
      set tab=11
      set cItem=item1
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item16" (
      set tab=12
      set cItem=item1
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item17" (
      set tab=13
      set cItem=item1
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item18" (
      set tab=14
      set cItem=item1
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item13" (
      set tab=9
      set cItem=item1
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item14" (
      set tab=10
      set cItem=item1
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "2" (
    if /I "%cItem%" EQU "item8" (
      set tab=8
      set cItem=item1
    )
  )
)

if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "11" (
    set tab=5
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "12" (
    set tab=5
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "13" (
    set tab=5
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "8" (
    set tab=2
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "9" (
    set tab=3
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "10" (
    set tab=3
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "14" (
    set tab=5
  )
)
if /I "%errorlevel%" EQU "27" (
  exit
)

if /I "%errorlevel%" EQU "" (
  cls
  echo %errorlevel%
  timeout -t 2
  cls
  goto tabupdate
)

if /I "%errorlevel%" EQU "9009" (
  goto dependencyerror
)

if /I "%errorlevel%" EQU "126" (
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
if /I "%errorlevel%" EQU "105" (
    if "%iBackground%" EQU "off" (
        set iBackground=on
        goto tabupdate
    )
    if "%iBackground%" EQU "on" (
        set iBackground=off
        goto tabupdate
    )
)


echo %cItem%
goto tabupdate



:error
cls
echo An error has occured.
pause
exit

:dependencyerror
cls
for /F "tokens=2 delims==." %%I in ('%SystemRoot%\System32\wbem\wmic.exe OS GET LocalDateTime /VALUE') do set "LocalTime=%%I"
set "LocalTime=%LocalTime:~8,4%"
set dxa=%errorlevel%
echo y=msgbox("%time% dependency not found (Error %dxa%)                         cd: %cd%", 1+16, "Fatal Error") >%cd%\errormsg.vbs
%cd%/errormsg.vbs
(
echo %time% func: %errfunc%
echo %time% cd: %cd%
echo %time% %cause%
echo %time% dependency not found error [Error %dxa%]
) >%cd%\errorfile%LocalTime%.log
echo error in line %errline%
echo error trace:
echo   %time% func: %errfunc%
echo   %time% cd: %cd%
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
echo here: %cd%\errorfile%LocalTime%.log
echo.
echo.
echo.
pause
echo terminating process...
ping -n 2 localhost>nul
exit