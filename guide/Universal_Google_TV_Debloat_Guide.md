# Universal Google TV & Android TV Debloat Matrix

This guide provides a tested, non-destructive debloat matrix across all major Google TV and Android TV manufacturers. Every package is disabled at the user level (`pm disable-user --user 0`) without touching read-only system partitions.

---

## 1. Universal Tier 1: Safe Telemetry, Ad Networks & Crash Uploaders
> **Safety:** 100% Safe on ALL Android TV / Google TV devices (Sony, TCL, Hisense, Chromecast, onn, Xiaomi, Philips, Nvidia Shield).

| Package Identifier | Description | Function / Why Disable |
| :--- | :--- | :--- |
| `tv.samba.ssm` | Samba TV ACR | Automated Content Recognition tracker. Continuously scans screen to serve targeted ads. |
| `com.google.android.feedback` | Google Feedback | System crash log uploader and telemetry recorder. |
| `com.google.android.partnersetup` | Google Partner Setup | RLZ attribution tracking ping daemon for commercial ad attribution. |
| `com.google.android.tvrecommendations` | TV Recommendations | Injects sponsored recommendation carousels into UI caches. |

### ADB Command:
```bash
adb shell pm disable-user --user 0 tv.samba.ssm
adb shell pm disable-user --user 0 com.google.android.feedback
adb shell pm disable-user --user 0 com.google.android.partnersetup
adb shell pm disable-user --user 0 com.google.android.tvrecommendations
```

---

## 2. Universal Tier 2: Unused Google Pre-installed Media Services
> **Safety:** Safe if you use alternative streaming apps (SmartTube, Stremio, BitChord, VLC, Kodi).

| Package Identifier | Description | Function / Why Disable |
| :--- | :--- | :--- |
| `com.google.android.videos` | Google TV / Play Movies | Google Play Movies & TV storefront and background rental sync. |
| `com.google.android.youtube.tvmusic` | YouTube Music TV | Stock YouTube Music app (often replaced with BitChord TV or SmartTube). |
| `com.google.android.play.games` | Google Play Games | Game sync and cloud achievements daemon (unnecessary on streaming TVs). |

### ADB Command:
```bash
adb shell pm disable-user --user 0 com.google.android.videos
adb shell pm disable-user --user 0 com.google.android.youtube.tvmusic
adb shell pm disable-user --user 0 com.google.android.play.games
```

---

## 3. Brand-Specific Bloat Modules

### A. Sony BRAVIA Series
| Package Identifier | Role / Description |
| :--- | :--- |
| `com.sony.dtv.promos` | Sony promotional banner and advertisement daemon. |
| `com.sony.dtv.sonyselect` | Sony Select store and sponsored app recommendation engine (~62 MB RAM). |
| `com.sony.dtv.demosupport` | Retail store display loop. |
| `com.sony.dtv.demosystemsupport` | Retail store demonstration helper framework. |
| `com.sony.dtv.multiscreendemo` | Retail showroom demo tool. |
| `com.sonypicturescore` | Sony Pictures Core paid movie store. |
| `com.mediatek.tv.systemupdater` | MediaTek local firmware updater (prevent forced updates). |
| `com.sony.gaus.updatecenter` | Sony cloud update check daemon (prevent forced updates). |

### B. TCL Google TV Series
| Package Identifier | Role / Description |
| :--- | :--- |
| `com.tcl.partnercustomizer` | TCL partner customization and sponsored recommendation injector. |
| `com.tcl.useragreement` | TCL background telemetry and diagnostic recorder. |
| `com.tcl.channel` | TCL Channel pre-installed FAST linear video ads. |

### C. Hisense VIDAA / Google TV Series
| Package Identifier | Role / Description |
| :--- | :--- |
| `com.hisense.hitv.hicloud.account` | Hisense cloud account background tracking daemon. |
| `com.hisense.tv.videoplayer` | Stock video player with ad overlays. |

### D. Walmart onn. 4K Streaming Boxes
| Package Identifier | Role / Description |
| :--- | :--- |
| `com.walmart.tv.companion` | Walmart retail and promotional companion service. |

### E. Xiaomi / Mi TV Series
| Package Identifier | Role / Description |
| :--- | :--- |
| `com.xiaomi.mitv.upgrade` | Xiaomi background OTA service. |
| `com.mitv.tvhome.atv` | PatchWall recommendation and advertisement hub. |

---

## 4. Universal Default Home Handover & Stock Launcher Replacement

To permanently transition your TV to CleanYourTV Enhanced and prevent the stock launcher from intercepting the remote Home button:

```bash
# 1. Set CleanYourTV Enhanced as Default Home
adb shell cmd package set-home-activity --user 0 com.gathin.tvhome/.MainActivity

# 2. Disable Stock Google TV Launcher
adb shell pm disable-user --user 0 com.google.android.apps.tv.launcherx

# 3. Disable Google Setup Wizard (prevents stock onboarding prompts)
adb shell pm disable-user --user 0 com.google.android.tungsten.setupwraith

# 4. Enable CleanYourTV HomeKey accessibility service for 100% remote key interception
adb shell settings put secure enabled_accessibility_services com.gathin.tvhome/.HomeKeyService
adb shell settings put secure accessibility_enabled 1
```

---

## 5. What NEVER to Disable (Core Android TV Whitelist)
Do **NOT** disable these packages, as they provide critical hardware, audio, and network functionality:
* `com.android.bluetooth` — Required for remote control, soundbars, and headphones.
* `com.android.tv.settings` — Required for Wi-Fi, display, and sound system menus.
* `com.google.android.apps.mediashell` — Chromecast built-in / Google Cast receiver.
* `com.google.android.tv.remote.service` — Google TV phone mobile app remote control.
* `com.google.android.gms` — Google Play Services (push notifications, auth, DRM).
* `android.uid.system:1000` / system framework — Core OS kernel and hardware audio/video pipelines.

