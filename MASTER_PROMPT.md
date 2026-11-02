# MASTER PROMPT: Universal Google TV & Android TV Transformation

> **Role & Persona**: You are an elite Android Systems Engineer and TV Optimization Specialist.  
> **Objective**: Execute an end-to-end, non-destructive, 100% reversible transformation of any connected Google TV or Android TV into a bloat-free, ultra-responsive, tvOS-inspired spatial entertainment experience.  
> **Primary Blueprint & Assets**: The `clean-my-googletv` repository (pre-built enhanced APKs, verified theme configurations, and safety guides).  
> **Source & Extension Guide**: The upstream `cleanyourtv_repo` repository (for custom source modifications, Gradle compilation, and additional add-on modules).  
> **Execution Mode**: **One-Shot Automated Execution** with automated device detection, verification at every phase, zero personal data exposure, and 100% reversibility.

---

## Instructions for the AI Agent / Engineer

When executing this master prompt, follow the 9 phases in strict chronological order. Never guess device parameters or hardcode static IP addresses. Interrogate the physical hardware via ADB, adapt dynamically to the device's CPU architecture and vendor quirks, and verify system integrity after every modification.

---

### Phase 1: Network Auto-Discovery & ADB Handshake

1. **Resolve ADB Binary**:
   - Check if `adb` is in `PATH`.
   - If not found, inspect `%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe` (Windows) or `~/Android/Sdk/platform-tools/adb` (Linux/macOS).
   
2. **Subnet Discovery**:
   - If a target TV IP is supplied as an argument or environment variable (`$env:TV_IP` or `%TV_IP%`), use it.
   - Otherwise, scan the local IPv4 `/24` subnet for open TCP port `5555`:
     ```powershell
     $localSubnet = ((Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -like "192.168.*" -or $_.IPAddress -like "10.*" }).IPAddress -split '\.')[0..2] -join '.'
     1..254 | ForEach-Object -Parallel {
         $ip = "$using:localSubnet.$_"
         $socket = New-Object System.Net.Sockets.TcpClient
         $async = $socket.BeginConnect($ip, 5555, $null, $null)
         if ($async.AsyncWaitHandle.WaitOne(100, $false)) {
             try { $socket.EndConnect($async); [PSCustomObject]@{ IP = $ip; Port = 5555 } } catch {}
         }
         $socket.Close()
     } -ThrottleLimit 50
     ```

3. **Establish Connection & Authorize**:
   - Connect to the discovered TV:
     ```bash
     adb connect <TV_IP>:5555
     ```
   - Check device authorization state:
     ```bash
     adb devices
     ```
   - If status reports `unauthorized`: Prompt the user to look at the TV screen, check **"Always allow from this computer"**, and click **"Allow"** with their remote.
   - Wait until state becomes `device`:
     ```bash
     adb -s <TV_IP>:5555 wait-for-device
     ```

---

### Phase 2: Hardware, Architecture & Network Safety Audit

Execute the following property queries and record the hardware profile:
```bash
adb -s <TV_IP>:5555 shell getprop ro.product.manufacturer
adb -s <TV_IP>:5555 shell getprop ro.product.model
adb -s <TV_IP>:5555 shell getprop ro.product.cpu.abi
adb -s <TV_IP>:5555 shell getprop ro.build.version.release
adb -s <TV_IP>:5555 shell wm size
adb -s <TV_IP>:5555 shell wm density
```

**Crucial Wi-Fi Safety Verification**:
Verify whether Wi-Fi configuration ownership is bound to the core system framework:
```bash
adb -s <TV_IP>:5555 shell "dumpsys wifi | grep -o 'cname=[^ ]*'"
```
*Requirement*: If result returns `cname=android.uid.system:1000`, Wi-Fi is managed by the OS kernel, meaning disabling Google setup wizards or stock launchers will **never** drop Wi-Fi connectivity.

---

### Phase 3: Non-Destructive Baseline Backup

Before making any system modifications, capture a full snapshot of the device into a local `backup/` directory:
1. **Initial Screen Capture**:
   ```bash
   adb -s <TV_IP>:5555 shell screencap -p /sdcard/stock_before.png
   adb -s <TV_IP>:5555 pull /sdcard/stock_before.png images/stock_google_tv_before.png
   adb -s <TV_IP>:5555 shell rm /sdcard/stock_before.png
   ```
2. **Package Manifest & Settings Dump**:
   ```bash
   adb -s <TV_IP>:5555 shell pm list packages -f > backup/packages_all.txt
   adb -s <TV_IP>:5555 shell pm list packages -d > backup/packages_disabled.txt
   adb -s <TV_IP>:5555 shell pm list packages -3 > backup/packages_third_party.txt
   adb -s <TV_IP>:5555 shell settings list global > backup/settings_global.txt
   adb -s <TV_IP>:5555 shell settings list secure > backup/settings_secure.txt
   adb -s <TV_IP>:5555 shell settings list system > backup/settings_system.txt
   adb -s <TV_IP>:5555 shell getprop > backup/getprop.txt
   ```
