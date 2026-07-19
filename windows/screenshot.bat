@echo off
setlocal enabledelayedexpansion

:: Ensure output directory exists
if not exist screenshots mkdir screenshots

:: Extract system time components safely across regional system formats
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i
set TIMESTAMP=!datetime:~0,8%_!datetime:~8,6!
set FILENAME=screenshots\Screenshot_!TIMESTAMP!.png

echo Capturing screen...
:: Stream target layout directly to destination file boundary
adb shell screencap -p > "!FILENAME!"

if exist "!FILENAME!" (
    echo Saved to: !FILENAME!
) else (
    echo Error: Screenshot capture failed.
    exit /b 1
)
