@echo off
setlocal enabledelayedexpansion

set "TARGET=%~1"

if /i "%TARGET%"=="bootloader" (
    echo Rebooting device to bootloader mode...
    adb reboot bootloader
    goto :eof
)

if /i "%TARGET%"=="fastboot" (
    echo Rebooting device to bootloader mode...
    adb reboot bootloader
    goto :eof
)

if /i "%TARGET%"=="os" (
    echo Rebooting device to system OS...
    adb reboot
    goto :eof
)

echo Usage: reboot_dev [bootloader ^| fastboot ^| os]
exit /b 1
