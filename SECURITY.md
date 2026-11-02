# Security Policy

## Supported Versions

We actively maintain and provide security updates for the following versions:

| Version | Supported | Notes |
| :--- | :---: | :--- |
| `1.0.x` (Enhanced) | :white_check_mark: | Current production release |
| `< 1.0.0` | :x: | Legacy / prototype builds |

---

## Security Architecture & Threat Model

### 1. Zero Root & Non-Destructive User Space Execution
* **Untouched System Partitions**: This suite operates strictly in Android user space (`pm disable-user --user 0`). It does **not** require root (`su`), nor does it unlock the device bootloader.
* **Cryptographic System Integrity**: Android Verified Boot (AVB 2.0) and dm-verity hashes on `/system`, `/vendor`, and `/boot` remain factory original.
* **100% Reversible**: Disabling apps at the user level never removes system binaries. Standard factory data resets or running `backup/restore_all.bat` instantly restores stock factory software.

### 2. Network ADB & Port 5555 Hardening
* Enabling **USB Debugging** on Android TV starts the `adbd` service listening on TCP port `5555`.
* **Important**: Always perform the installation while connected to a trusted, password-protected local Wi-Fi or Ethernet network.
* **Post-Installation Recommendation**: Once the launcher, add-ons, and debloat configurations are verified, navigate to **Settings → System → Developer Options** on your TV and switch **USB Debugging = OFF**. CleanYourTV Enhanced and all modular add-ons will continue running smoothly without requiring an open network port.

### 3. Privacy & Telemetry Exclusions
* **No Outbound Analytics**: Neither CleanYourTV Enhanced nor any of the modular add-ons contain tracking telemetry, analytics SDKs, advertising libraries, or cloud callbacks.
* **Local Processing**: RAM metrics, storage capacity, task lists, and Bluetooth states are queried and processed entirely on-device via native Android system APIs.

### 4. Permission Scopes
* `android.permission.WRITE_SECURE_SETTINGS`: Used strictly to restore accessibility service bindings (`HomeKeyService`) and adjust sleep flags.
* `android.permission.BLUETOOTH_CONNECT`: Required on Android 12+ to read Bluetooth adapter states, query bonded accessories, and toggle radio power.
* `android.permission.PACKAGE_USAGE_STATS`: Used exclusively by the Task Manager to enumerate running background processes for the 1-click memory cleaner.

---

## Reporting a Vulnerability

If you discover a potential security vulnerability or privacy leak within this repository:

1. **Do NOT open a public GitHub issue.**
2. Report the vulnerability privately via **[GitHub Private Vulnerability Reporting](https://github.com/Biraj2004/clean-my-googletv/security/advisories/new)** or by email:
   - **Email**: `birajsarkar67@gmail.com`
   - **Subject**: `[SECURITY VULNERABILITY] Clean My GoogleTV`
3. Please include:
   - A description of the vulnerability and its potential impact.
   - Detailed steps to reproduce or a proof of concept.
   - Affected hardware models and Android TV OS versions.

### Response Timeline
* **Initial Acknowledgment**: Within 48 hours.
* **Assessment & Fix**: Security patches will be prioritized and published under a new semantic release tag.
