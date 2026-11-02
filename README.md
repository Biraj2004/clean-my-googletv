# Clean My GoogleTV (Universal Edition)

<div align="center">

![Platform](https://img.shields.io/badge/Platform-Google%20TV%20%7C%20Android%20TV-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Architectures](https://img.shields.io/badge/Architectures-armeabi--v7a%20%7C%20arm64--v8a-FF6F00?style=for-the-badge&logo=arm&logoColor=white)
[![Latest Release](https://img.shields.io/badge/Release-v1.0.0--enhanced-7928CA?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Biraj2004/clean-my-googletv/releases/tag/v1.0.0-enhanced)
![Root](https://img.shields.io/badge/Root-NOT%20REQUIRED-success?style=for-the-badge&logo=shield&logoColor=white)
![Warranty](https://img.shields.io/badge/Warranty-100%25%20SAFE%20%26%20REVERSIBLE-blue?style=for-the-badge&logo=checkmarx&logoColor=white)

<p align="center">
  <b>A universal, bloat-free performance optimization suite, tvOS-inspired spatial launcher, live memory task cleaner, and automated 1-click modular setup for ANY Google TV and Android TV device.</b>
</p>

[**Download Release v1.0.0-enhanced**](https://github.com/Biraj2004/clean-my-googletv/releases/tag/v1.0.0-enhanced) · [**Master Prompt**](MASTER_PROMPT.md) · [**Release Notes**](RELEASE_NOTES.md) · [**Debloat Matrix**](guide/Universal_Google_TV_Debloat_Guide.md) · [**Connection Guide**](guide/Connection_and_Debugging_Guide.md)

</div>

---

## Table of Contents

- [Before vs. After: The Transformation](#before-vs-after-the-transformation)
- [Visual Showcase & UI Tour](#visual-showcase--ui-tour)
  - [Clean Homescreen with 4K Wallpaper](#clean-homescreen-with-4k-wallpaper)
  - [Dual-Row Symmetrical Quick Bar](#dual-row-symmetrical-quick-bar)
  - [Live Task Manager & RAM Cleaner](#live-task-manager--ram-cleaner)
  - [TV Inputs & System Quick Panels](#tv-inputs--system-quick-panels)
  - [Settings Dashboard & Apps Manager](#settings-dashboard--apps-manager)
- [Key Features & Enhancements](#key-features--enhancements)
- [Universal Hardware Compatibility Matrix](#universal-hardware-compatibility-matrix)
- [Warranty, Safety & AVB Integrity](#warranty-safety--avb-integrity)
- [1-Click Quick Start Guide](#1-click-quick-start-guide)
  - [Step 1: Enable USB / Network Debugging](#step-1-enable-usb--network-debugging)
  - [Step 2: Run Universal 1-Click Installer](#step-2-run-universal-1-click-installer)
  - [Step 3: Multi-Tier Debloating](#step-3-multi-tier-debloating)
- [Enhanced APKs & Add-ons Directory](#enhanced-apks--add-ons-directory)
- [Repository Structure & Codebase Map](#repository-structure--codebase-map)
- [100% Reversibility & Emergency Restore](#100-reversibility--emergency-restore)
- [Comprehensive Documentation Index](#comprehensive-documentation-index)
- [Credits & Upstream Repositories](#credits--upstream-repositories)
- [License](#license)

---

## Before vs. After: The Transformation

Transform sluggish, ad-saturated Google TV interfaces into a lightning-fast, privacy-respecting, tvOS-inspired entertainment hub with zero ads and **+500 MB to +1 GB of free RAM**.

<div align="center">
  <table>
    <tr>
      <th align="center"><b>STOCK GOOGLE TV (BEFORE)</b><br/><i>Bloatware, sponsored carousels, auto-playing video teasers & ~376MB launcher RAM</i></th>
      <th align="center"><b>CLEAN MY GOOGLE TV (AFTER)</b><br/><i>Pristine 4K spatial design, custom wallpaper, live task cleaner & ~47MB launcher RAM</i></th>
    </tr>
    <tr>
      <td width="50%"><a href="images/stock_google_tv_before.png"><img src="images/stock_google_tv_before.png" alt="Stock Google TV Before" /></a></td>
      <td width="50%"><a href="images/clean_home_after.png"><img src="images/clean_home_after.png" alt="Clean Google TV After" /></a></td>
    </tr>
  </table>
</div>

---

## Visual Showcase & UI Tour

### Clean Homescreen with 4K Wallpaper
> Zero sponsored ads, zero recommendation clutter, pure 4K spatial design with custom Mountain Lake wallpaper ([`images/wallpaper_only.jpg`](images/wallpaper_only.jpg)), fixed dock, and symmetrical top controls.

[![Showcase Home](images/showcase_home.png)](images/showcase_home.png)

---

### Dual-Row Symmetrical Quick Bar
> **Row 1:** `[Inputs]` · `[Wi-Fi]` · `[Bluetooth]` · `[Screensaver Circle]`  
> **Row 2:** `[RAM & Storage Live Stats Pill (Snug Fit)]` · `[Settings]`  
> Engineered with native Android auto-sizing text (`autoSizeTextType="uniform"`) so live capacity figures never truncate across any screen density or font scale.

[![Quick Actions Bar](images/quick_actions_bar.png)](images/quick_actions_bar.png)

---

### Live Task Manager & RAM Cleaner
> Real-time background task monitoring with 1-click **"Close all"** and individual app kill buttons. Safely reclaims memory while preserving essential audio, input, and remote services.

<div align="center">
  <table>
    <tr>
      <th align="center"><b>Frosted Glass Task Popup</b></th>
      <th align="center"><b>Background Process Cleaner in Action</b></th>
    </tr>
    <tr>
      <td width="50%"><a href="images/task_manager_popup.png"><img src="images/task_manager_popup.png" alt="Task Manager Popup" /></a></td>
      <td width="50%"><a href="images/background_task_cleaner.png"><img src="images/background_task_cleaner.png" alt="Background Task Cleaner" /></a></td>
    </tr>
  </table>
</div>

---

### TV Inputs & System Quick Panels
<div align="center">
  <table>
    <tr>
      <th align="center"><b>Direct HDMI & Live TV Switcher</b></th>
      <th align="center"><b>System Quick Settings Panel</b></th>
      <th align="center"><b>1-Press Bluetooth Quick Menu</b></th>
    </tr>
    <tr>
      <td><a href="images/inputs_panel.png"><img src="images/inputs_panel.png" width="300" alt="Inputs Panel" /></a></td>
      <td><a href="images/quick_settings_panel.png"><img src="images/quick_settings_panel.png" width="300" alt="Quick Settings Panel" /></a></td>
      <td><a href="images/bluetooth_panel.png"><img src="images/bluetooth_panel.png" width="300" alt="Bluetooth Panel" /></a></td>
    </tr>
  </table>
</div>

---

### Settings Dashboard & Apps Manager
<div align="center">
  <table>
    <tr>
      <th align="center"><b>Full Quick Settings & Dashboard</b></th>
      <th align="center"><b>Clean Application Grid / Library</b></th>
      <th align="center"><b>Remotes & Accessories Settings</b></th>
    </tr>
    <tr>
      <td><a href="images/quick_settings_fullscreen.png"><img src="images/quick_settings_fullscreen.png" width="300" alt="Quick Settings Fullscreen" /></a></td>
      <td><a href="images/apps_manager_view.png"><img src="images/apps_manager_view.png" width="300" alt="Apps Manager View" /></a></td>
      <td><a href="images/remotes_accessories_settings.png"><img src="images/remotes_accessories_settings.png" width="300" alt="Remotes & Accessories" /></a></td>
    </tr>
  </table>
</div>

---

## Key Features & Enhancements

1. **Complete Google TV Bloatware Stripped**:
   - Disables telemetry and tracking daemons including `tv.samba.ssm` (Automated Content Recognition) and `com.google.android.partnersetup` (RLZ attribution pings).
   - Eliminates launcher lag, sponsored video feeds, auto-playing trailers, and unwanted Google recommendation carousels.
2. **Snug-Fit Real-Time Stats Pill**:
   - Replaces fixed, truncated labels with dynamically auto-sized text (`autoSizeTextType="uniform"` between `10sp` and `13.5sp`).
   - Displays live `RAM % (Available RAM) · Storage %` with clean, snug alignment across all font scaling options.
3. **Active Task Manager & Memory Reclaimer**:
   - Tracks live active tasks via Android `UsageStatsManager`.
   - 1-click **"Close all"** safely frees background memory and immediately refreshes system stats.
   - Built-in safe-kill whitelist protects system UI, Bluetooth audio, TV input methods, and remote controllers.
4. **Crisp Multi-Density App Icon Suite**:
   - Fully resolves missing icon fallbacks by providing crisp 32-bit raster PNG mipmaps across all standard Android densities (`mdpi`, `hdpi`, `xhdpi`, `xxhdpi`, `xxxhdpi`) plus a standard 320x180 Leanback banner.
   - Guaranteed pixel-perfect rendering across Android TV Leanback, Toast notifications, App Details, and Recent Apps menus.
5. **Wallpaper Purity & Neutral Accents**:
   - Disables dynamic app-specific color tinting (`ambient_glow: false`, `cinematic_white_focus: true` in [`theme_config.json`](theme_config.json)). Focus highlights remain clean frosted glass without bathing the screen in distracting color shifts.
   - Enhanced 32-bit ARGB_8888 wallpaper decoding with `wallpaper_dim: 35` for optimal readability and contrast.
6. **100% Remote Key Interception (`HomeKeyService`)**:
   - Default Home mapped permanently to CleanYourTV Enhanced. Pressing the Home button on any remote will **never** return you to the stock Google TV launcher.
   - Dedicated Settings remote key mapped (`176, 312, 82, 83`) to open the Quick Settings overlay panel directly.
7. **Native Bluetooth Quick Menu**:
   - Clicking the Bluetooth pill opens a custom smoked frosted-glass menu with 3 options: Live Turn On/Off toggle, Pair accessory, and a Direct shortcut to Bluetooth Accessories Settings.
8. **Firmware Update Prevention (Anti-OTA)**:
   - System updates disabled in user space via `com.mediatek.tv.systemupdater` and vendor update centers.
   - Automatic background download flag disabled (`settings put global ota_disable_automatic_update 1`).
   - Network DNS domain blocking guide provided in [`guide/Tier3_Network_Block_Guide.md`](guide/Tier3_Network_Block_Guide.md).
9. **Physical Ports & Hardware Parity Preserved**:
   - Full hardware integrity maintained: USB mass storage, external HDD/SSD mounting (`vold`), HDMI 1–4, eARC, HDMI-CEC, analog AV in, DVB tuner, Ethernet, Wi-Fi, and Bluetooth accessories remain 100% functional.

---

## Universal Hardware Compatibility Matrix

This suite is engineered to run seamlessly across all major Google TV and Android TV devices:

| Manufacturer / Brand | Notable Tested Models | Architecture | Supported Android Versions |
| :--- | :--- | :---: | :--- |
| **Sony BRAVIA** | BRAVIA 2 (`K-43S22BM2`), X80, X85, X90, XR-series, A80, A90 | `armeabi-v7a` | Android 9, 10, 11, 12, 14 |
| **Google** | Chromecast with Google TV (4K), Chromecast (HD), Google TV Streamer | `armeabi-v7a` / `arm64-v8a` | Android 10, 11, 12, 14 |
| **Walmart onn.** | onn. Google TV 4K Streaming Box, onn. 4K Pro Streaming Box | `armeabi-v7a` | Android 11, 12, 14 |
| **TCL** | TCL C-Series, P-Series, Q-Series Google TVs | `armeabi-v7a` | Android 11, 12 |
| **Hisense** | Hisense U6, U7, U8, A6 Series Google TVs | `armeabi-v7a` | Android 11, 12 |
| **Nvidia** | Nvidia Shield TV, Nvidia Shield TV Pro | `arm64-v8a` | Android 9, 11 (Shield Experience 9+) |
| **Xiaomi** | Mi TV Stick 4K, Mi Box S (2nd Gen), Xiaomi TV series | `armeabi-v7a` | Android 9, 10, 11 |
| **Philips** | Philips Ambilight Android TV & Google TV series | `armeabi-v7a` | Android 10, 11, 12 |

---

## Warranty, Safety & AVB Integrity

> [!NOTE]
> ### Will these optimizations void my TV warranty?
> **Short Answer: NO, absolutely not.**

### Detailed Technical Analysis:
1. **Zero Root Access Required (`No Su / No Bootloader Unlock`)**:
   - Everything is achieved using official, standard Android developer APIs (`pm disable-user`, `cmd package set-home-activity`, and `appops`).
   - The bootloader remains locked, system partitions (`/system`, `/vendor`) remain untouched read-only images, and dm-verity status is unmodified.
2. **100% Reversible with a Standard Factory Reset or Script**:
   - All package disabling happens at the user profile level (`--user 0`).
   - Running [`backup/restore_all.bat`](backup/restore_all.bat) or [`backup/restore_all.ps1`](backup/restore_all.ps1) re-enables all apps instantly over ADB.
   - Performing a standard TV Factory Reset (via Settings or by holding the TV's physical power button on boot) wipes user profile data and instantly restores all factory apps to their out-of-the-box state.
3. **Consumer Warranty Protection**:
   - Manufacturer warranties cover hardware, panel, power supply, and factory software integrity. Disabling user-space bloatware through standard developer tools does not void your hardware warranty.

---

## 1-Click Quick Start Guide

### Step 1: Enable USB / Network Debugging
1. On your TV, navigate to **Settings → System → About**.
2. Click **Android TV OS Build** 7 times until you see `"You are now a developer!"`.
3. Go back to **Settings → System → Developer Options**:
   - Turn **USB Debugging** = **ON**.  
   *(On Android TV, enabling USB Debugging automatically commands `adbd` to listen on TCP port 5555 over Wi-Fi/Ethernet. See [`guide/Connection_and_Debugging_Guide.md`](guide/Connection_and_Debugging_Guide.md) for technical breakdown).*
4. Find your TV's local IP address in **Settings → Network & Internet** (e.g. `192.168.1.50`).

---

### Step 2: Run Universal 1-Click Installer

1. Clone or download this repository on your computer:
   ```bash
   git clone https://github.com/Biraj2004/clean-my-googletv.git
   cd clean-my-googletv
   ```
2. Run the universal installer:
   ```cmd
   apk\install_all_apks.bat
   ```
   *The script will automatically detect any connected ADB device or prompt you for your TV's IP address.*

3. Look at your TV screen and select **"Always allow from this computer"** → **Allow**.

4. The script will automatically:
   - Identify your TV model and CPU architecture.
   - Download the latest ARM releases of [SmartTube](https://github.com/yuliskov/SmartTube), [Stremio](https://www.stremio.com), [Nuvio TV](https://nuvio.tv), and [BitChord TV](https://bitchord.org) from official sources.
   - Install **CleanYourTV Enhanced** and all modular add-ons from [`apk/`](apk/).
   - Grant required permissions (`WRITE_SECURE_SETTINGS`, `BLUETOOTH_CONNECT`, `GET_USAGE_STATS`).
   - Enable `HomeKeyService` accessibility service and set CleanYourTV as default Home.
   - Push and configure the Nature Calm wallpaper at dim 35.

---

### Step 3: Multi-Tier Debloating

To eliminate telemetry and reclaim RAM, run the universal debloat commands (detailed in [`guide/Universal_Google_TV_Debloat_Guide.md`](guide/Universal_Google_TV_Debloat_Guide.md)):

```bash
# Disable Google telemetry and tracking
adb shell pm disable-user --user 0 tv.samba.ssm
adb shell pm disable-user --user 0 com.google.android.feedback
adb shell pm disable-user --user 0 com.google.android.partnersetup
adb shell pm disable-user --user 0 com.google.android.tvrecommendations

# Disable stock Google TV launcher & setup wizard
adb shell pm disable-user --user 0 com.google.android.apps.tv.launcherx
adb shell pm disable-user --user 0 com.google.android.tungsten.setupwraith

# Prevent automatic OTA background updates
adb shell settings put global ota_disable_automatic_update 1
```

---

## Enhanced APKs & Add-ons Directory

All binaries below are available for direct download on the [**GitHub Releases Page (v1.0.0-enhanced)**](https://github.com/Biraj2004/clean-my-googletv/releases/tag/v1.0.0-enhanced):

| Component | Package Name | Direct Download | Size | SHA256 Checksum |
| :--- | :--- | :---: | :---: | :--- |
| **CleanYourTV Enhanced** | `com.gathin.tvhome` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/cleanyourtv-enhanced.apk) | 624 KB | `CB99E59F20EBEFC678DC9106E1422A08E95F4C7512557C988A68F895E21ACEE6` |
| **Bluetooth Toggle** | `io.github.justinnewman.bluetoothtoggle` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/addon-bluetooth-toggle.apk) | 17.2 KB | `207C91EA94E8CD0EE772CAEC86FE7C86BF0B0B5733BE3185C5D99B30D82673FF` |
| **Bluetooth Connect** | `com.gathin.btconnect` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/addon-bluetooth-connect.apk) | 13.6 KB | `03385DAB27ADE4ABB47E7E06771EED87BE5D3B34AF2575AF0AA239C6EFCB9008` |
| **Headphones Routing** | `io.github.maxhayim.headphones` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/addon-headphones.apk) | 23.9 KB | `031836F1681292216690DB95A11796793B108F879D691C98F6E51405D4C2D2F0` |
| **Capacity Stats** | `com.lionlev.tv.capacity` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/addon-capacity-stats.apk) | 13.0 KB | `CE1497035B5DFAC1D601A8814EEE607085EF3317EC999F8226BB056ED520250E` |
| **AirPlay Status** | `io.github.maxhayim.airplaystatus` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/addon-airplay-status.apk) | 15.3 KB | `B7DA86D433D7013107C659588C502CD9076D65CA482ED46E041E8C4C681F90BC` |
| **Webmote Controller** | `com.maxhayim.webmote` | [**Download APK**](https://github.com/Biraj2004/clean-my-googletv/releases/download/v1.0.0-enhanced/webmote.apk) | 55.7 KB | `CC64443B139624B61FB39D02FDBE8BF931C27711C71EB6C01203260609DD4387` |

---

## Repository Structure & Codebase Map

```text
clean-my-googletv/
├── MASTER_PROMPT.md                # 9-Phase one-shot automation blueprint for AI agents & engineers
├── RELEASE_NOTES.md                # Cryptographic checksums, package IDs, and version changelog
├── README.md                       # Comprehensive showcase, documentation & quick start guide
├── theme_config.json               # Cinematic white focus & true-color wallpaper configuration
├── .gitignore                      # Ignore build caches, python virtualenvs, and IDE files
├── apk/
│   ├── install_all_apks.bat        # 1-Click batch installer with dynamic IP & ABI detection
│   └── *.apk                       # Binary releases (tracked via GitHub Releases)
├── backup/
│   ├── restore_all.bat             # 1-Click batch emergency restore & default launcher reset
│   ├── restore_all.ps1             # PowerShell universal emergency restore script
│   ├── getprop.txt                 # Sanitized baseline system properties
│   └── settings_*.txt              # Sanitized global, secure, and system settings dumps
├── guide/
│   ├── Universal_Google_TV_Debloat_Guide.md  # Multi-brand debloat matrix (Sony, TCL, Hisense, etc.)
│   ├── Connection_and_Debugging_Guide.md     # Wireless ADB connection flow & port 5555 guide
│   ├── Final_Debloat_and_Customization_Report.md # Before vs. After RAM and performance report
│   ├── Stop_TV_Firmware_Updates_Plan.md      # Multi-tier anti-OTA firmware freeze plan
│   ├── Tier3_Network_Block_Guide.md          # Router, Pi-hole & AdGuard DNS blocking rules
│   ├── TV_Before_Debloat.md                  # Pre-debloat audit, hardware specs, and baseline
│   └── tier1_packages.txt                    # Raw manifest of safe telemetry packages
├── images/                         # 14 Full-resolution UI captures, panels & 4K wallpapers
└── cleanyourtv_repo/               # Full upstream Android Studio project & addon source tree
    ├── launcher/                   # CleanYourTV Enhanced Android application project
    ├── addons/                     # 30+ Modular background add-on provider projects
    ├── themes/                     # Theme packages (nature-calm, minimal, glass, aurora, etc.)
    └── tools/                      # Diagnostic and automation scripts (tv.py, check.py, etc.)
```

---

## 100% Reversibility & Emergency Restore

If you ever wish to return your TV to 100% stock factory settings:

### Option A: Automated ADB Restore (Preserves personal apps & logins)
Run the universal restore script from your PC:
* **Windows Batch**: [`backup/restore_all.bat`](backup/restore_all.bat)
* **PowerShell**: [`backup/restore_all.ps1`](backup/restore_all.ps1)

### Option B: Hardware Factory Reset (Zero PC required)
1. On your TV remote, press the **Settings** button.
2. Go to **System** → **About** → **Reset**.
3. Select **Factory data reset** → **Erase everything**.
4. The TV reboots in pristine out-of-the-box condition with all factory Google apps running.

---

## Comprehensive Documentation Index

| Document | Purpose / Scope |
| :--- | :--- |
| [**MASTER_PROMPT.md**](MASTER_PROMPT.md) | One-shot autonomous execution prompt for AI agents and engineers covering subnet discovery through verification. |
| [**RELEASE_NOTES.md**](RELEASE_NOTES.md) | Official release notes for `v1.0.0-enhanced` including SHA256 checksums, package IDs, and architecture details. |
| [**Universal Debloat Guide**](guide/Universal_Google_TV_Debloat_Guide.md) | Comprehensive package matrix for Sony, TCL, Hisense, onn., Xiaomi, and Chromecast. |
| [**Connection & Debugging Guide**](guide/Connection_and_Debugging_Guide.md) | Technical deep-dive on TV USB debugging behavior, subnet scanning, and port 5555. |
| [**Final Debloat & Customization Report**](guide/Final_Debloat_and_Customization_Report.md) | Quantitative Before vs. After memory benchmark (+515 MB RAM freed). |
| [**Firmware Updates Prevention Plan**](guide/Stop_TV_Firmware_Updates_Plan.md) | Multi-tier architectural strategy to freeze forced OTA firmware updates. |
| [**Tier 3 Network Block Guide**](guide/Tier3_Network_Block_Guide.md) | Router, Pi-hole, AdGuard Home, and NextDNS domain blocking configurations. |
| [**Pre-Debloat Device Audit**](guide/TV_Before_Debloat.md) | Initial baseline hardware analysis, Wi-Fi ownership audit, and stock application list. |
| [**Safe Tier 1 Package Manifest**](guide/tier1_packages.txt) | Raw package identifier list for 100% safe telemetry disabling. |

---

## Credits & Upstream Repositories

Special thanks and full credit to the original creators and open-source communities:

* **[CleanYourTV](https://github.com/Gathin23/cleanyourtv)** by [@Gathin23](https://github.com/Gathin23) — Upstream tvOS-inspired spatial launcher for Google TV.
* **[CleanYourTV Add-ons](https://github.com/justin-newman)** by [@justin-newman](https://github.com/justin-newman) — Modular system status and quick control providers.
* **[Webmote](https://github.com/maxhayim/webmote)** by [@maxhayim](https://github.com/maxhayim) — Browser-based local Wi-Fi remote controller for Android TV.
* **[SmartTube](https://github.com/yuliskov/SmartTube)** by [@yuliskov](https://github.com/yuliskov) — Open-source ad-free YouTube player for TV ([Releases](https://github.com/yuliskov/SmartTube/releases/latest)).
* **[Stremio](https://github.com/Stremio)** by the [Stremio Team](https://www.stremio.com) — Modern media aggregation engine ([Downloads](https://www.stremio.com/downloads)).
* **[Nuvio TV](https://github.com/NuvioMedia/NuvioTV)** by [NuvioMedia](https://nuvio.tv) — Streaming interface for Android TV ([Releases](https://github.com/NuvioMedia/NuvioTV/releases)).
* **[BitChord](https://github.com/kushagrasinghx/BitChord)** by [@kushagrasinghx](https://github.com/kushagrasinghx) — Hi-Res Music client with Apple TV interface ([Releases](https://github.com/kushagrasinghx/BitChord/releases)).

---

## License

This repository and custom enhancements are open-source and released under the **MIT License**. Third-party APKs, libraries, and upstream sub-modules belong to their respective copyright holders and open-source licenses.