*(Sanitize personal identifiers like device serial numbers and MAC addresses from backup logs before committing).*

---

### Phase 4: Multi-Tier Safe Debloating & OTA Freeze

All operations use user-space disabling (`pm disable-user --user 0`). The physical APKs remain intact on `/system/priv-app/`, guaranteeing 100% reversibility.

1. **Tier 1: Telemetry & Automatic Content Recognition (ACR)**:
   ```bash
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 tv.samba.ssm
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.feedback
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.partnersetup
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.tvrecommendations
   ```

2. **Tier 2: Unused Google Preloaded Bloat**:
   ```bash
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.videos
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.youtube.tvmusic
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.play.games
   ```

3. **Tier 3: Manufacturer-Specific Bloat (Conditional)**:
   - **If Sony BRAVIA**:
     ```bash
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sony.dtv.promos
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sony.dtv.sonyselect
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sony.dtv.demosupport
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sony.dtv.demosystemsupport
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sony.dtv.multiscreendemo
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sonypicturescore
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.mediatek.tv.systemupdater
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.sony.gaus.updatecenter
     ```
   - **If TCL**:
     ```bash
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.tcl.partnercustomizer
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.tcl.useragreement
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.tcl.channel
     ```
   - **If Hisense**:
     ```bash
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.hisense.hitv.hicloud.account
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.hisense.tv.videoplayer
     ```
   - **If Xiaomi / Mi TV**:
     ```bash
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.xiaomi.mitv.upgrade
     adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.mitv.tvhome.atv
     ```

4. **Prevent Forced Background OTA Firmware Upgrades**:
   ```bash
   adb -s <TV_IP>:5555 shell settings put global ota_disable_automatic_update 1
   ```

---

### Phase 5: Enhanced Launcher & Modular Add-ons Deployment

Deploy the pre-compiled, enhanced binaries directly from `apk/`:

1. **Install Enhanced CleanYourTV Launcher**:
   ```bash
   adb -s <TV_IP>:5555 install -r apk/cleanyourtv-enhanced.apk
   ```

2. **Install Background Modular Add-ons**:
   ```bash
   adb -s <TV_IP>:5555 install -r apk/addon-bluetooth-toggle.apk
   adb -s <TV_IP>:5555 install -r apk/addon-bluetooth-connect.apk
   adb -s <TV_IP>:5555 install -r apk/addon-headphones.apk
   adb -s <TV_IP>:5555 install -r apk/addon-capacity-stats.apk
   adb -s <TV_IP>:5555 install -r apk/addon-airplay-status.apk
   adb -s <TV_IP>:5555 install -r apk/webmote.apk
   ```

3. **Install Modern Streaming Applications (Auto-downloaded from Official Sources)**:
   - Check if APKs exist locally; if not, download them based on target ABI:
     - **SmartTube Stable**: `https://github.com/yuliskov/SmartTube/releases/download/latest/smarttube_stable.apk`
     - **Stremio Android TV**: `https://dl.strem.io/android/v1.10.4-androidTV/com.stremio.one-1.10.4-31048580-armeabi-v7a.apk`
     - **Nuvio TV**: `https://github.com/NuvioMedia/NuvioTV/releases/download/1.0.0/app-full-armeabi-v7a-release.apk`
     - **BitChord TV**: `https://github.com/kushagrasinghx/BitChord/releases/download/v1.9/BitChordTV-v1.9_armeabi-v7a.apk`
   - Install downloaded APKs:
     ```bash
     adb -s <TV_IP>:5555 install -r apk/smarttube-stable.apk
     adb -s <TV_IP>:5555 install -r apk/stremio-tv-arm.apk
     adb -s <TV_IP>:5555 install -r apk/nuvio-tv-arm.apk
     adb -s <TV_IP>:5555 install -r apk/bitchord-tv-arm.apk
     ```

> [!TIP]
> **Source Code & Custom Add-ons**:
> If the user wishes to edit launcher source code, adjust layout dimensions, compile additional add-on modules (e.g. `frigate-glance`, `weather`, `smart-home`, `game-day`), or customize strings:
> - Refer to `cleanyourtv_repo/launcher` for the main Android TV Studio project.
> - Refer to `cleanyourtv_repo/addons/<addon-name>` for individual add-on source code.
> - Build modules with `./gradlew assembleRelease` and install the resulting `.apk` via ADB.

---

### Phase 6: System Permissions, Accessibility & Default Home Handover

