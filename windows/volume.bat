@echo off
set "ACTION=%~1"

if "%ACTION%"="" goto usage

if /i "%ACTION%"=="up" (
    echo Increasing volume...
    adb shell input keyevent 24
    goto push_done
)
if /i "%ACTION%"=="down" (
    echo Decreasing volume...
    adb shell input keyevent 25
    goto push_done
)
if /i "%ACTION%"=="power" (
    echo Toggling power button...
    adb shell input keyevent 26
    goto push_done
)

:usage
echo Usage: volume [up ^| down ^| power]
exit /b 1

:push_done
