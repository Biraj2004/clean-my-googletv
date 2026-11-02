@echo off
setlocal EnableDelayedExpansion
title CleanYourTV Suite - Complete Setup & Universal 1-Click Installer
color 0B

echo ===============================================================================
echo                CLEANYOURTV ENHANCED LAUNCHER & ADD-ON SUITE
echo ===============================================================================
echo  Universal Installer for Any Google TV / Android TV Device
echo  Target Architectures: armeabi-v7a (32-bit ARM) & arm64-v8a (64-bit ARM)
echo ===============================================================================
echo.
echo  -----------------------------------------------------------------------------
echo   ORIGINAL UPSTREAM REPOSITORIES & DOCUMENTATION:
echo  -----------------------------------------------------------------------------
echo   1. CleanYourTV Launcher:
echo      - Repo : https://github.com/Gathin23/cleanyourtv
echo      - Desc : Minimal, lightning-fast tvOS-inspired launcher for Google TV.
echo.
echo   2. CleanYourTV Add-ons (Bluetooth, Capacity, AirPlay):
echo      - Repo : https://github.com/Gathin23/cleanyourtv/tree/main/addons
echo      - Auth : Justin Newman (https://github.com/justin-newman)
echo      - Desc : Modular background providers for system status and toggles.
echo.
echo   3. Webmote (Phone TV Remote via Web Browser):
echo      - Repo : https://github.com/maxhayim/webmote
echo      - Desc : Lightweight browser-based remote control for Android TV.
echo.
echo   4. SmartTube (Ad-free, SponsorBlock YouTube client for TV):
echo      - Repo : https://github.com/yuliskov/SmartTube
echo      - Rel  : https://github.com/yuliskov/SmartTube/releases/latest
echo.
echo   5. Stremio (Official Media & Streaming Engine for Android TV):
echo      - Org  : https://github.com/Stremio
echo      - Web  : https://www.stremio.com/downloads
echo.
echo   6. Nuvio TV (Modern Media & Streaming App for Android TV):
echo      - Repo : https://github.com/NuvioMedia/NuvioTV
echo      - Web  : https://nuvio.tv
echo.
echo   7. BitChord TV (Hi-Res Audio & Music Player with Apple TV UI):
echo      - Repo : https://github.com/kushagrasinghx/BitChord
echo      - Web  : https://bitchord.org
echo  -----------------------------------------------------------------------------
echo.

REM --- ADB BINARY RESOLUTION ---
if "%ADB%"=="" (
    where adb >nul 2>nul
    if %ERRORLEVEL% equ 0 (
        set ADB=adb
    ) else if exist "%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe" (
        set ADB="%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe"
    ) else (
        set ADB=adb
    )
)
set APK_DIR=%~dp0

REM --- TV IP RESOLUTION ---
if not "%~1"=="" set TV_IP=%~1
if "%TV_IP%"=="" (
    echo [i] Checking for active ADB devices...
    for /f "skip=1 tokens=1" %%d in ('%ADB% devices 2^>nul') do (
        if not "%%d"=="" if not "%%d"=="offline" (
            set TV_IP=%%d
            goto :DeviceFound
        )
    )
    echo [?] No active ADB connection detected.
    set /p TV_IP="Enter your Android TV / Google TV IP address (e.g. 192.168.1.100:5555): "
)

:DeviceFound
REM Ensure port 5555 is appended if missing
echo %TV_IP% | findstr /C:":" >nul
if %ERRORLEVEL% neq 0 (
    set TV_IP=%TV_IP%:5555
)

echo.
echo [Step 1/5] Connecting to TV at %TV_IP%...
%ADB% connect %TV_IP%
%ADB% -s %TV_IP% wait-for-device
echo [OK] TV connected successfully!

REM Query Device Information
for /f "tokens=*" %%a in ('%ADB% -s %TV_IP% shell getprop ro.product.manufacturer 2^>nul') do set TV_MFG=%%a
for /f "tokens=*" %%a in ('%ADB% -s %TV_IP% shell getprop ro.product.model 2^>nul') do set TV_MODEL=%%a
for /f "tokens=*" %%a in ('%ADB% -s %TV_IP% shell getprop ro.product.cpu.abi 2^>nul') do set TV_ABI=%%a
for /f "tokens=*" %%a in ('%ADB% -s %TV_IP% shell getprop ro.build.version.release 2^>nul') do set TV_OS=%%a

echo [i] Detected Hardware : %TV_MFG% %TV_MODEL%
echo [i] Android Version   : %TV_OS%
echo [i] Architecture (ABI): %TV_ABI%
echo.

echo ===============================================================================
echo  [Step 2/5] DOWNLOADING LATEST THIRD-PARTY APKS FROM OFFICIAL SOURCES
echo ===============================================================================

REM 1. SmartTube Stable (Universal)
set SMARTTUBE_APK=%APK_DIR%smarttube-stable.apk
set SMARTTUBE_URL=https://github.com/yuliskov/SmartTube/releases/download/latest/smarttube_stable.apk
if not exist "%SMARTTUBE_APK%" (
    echo [*] Downloading SmartTube Stable from official GitHub...
    curl.exe -L -o "%SMARTTUBE_APK%" "%SMARTTUBE_URL%"
    if not exist "%SMARTTUBE_APK%" (
        echo [!] Curl failed, trying PowerShell download...
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%SMARTTUBE_URL%', '%SMARTTUBE_APK%')"
    )
) else (
    echo [i] SmartTube APK already present: %SMARTTUBE_APK%
)

REM 2. Stremio TV (ARM)
set STREMIO_APK=%APK_DIR%stremio-tv-arm.apk
set STREMIO_URL=https://dl.strem.io/android/v1.10.4-androidTV/com.stremio.one-1.10.4-31048580-armeabi-v7a.apk
if not exist "%STREMIO_APK%" (
    echo [*] Downloading Stremio Android TV (ARM) from official Stremio CDN...
    curl.exe -L -o "%STREMIO_APK%" "%STREMIO_URL%"
    if not exist "%STREMIO_APK%" (
        echo [!] Curl failed, trying PowerShell download...
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%STREMIO_URL%', '%STREMIO_APK%')"
    )
) else (
    echo [i] Stremio TV APK already present: %STREMIO_APK%
)

REM 3. Nuvio TV (ARM)
set NUVIO_APK=%APK_DIR%nuvio-tv-arm.apk
set NUVIO_URL=https://github.com/NuvioMedia/NuvioTV/releases/download/1.0.0/app-full-armeabi-v7a-release.apk
if not exist "%NUVIO_APK%" (
    echo [*] Downloading Nuvio TV (ARM) from official GitHub releases...
    curl.exe -L -o "%NUVIO_APK%" "%NUVIO_URL%"
    if not exist "%NUVIO_APK%" (
        echo [!] Curl failed, trying PowerShell download...
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%NUVIO_URL%', '%NUVIO_APK%')"
    )
) else (
    echo [i] Nuvio TV APK already present: %NUVIO_APK%
)

REM 4. BitChord TV (ARM)
set BITCHORD_APK=%APK_DIR%bitchord-tv-arm.apk
set BITCHORD_URL=https://github.com/kushagrasinghx/BitChord/releases/download/v1.9/BitChordTV-v1.9_armeabi-v7a.apk
if not exist "%BITCHORD_APK%" (
    echo [*] Downloading BitChord TV (ARM) from official GitHub releases...
    curl.exe -L -o "%BITCHORD_APK%" "%BITCHORD_URL%"
    if not exist "%BITCHORD_APK%" (
        echo [!] Curl failed, trying PowerShell download...
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%BITCHORD_URL%', '%BITCHORD_APK%')"
    )
) else (
    echo [i] BitChord TV APK already present: %BITCHORD_APK%
)
echo.

echo ===============================================================================
echo  [Step 3/5] INSTALLING LAUNCHER ^& MODULE ADD-ON APKS FROM REPO
echo ===============================================================================

echo [*] Installing CleanYourTV Enhanced Launcher...
%ADB% -s %TV_IP% install -r "%APK_DIR%cleanyourtv-enhanced.apk"

echo [*] Installing Add-on: Bluetooth Toggle...
%ADB% -s %TV_IP% install -r "%APK_DIR%addon-bluetooth-toggle.apk"

echo [*] Installing Add-on: Bluetooth Connect...
%ADB% -s %TV_IP% install -r "%APK_DIR%addon-bluetooth-connect.apk"

echo [*] Installing Add-on: Headphones Audio Routing...
%ADB% -s %TV_IP% install -r "%APK_DIR%addon-headphones.apk"

echo [*] Installing Add-on: Capacity Stats...
%ADB% -s %TV_IP% install -r "%APK_DIR%addon-capacity-stats.apk"

echo [*] Installing Add-on: AirPlay Status...
%ADB% -s %TV_IP% install -r "%APK_DIR%addon-airplay-status.apk"

echo [*] Installing Webmote TV Controller...
%ADB% -s %TV_IP% install -r "%APK_DIR%webmote.apk"
echo.

echo ===============================================================================
echo  [Step 4/5] INSTALLING THIRD-PARTY STREAMING ^& MEDIA APKS
echo ===============================================================================

if exist "%SMARTTUBE_APK%" (
    echo [*] Installing SmartTube Stable...
    %ADB% -s %TV_IP% install -r "%SMARTTUBE_APK%"
)
if exist "%STREMIO_APK%" (
    echo [*] Installing Stremio Android TV...
    %ADB% -s %TV_IP% install -r "%STREMIO_APK%"
)
if exist "%NUVIO_APK%" (
    echo [*] Installing Nuvio TV...
    %ADB% -s %TV_IP% install -r "%NUVIO_APK%"
)
if exist "%BITCHORD_APK%" (
    echo [*] Installing BitChord TV...
    %ADB% -s %TV_IP% install -r "%BITCHORD_APK%"
)
echo.

echo ===============================================================================
echo  [Step 5/5] CONFIGURING PERMISSIONS, ACCESSIBILITY ^& SETTING DEFAULT HOME
echo ===============================================================================

echo [*] Granting Secure Settings permission to CleanYourTV...
%ADB% -s %TV_IP% shell pm grant com.gathin.tvhome android.permission.WRITE_SECURE_SETTINGS

echo [*] Granting Bluetooth Connect permission...
%ADB% -s %TV_IP% shell pm grant com.gathin.tvhome android.permission.BLUETOOTH_CONNECT
%ADB% -s %TV_IP% shell pm grant io.github.justinnewman.bluetoothtoggle android.permission.BLUETOOTH_CONNECT

echo [*] Granting Usage Stats access for Live Task Manager...
%ADB% -s %TV_IP% shell appops set com.gathin.tvhome GET_USAGE_STATS allow

echo [*] Enabling CleanYourTV HomeKey accessibility service for remote button intercept...
%ADB% -s %TV_IP% shell settings put secure enabled_accessibility_services com.gathin.tvhome/.HomeKeyService
%ADB% -s %TV_IP% shell settings put secure accessibility_enabled 1

echo [*] Setting CleanYourTV Enhanced as the Default TV Launcher...
%ADB% -s %TV_IP% shell cmd package set-home-activity --user 0 com.gathin.tvhome/.MainActivity

echo [*] Setting wallpaper (Nature Calm 006)...
if exist "%APK_DIR%..\images\wallpaper_only.jpg" (
    %ADB% -s %TV_IP% push "%APK_DIR%..\images\wallpaper_only.jpg" /sdcard/Android/data/com.gathin.tvhome/files/wallpaper.jpg
    %ADB% -s %TV_IP% shell "chmod 666 /sdcard/Android/data/com.gathin.tvhome/files/wallpaper.jpg"
) else if exist "%APK_DIR%..\cleanyourtv_repo\themes\nature-calm\wallpapers\006.jpg" (
    %ADB% -s %TV_IP% push "%APK_DIR%..\cleanyourtv_repo\themes\nature-calm\wallpapers\006.jpg" /sdcard/Android/data/com.gathin.tvhome/files/wallpaper.jpg
    %ADB% -s %TV_IP% shell "chmod 666 /sdcard/Android/data/com.gathin.tvhome/files/wallpaper.jpg"
)

echo [*] Starting CleanYourTV Homescreen...
%ADB% -s %TV_IP% shell am start -S -n com.gathin.tvhome/.MainActivity

echo.
echo ===============================================================================
echo                       INSTALLATION ^& CONFIGURATION COMPLETE!
echo ===============================================================================
echo  CleanYourTV Enhanced is now running as your default TV launcher!
echo  Quick Buttons:
echo    - Row 1 : [Inputs] [Wi-Fi] [Bluetooth] [Screensaver Circle]
echo    - Row 2 : [RAM ^& Storage Live Stats Pill] [Settings]
echo ===============================================================================
pause
