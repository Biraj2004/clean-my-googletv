# Clean My GoogleTV — Release `v1.0.0-enhanced`

A bloat-free, tvOS-inspired spatial launcher and modular add-on suite for any Google TV / Android TV device. 100% reversible, zero root required.

---

## Key Highlights

* **Ultra-Lightweight & Ad-Free**: Cuts launcher RAM footprint from ~376 MB down to **~47 MB**, freeing **+500 MB to +1.2 GB** of idle system memory with zero ads, sponsored feeds, or tracking.
* **Live Task Manager & Memory Reclaimer**: Integrated frosted-glass background task cleaner with 1-click **"Close all"** and process whitelist protecting audio, remote, and system services.
* **Symmetrical 4+2 Quick Bar**: 
  - **Row 1**: `[Inputs]` (HDMI 1–4 & Live TV) · `[Wi-Fi]` · `[Bluetooth]` · `[Screensaver]`
  - **Row 2**: `[Live RAM & Storage Stats Pill]` · `[Settings]`
* **Snug-Fit Live Stats Pill**: Dynamic text auto-sizing (`autoSizeTextType="uniform"`) so live RAM % and Storage % never truncate across font scales or display densities.
* **Aesthetic Refinements**: Hand-crafted multi-density raster icons (`mdpi` through `xxxhdpi` + Leanback banner), 32-bit ARGB_8888 wallpaper engine, and clean neutral white focus highlights (`cinematic_white_focus: true`, `ambient_glow: false`).
* **100% Remote Key Interception (`HomeKeyService`)**: Permanently handles Home and Back keys to prevent bouncing back to stock Google TV. Maps Settings button directly to Quick Settings.
* **Anti-OTA Update Freeze**: Blocks forced background firmware upgrades that undo launcher mappings.

---

## Included APKs & Cryptographic Checksums

| Package | Filename | Role | Size | SHA256 Checksum |
| :--- | :--- | :--- | :---: | :--- |
| `com.gathin.tvhome` | [`cleanyourtv-enhanced.apk`](apk/cleanyourtv-enhanced.apk) | Enhanced Launcher (v3.3) | 624 KB | `CB99E59F20EBEFC678DC9106E1422A08E95F4C7512557C988A68F895E21ACEE6` |
| `io.github.justinnewman.bluetoothtoggle` | [`addon-bluetooth-toggle.apk`](apk/addon-bluetooth-toggle.apk) | 1-Press BT Toggle & Pair | 17.2 KB | `207C91EA94E8CD0EE772CAEC86FE7C86BF0B0B5733BE3185C5D99B30D82673FF` |
| `com.gathin.btconnect` | [`addon-bluetooth-connect.apk`](apk/addon-bluetooth-connect.apk) | Direct Accessory Connect | 13.6 KB | `03385DAB27ADE4ABB47E7E06771EED87BE5D3B34AF2575AF0AA239C6EFCB9008` |
| `io.github.maxhayim.headphones` | [`addon-headphones.apk`](apk/addon-headphones.apk) | Audio Output Switcher | 23.9 KB | `031836F1681292216690DB95A11796793B108F879D691C98F6E51405D4C2D2F0` |
| `com.lionlev.tv.capacity` | [`addon-capacity-stats.apk`](apk/addon-capacity-stats.apk) | Live RAM/Storage Telemetry | 13.0 KB | `CE1497035B5DFAC1D601A8814EEE607085EF3317EC999F8226BB056ED520250E` |
| `io.github.maxhayim.airplaystatus` | [`addon-airplay-status.apk`](apk/addon-airplay-status.apk) | Cast / Mirroring State | 15.3 KB | `B7DA86D433D7013107C659588C502CD9076D65CA482ED46E041E8C4C681F90BC` |
| `com.maxhayim.webmote` | [`webmote.apk`](apk/webmote.apk) | Web Remote Controller | 55.7 KB | `CC64443B139624B61FB39D02FDBE8BF931C27711C71EB6C01203260609DD4387` |

---

## 1-Minute Quick Start

1. Enable **USB Debugging** on your TV (**Settings → System → Developer Options**).
2. Connect to the TV and install the complete suite:
   ```cmd
   git clone https://github.com/Biraj2004/clean-my-googletv.git
   cd clean-my-googletv
   apk\install_all_apks.bat
   ```

---

## Compatibility & Safety

* **Platforms**: Android TV & Google TV (Android 8.0 through Android 14) on 32-bit (`armeabi-v7a`) & 64-bit (`arm64-v8a`) architectures.
* **Tested Brands**: Sony BRAVIA, Google Chromecast (4K & HD), Walmart onn., TCL, Hisense, Xiaomi, Philips, Nvidia Shield.
* **Warranty & Reversibility**: 100% safe. Operates strictly in user space (`--user 0`). No root, no bootloader unlock, dm-verity untouched. Run `backup\restore_all.bat` or perform a standard TV factory reset anytime to rollback.
