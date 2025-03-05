@echo off
cls
set "a1=A          "
set "a2= A         "
set "a3=  A        "
set "a4=   A       "
set "a5=    A      "
set "a6=     A     "
set "a7=    A    "
set "a8=   A   "
set "a9=  A  "
set "a10= A "
set "a11=         _"
:a
echo %a1%
echo %a2%
echo %a3%
echo %a4%
echo %a5%
echo %a6%
echo %a7%
echo %a8%
echo %a9%
echo %a10%
batbox.exe /g 0 0
set a11=%a1%
set a1=%a2%
set a2=%a3%
set a3=%a4%
set a4=%a5%
set a5=%a6%
set a6=%a7%
set a7=%a8%
set a8=%a9%
set a9=%a10%
set a10=%a11%
ping localhost -n 1>nul

goto a