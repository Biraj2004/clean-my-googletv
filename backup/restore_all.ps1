# CleanYourTV Suite - Universal Emergency Restore Script (PowerShell)
# Re-enables all potentially debloated packages across any Android TV / Google TV.

param (
    [string]$TargetIP = ""
)

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "           CLEANYOURTV SUITE - UNIVERSAL EMERGENCY RESTORE SCRIPT              " -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host " Restores factory launcher and re-enables all debloated packages." -ForegroundColor Gray
Write-Host " Compatible with: Sony, TCL, Hisense, Chromecast, onn., Xiaomi, Philips, etc." -ForegroundColor Gray
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Resolve ADB Executable
$adb = "adb"
if (-not (Get-Command adb -ErrorAction SilentlyContinue)) {
    $sdkAdb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
    if (Test-Path $sdkAdb) {
        $adb = $sdkAdb
    }
}

# 2. Resolve TV Device IP
$tvHost = $TargetIP
if ([string]::IsNullOrWhiteSpace($tvHost)) {
    # Check for active ADB devices
    $activeDevices = & $adb devices 2>$null | Where-Object { $_ -match "\bdevice\b" }
    if ($activeDevices) {
        $tvHost = ($activeDevices[0] -split "\s+")[0]
        Write-Host "[i] Detected active ADB device: $tvHost" -ForegroundColor Green
    } else {
        $tvHost = Read-Host "Enter your Android TV / Google TV IP address (e.g. 192.168.1.100:5555)"
    }
}

if (-not $tvHost.Contains(":")) {
    $tvHost = "$($tvHost):5555"
}

Write-Host "[*] Connecting to TV at $tvHost..." -ForegroundColor Cyan
& $adb connect $tvHost

# 3. Universal & Brand Packages List
$packages = @(
    "tv.samba.ssm",
    "com.sony.dtv.promos",
    "com.sony.dtv.sonyselect",
    "com.google.android.feedback",
    "com.sony.dtv.demosupport",
    "com.sony.dtv.demosystemsupport",
    "com.sony.dtv.multiscreendemo",
    "com.google.android.videos",
    "com.google.android.youtube.tvmusic",
    "com.google.android.play.games",
    "com.sonypicturescore",
    "com.netflix.ninja",
    "com.google.android.partnersetup",
    "com.google.android.katniss",
    "com.sony.dtv.voicesearch",
    "com.google.android.apps.tv.dreamx",
    "com.google.android.tungsten.setupwraith",
    "com.google.android.apps.tv.launcherx",
    "com.mediatek.tv.systemupdater",
    "com.sony.gaus.updatecenter",
    "com.tcl.partnercustomizer",
    "com.hisense.hitv.hicloud.account",
    "com.google.android.tvrecommendations"
)

Write-Host ""
Write-Host "Re-enabling packages for user 0..." -ForegroundColor Yellow
foreach ($pkg in $packages) {
    Write-Host "  -> Re-enabling $pkg..." -ForegroundColor Gray
    & $adb -s $tvHost shell pm default-state --user 0 $pkg 2>$null
    & $adb -s $tvHost shell pm enable --user 0 $pkg 2>$null
}

Write-Host ""
Write-Host "[*] Re-enabling automatic system updates setting..." -ForegroundColor Yellow
& $adb -s $tvHost shell settings put global ota_disable_automatic_update 0

Write-Host "[*] Resetting stock launcher as default home..." -ForegroundColor Green
& $adb -s $tvHost shell cmd package set-home-activity --user 0 com.google.android.apps.tv.launcherx/com.google.android.apps.tv.launcherx.home.HomeActivity 2>$null

Write-Host ""
Write-Host "===============================================================================" -ForegroundColor Green
Write-Host "                          RESTORE COMPLETE!                                    " -ForegroundColor Green
Write-Host "===============================================================================" -ForegroundColor Green
Write-Host " All packages restored and default launcher reset to factory Google TV." -ForegroundColor Green
