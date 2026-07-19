@echo off
set "ACTION=%~1"

if "%ACTION%"="" goto usage

:: Fetch screen layout dimensions
for /f "tokens=3" %%i in ('adb shell wm size ^| findstr "Physical size"') do set DIM=%%i
for /f "tokens=1,2 delims=x" %%a in ("%DIM%") do (
    set /a WIDTH=%%a
    set /a HEIGHT=%%b
)

if "%WIDTH%"=="" goto err_dim

set /a MID_X=WIDTH / 2
set /a MID_Y=HEIGHT / 2
set /a START_Y=HEIGHT - 10
set /a END_Y_HOME=HEIGHT - 400
set /a LEFT_SWIPE_END=200
set /a RIGHT_SWIPE_START=WIDTH - 10
set /a RIGHT_SWIPE_END=WIDTH - 200

if /i "%ACTION%"=="left" (
    echo Emulating swipe back from left edge...
    adb shell input swipe 10 %MID_Y% %LEFT_SWIPE_END% %MID_Y% 150
    goto push_done
)
if /i "%ACTION%"=="right" (
    echo Emulating swipe back from right edge...
    adb shell input swipe %RIGHT_SWIPE_START% %MID_Y% %RIGHT_SWIPE_END% %MID_Y% 150
    goto push_done
)
if /i "%ACTION%"=="home" (
    echo Emulating quick swipe up for Home...
    adb shell input swipe %MID_X% %START_Y% %MID_X% %END_Y_HOME% 200
    goto push_done
)
if /i "%ACTION%"=="recents" (
    echo Triggering Recents App Switcher via Keyevent...
    adb shell input keyevent 187
    goto push_done
)

:usage
echo Usage: gestural_nav [left ^| right ^| home ^| recents]
exit /b 1

:err_dim
echo Error: Could not retrieve device screen dimensions.
exit /b 1

:push_done
