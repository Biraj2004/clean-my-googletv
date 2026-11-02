# Release Notes: Clean My GoogleTV (Universal Suite)

---

## Release Tag: `v1.0.0-enhanced`
* **Release Type**: Production / Stable Universal Release  
* **Target Platforms**: Google TV & Android TV (Android 8.0 Oreo through Android 14)  
* **Supported Architectures**: `armeabi-v7a` (32-bit ARM) & `arm64-v8a` (64-bit ARM)  
* **Compatibility Tested**: Sony BRAVIA (BF1, XR, X80), Chromecast with Google TV (4K & HD), Walmart onn. 4K / 4K Pro, TCL Google TV, Hisense Google TV, Nvidia Shield TV  
* **Root Required**: **NO** (100% User Space `--user 0`)  
* **System Partition Modifications**: **NONE** (dm-verity and AVB 2.0 fully untouched)

---

## Executive Summary

This release delivers the complete standalone **CleanMyGoogleTV Enhanced Suite** — an ultra-lightweight, tvOS-inspired spatial launcher accompanied by 6 specialized modular background add-ons and Webmote. 

This build solves core usability issues found in stock Google TV and vanilla CleanYourTV by introducing:
1. An integrated **Live Task Manager** with 1-click **"Close all"** memory cleaner.
2. A symmetrical **4+2 Quick Actions Top Bar** with dynamic auto-sizing metrics (`autoSizeTextType="uniform"`).
3. Complete **Multi-Density Crisp Raster Icons** (`mdpi` to `xxxhdpi` + Leanback banner) eliminating fallback blurriness.
4. Neutral **Cinematic White Focus Highlights** (`cinematic_white_focus: true`) removing distracting color tints.
5. Permanent **Remote Key Interception (`HomeKeyService`)** preventing unwanted returns to stock Google TV.

---

## Binary Manifest & Cryptographic Integrity

All APKs below are located directly in the [`apk/`](apk/) directory:

| Filename | Package Name (Application ID) | Version | File Size | SHA256 Checksum |
| :--- | :--- | :---: | :---: | :--- |
| `cleanyourtv-enhanced.apk` | `com.gathin.tvhome` | 3.3 (12) | 639,229 B | `CB99E59F20EBEFC678DC9106E1422A08E95F4C7512557C988A68F895E21ACEE6` |
| `addon-bluetooth-toggle.apk` | `io.github.justinnewman.bluetoothtoggle` | 1.0 (1) | 17,676 B | `207C91EA94E8CD0EE772CAEC86FE7C86BF0B0B5733BE3185C5D99B30D82673FF` |
| `addon-bluetooth-connect.apk` | `com.gathin.btconnect` | 0.1 (1) | 14,020 B | `03385DAB27ADE4ABB47E7E06771EED87BE5D3B34AF2575AF0AA239C6EFCB9008` |
| `addon-headphones.apk` | `io.github.maxhayim.headphones` | 0.1 (1) | 24,548 B | `031836F1681292216690DB95A11796793B108F879D691C98F6E51405D4C2D2F0` |
| `addon-capacity-stats.apk` | `com.lionlev.tv.capacity` | 1.0 (1) | 13,316 B | `CE1497035B5DFAC1D601A8814EEE607085EF3317EC999F8226BB056ED520250E` |
| `addon-airplay-status.apk` | `io.github.maxhayim.airplaystatus` | 0.1 (1) | 15,700 B | `B7DA86D433D7013107C659588C502CD9076D65CA482ED46E041E8C4C681F90BC` |
| `webmote.apk` | `com.maxhayim.webmote` | 0.3.0 | 57,132 B | `CC64443B139624B61FB39D02FDBE8BF931C27711C71EB6C01203260609DD4387` |

---

## Detailed Specifications of Enhanced Binaries & Add-ons

