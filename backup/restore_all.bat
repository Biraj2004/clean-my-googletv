@echo off
setlocal EnableDelayedExpansion
title CleanYourTV Suite - Universal Emergency Restore Script
color 0E

echo ===============================================================================
echo            CLEANYOURTV SUITE - UNIVERSAL EMERGENCY RESTORE SCRIPT
echo ===============================================================================
echo  Restores factory launcher and re-enables all potentially debloated packages.
echo  Compatible with: Sony, TCL, Hisense, Chromecast, onn., Xiaomi, Philips, etc.
echo ===============================================================================
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

echo [*] Target TV Device: %TV_IP%
echo [*] Attempting connection...
%ADB% connect %TV_IP%
echo.

echo ===============================================================================
echo  RE-ENABLING SYSTEM & TELEMETRY PACKAGES (USER 0)
echo ===============================================================================

REM Universal & Brand Packages List
set PACKAGES=^
 tv.samba.ssm^
 com.sony.dtv.promos^
 com.sony.dtv.sonyselect^
 com.google.android.feedback^
 com.sony.dtv.demosupport^
 com.sony.dtv.demosystemsupport^
 com.sony.dtv.multiscreendemo^
 com.google.android.videos^
 com.google.android.youtube.tvmusic^
 com.google.android.play.games^
 com.sonypicturescore^
 com.netflix.ninja^
 com.google.android.partnersetup^
 com.google.android.katniss^
 com.sony.dtv.voicesearch^
 com.google.android.apps.tv.dreamx^
 com.google.android.tungsten.setupwraith^
 com.google.android.apps.tv.launcherx^
 com.mediatek.tv.systemupdater^
 com.sony.gaus.updatecenter^
 com.tcl.partnercustomizer^
 com.hisense.hitv.hicloud.account^
 com.google.android.tvrecommendations

for %%P in (%PACKAGES%) do (
    echo [*] Restoring package: %%P...
    %ADB% -s %TV_IP% shell pm default-state --user 0 %%P >nul 2>&1
    %ADB% -s %TV_IP% shell pm enable --user 0 %%P >nul 2>&1
)

echo.
echo [*] Re-enabling automatic system update flags...
%ADB% -s %TV_IP% shell settings put global ota_disable_automatic_update 0

echo [*] Restoring stock Google TV launcher as Default Home...
%ADB% -s %TV_IP% shell cmd package set-home-activity --user 0 com.google.android.apps.tv.launcherx/com.google.android.apps.tv.launcherx.home.HomeActivity >nul 2>&1

echo.
echo ===============================================================================
echo                         RESTORE PROCESS FINISHED!
echo ===============================================================================
echo  All standard Google TV system and vendor packages have been re-enabled.
echo  Default launcher intent has been restored to stock Google TV.
echo ===============================================================================
pause
