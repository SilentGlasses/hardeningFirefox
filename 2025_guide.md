# A 2025 Guide to Hardening Firefox for Privacy and Security

While Firefox remains one of the more privacy-respecting mainstream browsers, it still requires manual hardening to ensure maximum security and privacy. Hardening Firefox requires a balance between privacy, security, and usability. By implementing the above changes, you significantly reduce your exposure to tracking, fingerprinting, and data collection.

If you’re looking for even stronger privacy, consider using Firefox forks like LibreWolf or combining Firefox with a hardened OS such as Tails or Qubes OS.

Stay private and browse safely!

This guide will walk you through essential steps to harden Firefox while maintaining usability. I will also be working on a script to get these setup in one go, more to come later.

## Disable Firefox’s Built-in Data Collection

Firefox collects some telemetry data by default, but you can disable this in settings:

- Go to: `about:preferences#privacy`
- Under **Firefox Data Collection and Use**, uncheck all options:
    - Allow Firefox to send technical and interaction data
    - Allow Firefox to make personalization recommendations
    - Allow studies
- You can also disable crash reports:
    - Go to: `about:preferences#privacy`
    - Under **Privacy & Security**, uncheck “**Allow Firefox to send crash reports**.”

## Modify about:config for Advanced Privacy

To access Firefox’s advanced settings, type `about:config` in the address bar and press Enter. Click “**Accept the risk and continue**.”

Modify the following settings:

- Disable Telemetry:
    - `toolkit.telemetry.enabled` → **false**
    - `toolkit.telemetry.unified` → **false**
- Disable Studies:
    - `app.shield.optoutstudies.enabled → **false**
- Block Fingerprinting:
    - `privacy.resistFingerprinting` → **true**
- Disable WebGL (Reduces fingerprinting risks but may impact graphics performance):
    - `webgl.disabled` → **true**
- Disable Third-Party Cookies:
    - `network.cookie.cookieBehavior` → **1** (Blocks third-party cookies)
- Enforce HTTPS (Prevents unencrypted connections):
    - `dom.security.https_only_mode` → **true**

## Install Privacy-Focused Add-ons

Extensions can further enhance privacy and security. Consider installing:

- uBlock Origin → Blocks ads, trackers, and malicious scripts
- Privacy Badger → Automatically learns to block tracking
- Decentraleyes → Prevents tracking through content delivery networks (CDNs)
- Cookie AutoDelete → Deletes cookies when tabs are closed
- LocalCDN → Replaces external libraries with local copies

⚠️ Avoid Privacy-Invasive Add-ons:

Some extensions claim to enhance privacy but actually collect data. Always research add-ons before installing them.

## Enable DNS over HTTPS (DoH)

Encrypting your DNS requests prevents ISPs and attackers from monitoring which websites you visit.

- Go to: `about:preferences#privacy`
- Scroll down to **Enable DNS over HTTPS**
- Select a provider like **Cloudflare** (1.1.1.1) or **NextDNS**

## Harden Security Settings

- Go to: `about:preferences#privacy`
- Under **Enhanced Tracking Protection**, select **Strict**
- Enable **HTTPS-Only Mode** to ensure encrypted connections

## Disable WebRTC (Prevents IP Leaks in VPNs)

WebRTC can expose your real IP address even when using a VPN.

- Go to: `about:config`
- Search for `media.peerconnection.enabled`
- Set it to **false**

## Use a Privacy-Respecting Search Engine

Instead of Google, switch to a private search engine:

- DuckDuckGo (https://duckduckgo.com)
- Startpage (https://www.startpage.com)
- Searx (https://searx.be)

## Enable First-Party Isolation (FPI)

This prevents websites from tracking you across sessions by isolating cookies per website.

- Go to: `about:config`
- Set `privacy.firstparty.isolate` to **true**

## Use Container Tabs (Prevents Cross-Site Tracking)

Firefox’s Multi-Account Containers allow you to isolate browsing sessions per site.

- Install the Extension: Firefox Multi-Account Containers
- Assign different containers for social media, banking, shopping, etc.

## Regularly Clear Browsing Data

- Go to: `about:preferences#privacy`
- Under Cookies and Site Data, enable **Delete cookies and site data when Firefox is closed**
- Under History, set Firefox will: Use custom settings for history and enable Clear history when Firefox closes