1. **Grant Enhanced Launcher Permissions**:
   ```bash
   adb -s <TV_IP>:5555 shell pm grant com.gathin.tvhome android.permission.WRITE_SECURE_SETTINGS
   adb -s <TV_IP>:5555 shell pm grant com.gathin.tvhome android.permission.BLUETOOTH_CONNECT
   adb -s <TV_IP>:5555 shell pm grant io.github.justinnewman.bluetoothtoggle android.permission.BLUETOOTH_CONNECT
   adb -s <TV_IP>:5555 shell appops set com.gathin.tvhome GET_USAGE_STATS allow
   ```

2. **Enable HomeKey Accessibility Service**:
   Interprets and intercepts remote Home, Back, and Settings key events cleanly:
   ```bash
   adb -s <TV_IP>:5555 shell settings put secure enabled_accessibility_services com.gathin.tvhome/.HomeKeyService
   adb -s <TV_IP>:5555 shell settings put secure accessibility_enabled 1
   ```

3. **Set Default Home Activity & Retire Stock Launcher**:
   ```bash
   # Assign CleanYourTV Enhanced as the primary HOME intent
   adb -s <TV_IP>:5555 shell cmd package set-home-activity --user 0 com.gathin.tvhome/.MainActivity

   # Disable stock Google TV launcher
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.apps.tv.launcherx

   # Disable Google setup wizard (prevents onboarding loop)
   adb -s <TV_IP>:5555 shell pm disable-user --user 0 com.google.android.tungsten.setupwraith
   ```

---

### Phase 7: Wallpaper, Themes & Quick Bar Symmetry

1. **Deploy Mountain Lake 4K Wallpaper**:
   ```bash
   adb -s <TV_IP>:5555 push images/wallpaper_only.jpg /sdcard/Android/data/com.gathin.tvhome/files/wallpaper.jpg
   adb -s <TV_IP>:5555 shell "chmod 666 /sdcard/Android/data/com.gathin.tvhome/files/wallpaper.jpg"
   ```

2. **Apply Verified `theme_config.json`**:
   Verify configuration settings:
   ```json
   {
     "wallpaper": true,
     "wallpaper_dim": 35,
     "wallpaper_rotation_minutes": 0,
     "wallpaper_captions": false,
     "wallpaper_true_color": true,
     "ambient_glow": false,
     "app_glow": false,
     "cinematic_white_focus": true,
     "settings_key_panel": true,
     "settings_key_keycodes": [176, 312, 82, 83],
     "restore_key_services": true
   }
   ```

3. **Launch and Verify Homescreen**:
   ```bash
   adb -s <TV_IP>:5555 shell am start -S -n com.gathin.tvhome/.MainActivity
   ```

---

### Phase 8: Verification & Health Checks

Perform an automated verification sweep across 5 core areas:
1. **Memory Recovery**:
   ```bash
   adb -s <TV_IP>:5555 shell dumpsys meminfo com.gathin.tvhome | grep "TOTAL PSS"
   adb -s <TV_IP>:5555 shell cat /proc/meminfo | grep -E "MemTotal|MemAvailable"
   ```
   *Expected Result*: Launcher RAM footprint `< 55 MB`. Available RAM increased by `+400 MB to +1,000 MB`.

2. **Task Manager Validation**:
   - Tap the **RAM & Storage Stats Pill** on the Quick Bar.
   - Verify the frosted glass popup opens with active background apps and the **"Close all"** button.
   - Trigger **"Close all"**; verify toast notification appears and stats refresh immediately.

3. **Remote Control Keys**:
   - Press **HOME**: Verify it stays on CleanYourTV Enhanced.
   - Press **SETTINGS**: Verify the Quick Settings overlay panel opens directly.

4. **Hardware & Subsystems**:
   - Inputs switcher: HDMI 1–4, eARC, and Live TV.
   - Audio output: TV speakers & Bluetooth headphones.
   - Google Cast: Test casting a video stream from YouTube mobile app.

5. **Capture Verification Screenshot**:
   ```bash
   adb -s <TV_IP>:5555 shell screencap -p /sdcard/clean_after.png
   adb -s <TV_IP>:5555 pull /sdcard/clean_after.png images/clean_home_after.png
   adb -s <TV_IP>:5555 shell rm /sdcard/clean_after.png
   ```

---

### Phase 9: 100% Reversibility Protocol

Every modification made in this procedure can be reverted in seconds:

#### Method A: 1-Click ADB Rollback Script
Run `backup/restore_all.bat` (or `backup/restore_all.ps1`). It will:
- Re-enable all stock Google TV packages (`pm enable --user 0 <pkg>`).
- Re-enable vendor-specific packages (Sony, TCL, Hisense, etc.).
- Set default Home back to `com.google.android.apps.tv.launcherx`.
- Reset OTA flag `ota_disable_automatic_update = 0`.

#### Method B: TV Hardware Factory Reset (Zero PC Required)
- Go to **Settings → System → About → Reset → Factory data reset**.
- Because read-only system partitions were never altered, the TV will reboot into factory stock condition with all original apps running.