### 1. `cleanyourtv-enhanced.apk` (`com.gathin.tvhome`)
* **Core Role**: Primary spatial launcher replacing stock Google TV (`launcherx`).
* **Android Target**: Min SDK 26 (Android 8.0) · Target SDK 34 (Android 14).
* **RAM Footprint**: **~47 MB** (compared to stock Google TV's ~376 MB).
* **Key Enhancements in this Build**:
  - **Symmetrical 4+2 Quick Bar**:
    - **Top Row (4 items)**: `Inputs` · `Wi-Fi` · `Bluetooth` · `Screensaver` (circular button)
    - **Bottom Row (2 items)**: `RAM & Storage Stats Pill` · `Settings`
  - **Snug-Fit Live Telemetry Pill**:
    - Embedded Android auto-sizing text view (`autoSizeTextType="uniform"` between `10sp` and `13.5sp`).
    - Eliminates horizontal text clipping on high-density displays and displays live `RAM % (Available RAM) · Storage %`.
  - **Live Task Manager & Memory Reclaimer**:
    - Clicking the Stats Pill opens a frosted-glass popup powered by `UsageStatsManager`.
    - Features a 1-click **"Close all"** button that safely kills non-system background applications using `am.killBackgroundProcesses()`.
    - Includes a built-in safety whitelist protecting System UI, Bluetooth audio, TV input methods, and remote controllers.
    - Emits a responsive Toast notification (`"Closed X background apps"`) and forces an immediate stats refresh.
  - **Crisp Multi-Density App Icon Set**:
    - Includes hand-optimized 32-bit raster PNG mipmaps for `mdpi`, `hdpi`, `xhdpi`, `xxhdpi`, and `xxxhdpi`, plus a standard 320x180 Android Leanback banner.
  - **Wallpaper Decoding Engine**:
    - Upgraded 32-bit ARGB_8888 bitmap decoding with true color preservation and customizable darkening (`wallpaper_dim: 35`).
  - **HomeKey Accessibility Intercept**:
    - Intercepts remote `KEYCODE_HOME` and `KEYCODE_BACK` events via `HomeKeyService` to prevent returning to stock Google TV.
    - Listens for remote Settings keycodes (`176, 312, 82, 83`) to open the Quick Settings overlay directly.

---

### 2. `addon-bluetooth-toggle.apk` (`io.github.justinnewman.bluetoothtoggle`)
* **Role**: On-screen Bluetooth quick controller.
* **Permissions Required**: `android.permission.BLUETOOTH_CONNECT`
* **Features**:
  - Clicking the Bluetooth pill opens a frosted-glass menu with 3 instantaneous actions:
    1. **Toggle Bluetooth ON/OFF** live.
    2. **Pair New Accessory** (triggers native Bluetooth discovery dialog).
    3. **Bluetooth Accessories Settings** (direct shortcut to Android TV Bluetooth menu).

---

### 3. `addon-bluetooth-connect.apk` (`com.gathin.btconnect`)
* **Role**: Direct accessory connection manager.
* **Features**:
  - Provides instant background reconnection to previously paired Bluetooth audio accessories (soundbars, wireless earbuds, gaming controllers).
  - Eliminates having to navigate through deep Android TV settings submenus.

---

### 4. `addon-headphones.apk` (`io.github.maxhayim.headphones`)
* **Role**: Audio output routing switcher.
* **Features**:
  - Toggles audio routing between TV internal speakers and connected Bluetooth headphones with a single click.
  - Automatically restores default TV speaker output when Bluetooth headphones are powered down.

---

### 5. `addon-capacity-stats.apk` (`com.lionlev.tv.capacity`)
* **Role**: Live system telemetry provider.
* **Features**:
  - Queries `ActivityManager.MemoryInfo` and `StatFs` for internal flash storage.
  - Broadcasts capacity updates to the launcher stats pill every 30 seconds without generating noticeable CPU or battery load.

---

### 6. `addon-airplay-status.apk` (`io.github.maxhayim.airplaystatus`)
* **Role**: Cast & screen mirroring status receiver.
* **Features**:
  - Listens for active casting sessions and displays an unobtrusive indicator when a phone, tablet, or PC is streaming media to the TV.

---

### 7. `webmote.apk` (`com.maxhayim.webmote`)
* **Role**: Zero-install local Wi-Fi web browser remote control.
* **Features**:
  - Spawns a lightweight local HTTP server on the TV.
  - Anyone connected to the same Wi-Fi can navigate to `http://<TV_IP>:8080` on their smartphone or laptop browser to control D-pad navigation, volume, Home, Back, and enter text via their phone keyboard.

---

## Required Android Permissions Matrix

The enhanced launcher and add-ons require the following standard permissions, automatically configured by `apk/install_all_apks.bat`:

```bash
# 1. Allow launcher to modify secure system toggles
adb shell pm grant com.gathin.tvhome android.permission.WRITE_SECURE_SETTINGS

# 2. Allow launcher and toggle add-on to query Bluetooth states
adb shell pm grant com.gathin.tvhome android.permission.BLUETOOTH_CONNECT
adb shell pm grant io.github.justinnewman.bluetoothtoggle android.permission.BLUETOOTH_CONNECT

# 3. Allow Task Manager to query active background tasks
adb shell appops set com.gathin.tvhome GET_USAGE_STATS allow

# 4. Enable accessibility service for remote button intercept
adb shell settings put secure enabled_accessibility_services com.gathin.tvhome/.HomeKeyService
adb shell settings put secure accessibility_enabled 1
```

---

## Comparison: Stock Google TV vs. Upstream CleanYourTV vs. CleanMyGoogleTV Enhanced

| Feature / Metric | Stock Google TV | Upstream CleanYourTV (Vanilla) | CleanMyGoogleTV (Enhanced) |
| :--- | :---: | :---: | :---: |
| **Launcher RAM Footprint** | ~376 MB | ~48 MB | **~47 MB** |
| **Idle Available RAM** | ~700 MB | ~1,100 MB | **~1,215 MB (+515 MB freed)** |
| **Commercial Video Ads & Carousels** | Yes (Heavy) | No | **Zero Ads** |
| **Live Task Manager & RAM Cleaner** | None | None | **Yes (1-Click "Close all")** |
| **Snug-Fit Auto-Sizing Stats Pill** | N/A | Truncated on high DPI | **Auto-sizing (`10sp` to `13.5sp`)** |
| **Crisp Multi-Density App Icons** | Standard | Missing / Blurry fallbacks | **Full `mdpi`–`xxxhdpi` + Leanback** |
| **Focus Highlight Aesthetics** | Stock Blue | Tinted Ambient Glow | **Neutral Frosted White Glass** |
| **Remote Home Key Lockout** | Stock Google | Often bounces back to stock | **100% Intercept via HomeKey** |
| **Direct Settings Key Binding** | None | Manual setup required | **Native Key Binding (`176, 312`)** |

---

## Upstream Modification & Development Notice

If you wish to modify the launcher source code, recompile add-ons with custom features, or build brand new modules:
* The full source tree is available in [`cleanyourtv_repo/`](cleanyourtv_repo/).
* Main launcher project: [`cleanyourtv_repo/launcher/`](cleanyourtv_repo/launcher/)
* Add-ons project tree: [`cleanyourtv_repo/addons/`](cleanyourtv_repo/addons/)
* Compiling any module:
  ```bash
  cd cleanyourtv_repo/launcher
  ./gradlew assembleRelease
  ```

