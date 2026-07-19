@echo off
set "ACTION=%~1"

if "%ACTION%"="" goto usage

if /i "%ACTION%"=="back" (
    echo Triggering Back button...
    adb shell input keyevent 4
    goto push_done
)
if /i "%ACTION%"=="home" (
    echo Triggering Home button...
    adb shell input keyevent 3
    goto push_done
)
if /i "%ACTION%"=="recents" (
    echo Triggering Recents App Switcher...
    adb shell input keyevent 187
    goto push_done
)

:usage
echo Usage: nav [back ^| home ^| recents]
exit /b 1

:push_done
