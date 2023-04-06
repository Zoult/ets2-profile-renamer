@echo off
setlocal enabledelayedexpansion
set "doc=%USERPROFILE%\Documents\Euro Truck Simulator 2"
set siidecrypt=https://raw.githubusercontent.com/Cubixty/sii-decrypt/main/SII_Decrypt%%20(any%%20format).exe

:rename
cls
echo --------------------------------------
echo Euro Truck Simulator 2 Profile Renamer
echo --------------------------------------
echo.
echo - Profiles saved:

for /D %%d in ("%doc%\profiles\*") do (
  set "hex_name=%%~nxd"
  echo !hex_name!> temp.hex
  call certutil -decodehex temp.hex str.txt >nul
  set /p "folder_name=" < str.txt
  ( del temp.hex & del str.txt )>nul
  echo - !folder_name! = !hex_name!
)

echo.
set /p sel=Paste profile Hex Code: 
if not exist "%doc%\profiles\%sel%" (
  echo.
  echo Wrong input, try again
  pause >nul
  goto :rename
)
set /p ren=Rename this profile to: 

echo|set /p=!ren!> temp.txt
call certutil -encodehex temp.txt temp.hex 4 >nul
set /p hex=<temp.hex
set hex=!hex: =!
set hex=%hex:~0,-2%
( del temp.hex & del temp.txt )>nul
set hex=%hex: =%
for %%i in ("a=A" "b=B" "c=C" "d=D" "e=E" "f=F") do call set hex=%%hex:%%~i%%

if exist "%doc%\profiles\%hex%" (
  echo.
  echo You can't name two profiles with the same name
  pause >nul
  goto :rename
)
echo.

set /p conf=Double check if everything is okay. Continue? (y/n) 
if "%conf%"=="n" goto :rename
if "%conf%"=="N" goto :rename
echo.

powershell -Command "(Get-Content '%doc%\config.cfg') -replace 'uset g_save_format \".*?\"', 'uset g_save_format \"2\"' | Set-Content '%doc%\config.cfg'"
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "&{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12}; Invoke-WebRequest -Uri '%siidecrypt%' -OutFile 'SII_Decrypt.exe'"
SII_Decrypt.exe "%doc%\profiles\%sel%\profile.sii"
powershell -Command "(Get-Content '%doc%\profiles\%sel%\profile.sii') -replace 'profile_name:.*', 'profile_name: %ren%' | Set-Content '%doc%\profiles\%sel%\profile.sii'"
del SII_Decrypt.exe

ren "%doc%\profiles\%sel%" "%hex%"
echo.
echo Done
pause >nul
goto :rename