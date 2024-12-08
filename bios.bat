@echo off

title CMDBIOS
::Default color for display is 1f, 79, 9f, 0b, 0a, or 17
color 17

set "doublespace=  "
set "pointerspace=- "
set cItem=item1
::Main Variables
set biosversion=3.24
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
set pageback=[44m

if /I "%iBackground%" EQU "on" (
   set pageback=[7m
)

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
if "%tab%"=="1" (
  set "c1r=[[7m"
  set "c1l=[0m[44m]"
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
  set "c2r=[[7m"
  set "c2l=[0m[44m]"
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
  set "c3r=[[7m"
  set "c3l=[0m[44m]"
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
  set "c4r=[[7m"
  set "c4l=[0m[44m]"
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
  set "c5r=[[7m"
  set "c5l=[0m[44m]"
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
  set "c6r=[[7m"
  set "c6l=[0m[44m]"
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
  set "c7r=[[7m"
  set "c7l=[0m[44m]"
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
  set "c5r=[[7m"
  set "c5l=[0m[44m]"
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
  set "c5r=[[7m"
  set "c5l=[0m[44m]"
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
  set "c5r=[[7m"
  set "c5l=[0m[44m]"
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
echo [0m[44m#  CMDBIOS %biosversion%    ⤷ select menu  +/- change value  ↑/↓ switch item  ←/→ switch tab  ⌫  go back
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
::for /f "delims=" %%a in ('"BatBox.exe" -key') do set key=%%a

FOR /F "tokens=1,2,3 delims=:" %%A in ('BatBox /m') DO (
SET _Click=%%C
SET _Y=%%B
SET _X=%%A
)


:mainmenu
echo %pageback%
echo   BIOS Core Version              %biosversion%
echo   BIOS ACI Key                   ******************f2
echo.
echo %item1%System Time                    [%time%]
echo %item2%System Date                    [%date%]
echo.
echo %item3%System Language                [%language%]
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
echo %item4%System/PCIe Frequency (Mhz)     [Auto]
echo %item5%PCIe Frequency (Mhz)            [%pcifreq%]
echo %item6%System /SDRAM Frequency Ratio   [Auto]
echo %item7%Load Performance Setting        [Normal]
echo %item8%CPU Vcore                       [%cpuVcoreVoltage%V]
echo %item9%PCH +1.0V                       [%pchVoltage%V]
echo %item10%CPU Level 1 Cache               [%cpuL1Enb%]
echo %item11%CPU Level 2 Cache               [%cpuL2Enb%]
echo %item12%CPU Level 3 Cache               [%cpuL3Enb%]
echo %item13%CPU Level 2 Cache ECC Check     [%cpuL2ECCEnb%]
echo.
echo %item14%Chip Configuration
echo %item15%I/O Device Configuration
echo %item16%PCIe Configuration
goto updatemx

:securitytab
echo %pageback%
echo %item1%Supervisor Password             [%isSuperPass%]
echo %item2%User Password                   [%isUserPass%]
echo.
echo %item3%Secure Boot                     [%secBoot%]
echo %item4%TPM 2.0                         [%tpm2In%]
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
goto updatemx


:iodevconfig
echo %pageback%
echo None
goto updatemx


:pcieconfig
echo %pageback%
echo None
goto updatemx

:powerupcontrol
echo %pageback%
echo None
goto updatemx

:hardwaremonitor
echo %pageback%
echo None
goto updatemx

:determinetab
batbox.exe /k
if /I "%errorlevel%" EQU "9009" (
set "cause=batbox.exe /k"
set "errfunc=determinetab"
set "errline=469"
)
echo %errorlevel%
echo %tab%
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "7" (
    if /I "%cItem%" EQU "item1" (
      (
      echo color 17

      echo set "doublespace=  "
      echo set "pointerspace=- "
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
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item14" (
      set tab=11
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item15" (
      set tab=12
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "5" (
    if /I "%cItem%" EQU "item16" (
      set tab=13
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item13" (
      set tab=9
    )
  )
)
if /I "%errorlevel%" EQU "13" (
  if /I "%tab%" EQU "3" (
    if /I "%cItem%" EQU "item14" (
      set tab=10
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
  if /I "%tab%" EQU "9" (
    set tab=3
  )
)
if /I "%errorlevel%" EQU "8" (
  if /I "%tab%" EQU "10" (
    set tab=3
  )
)

if /I "%errorlevel%" EQU "9009" (
  goto dependencyerror
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