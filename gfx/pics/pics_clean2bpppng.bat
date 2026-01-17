@echo off
setlocal

REM ==============================
REM Resolve base directory
REM ==============================

REM Directory of this script
set BASEDIR=%~dp0
for %%I in ("%BASEDIR%") do set BASEDIR=%%~fI

echo Deleting .2bpp and .png files under:
echo   %BASEDIR%
echo.

REM ==============================
REM Delete files recursively
REM ==============================

for /r "%BASEDIR%" %%F in (*.2bpp *.png) do (
    echo Deleting "%%F"
    del /f /q "%%F"
)

echo.
echo Cleanup complete.
pause
