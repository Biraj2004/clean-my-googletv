# Tier 3: Network & Router DNS Domain Blocking Guide

> [!NOTE]
> **Status:** Reference Guide Only. These network rules are applied on your home router, Pi-hole, AdGuard Home, or NextDNS whenever you are ready.

---

## 1. Overview
While **Tier 1** (OS Setting) and **Tier 2** (Disabling `com.mediatek.tv.systemupdater` and `com.sony.gaus.updatecenter`) completely stop the TV from searching for or flashing updates, **Tier 3** provides a hardware-level network airgap. Even if someone resets the TV or an OS bug occurs, the TV simply cannot reach Sony or Google update servers.

---

## 2. Domains to Block

Add these exact domain names to your network blocklist / blacklist:

| Domain | Purpose | Safe to Block? |
| :--- | :--- | :---: |
| `bravia-update.sony.net` | Sony BRAVIA firmware manifest & payload server | **Yes** (Blocks TV firmware download) |
| `gaus-update.sony.net` | Sony GAUS cloud update verification service | **Yes** (Blocks update checks) |
| `ssm1.internet.sony.tv` | Sony TV telemetry and firmware update trigger | **Yes** (Blocks update trigger) |
| `bravia.dl.playstation.net` | Sony PlayStation/BRAVIA firmware CDN hosting | **Yes** (Blocks firmware image download) |
| `ota.googlezip.net` | Google Android OS OTA update download server | **Yes** (Blocks Google TV OS downloads) |

> [!WARNING]
> **Domains to NEVER Block (Keep Allowed):**
> - `connectivitycheck.gstatic.com` — Used by Android TV to check if Wi-Fi has internet. Blocking this will cause the TV to display "No internet access / Limited connection".
> - `android.clients.google.com` — Used by Google Play Store to download and update your streaming apps.

---

## 3. Configuration by Platform

### Option A: Pi-hole
1. Log in to your **Pi-hole Admin Console** (`http://pi.hole/admin`).
2. In the left sidebar, click on **Domains** (or **Blacklist** in older versions).
3. Under **Domain**, enter:
   ```text
   bravia-update.sony.net
   gaus-update.sony.net
   ssm1.internet.sony.tv
   bravia.dl.playstation.net
   ota.googlezip.net
   ```
4. Select **Exact match** (or **Wildcard** for `*.sony.net` if you wish to block all Sony telemetry).
5. Click **Add to Blacklist**.
6. *(Optional)* If you assign your TV a specific Client Group, you can apply this blacklist only to the Sony TV's IP address.

---

### Option B: AdGuard Home
1. Open your **AdGuard Home Dashboard**.
2. Navigate to **Filters** → **Custom filtering rules**.
3. Add the following lines to the rule list:
   ```text
   ||bravia-update.sony.net^
   ||gaus-update.sony.net^
   ||ssm1.internet.sony.tv^
   ||bravia.dl.playstation.net^
   ||ota.googlezip.net^
   ```
4. Click **Save**.

---

### Option C: NextDNS (Cloud-Based DNS)
1. Log in to [NextDNS](https://my.nextdns.io).
2. Select your profile and open the **Denylist** tab.
3. Click **Add a domain** and add:
   - `bravia-update.sony.net`
   - `gaus-update.sony.net`
   - `ssm1.internet.sony.tv`
   - `bravia.dl.playstation.net`
   - `ota.googlezip.net`
4. The rule applies instantly to any device using your NextDNS profile.

---

### Option D: Home Router (Asus, TP-Link, Netgear, OpenWrt)
1. Open your router's admin portal (typically `192.168.0.1` or `192.168.1.1`).
2. Locate the **Access Control**, **Firewall**, or **URL Filter / Domain Blocking** section:
   - **Asus (Asuswrt / Merlin):** **Firewall** → **URL Filter** → Enable URL Filter → Add domains to the list.
   - **TP-Link:** **Security** → **Access Control** (or **Parental Controls**) → Add the TV's MAC address and set forbidden domains.
   - **OpenWrt / pfSense:** Add domain overrides to `Unbound` or `dnsmasq` pointing the domains to `0.0.0.0`.

---

## 4. Verification

To verify that the block is active:
1. Open a terminal / command prompt on a computer connected to the same network.
2. Run:
   ```bash
   nslookup bravia-update.sony.net
   ```
3. If properly blocked, it will return `0.0.0.0`, `127.0.0.1`, or `NXDOMAIN` (Non-Existent Domain).

---

## 5. How to Update Manually in the Future (USB Method)

If Sony ever releases a firmware update with a feature you genuinely want:
1. You do **not** need to unblock or reconnect the TV to Sony update servers.
2. Go to the official [Sony Support Website](https://www.sony.com/electronics/support) on your PC.
3. Enter your TV model number (e.g., `BRAVIA 2 II` / `KD-XX...`).
4. Download the official firmware update `.zip` file.
5. Extract the `.pkg` file to the root directory of a FAT32/exFAT USB flash drive.
6. Insert the USB drive into your TV's physical USB port. The TV will recognize the update file and prompt to install offline without needing any cloud connection.

