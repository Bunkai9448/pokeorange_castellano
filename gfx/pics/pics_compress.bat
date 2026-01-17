@echo off
setlocal

REM ==============================
REM Absolute root based on script location
REM ==============================

set PICSDIR=%~dp0
set ROOT=%~dp0..\..\
for %%I in ("%ROOT%") do set ROOT=%%~fI

REM ==============================
REM Tool paths
REM ==============================

set LZCOMP=%ROOT%\tools\lzcomp.exe


REM ==============================
REM Download + extract rgbds if needed
REM ==============================

REM RGBDS v1.0.0 paths
set RGBDSDIRNAME=_rgbds100
set RGBDSDIR=%PICSDIR%\%RGBDSDIRNAME%
set RGBGFX=%RGBDSDIR%\rgbgfx.exe
set RGBDSZIP=%PICSDIR%\rgbds-win32.zip
set RGBDSURL=https://github.com/gbdev/rgbds/releases/download/v1.0.0/rgbds-win32.zip

if not exist "%RGBGFX%" (
    echo rgbgfx.exe not found, setting up rgbds v1.0.0...

    if not exist "%RGBDSZIP%" (
        echo Downloading rgbds...
        powershell -NoProfile -Command ^
            "Invoke-WebRequest -Uri '%RGBDSURL%' -OutFile '%RGBDSZIP%'"
    )

    if not exist "%RGBDSDIR%" (
        mkdir "%RGBDSDIR%"
    )

    echo Extracting rgbds...
    powershell -NoProfile -Command ^
        "Expand-Archive -Force '%RGBDSZIP%' '%RGBDSDIR%'"

    echo rgbds setup complete.
    echo.
) else (
    echo Using existing rgbds v1.0.0
    echo.
)

REM ==============================
REM Process each folder in gfx/pics
REM ==============================

for /d %%D in ("%~dp0*") do (

    REM Skip the rgbds100 folder
    if /I "%%~nxD"=="%RGBDSDIRNAME%" (
        echo Skipping %%~nxD
    ) else (

    	echo Processing %%~nxD

    	"%RGBGFX%" -Z -o "%%D\back.2bpp" "%%D\back.png"
    	"%RGBGFX%" -Z -o "%%D\front.2bpp" "%%D\front.png"

    	"%LZCOMP%" "%%D\back.2bpp" "%%D\back.2bpp.lz"
    	"%LZCOMP%" "%%D\front.2bpp" "%%D\front.2bpp.lz"

    	echo Done %%~nxD
    	echo.
    )
)

pause
