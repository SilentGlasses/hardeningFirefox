```
 ___ ___ _______ _______ ______   _______ ______  ___ ______  _______ 
|   Y   |   _   |   _   |   _  \ |   _   |   _  \|   |   _  \|   _   |
|.  |   |.  |   |.  |   |.  |   \|.  |___|.  |   |.  |.  |   |.  |___|
|.  _   |.  _   |.  _   |.  |    |.  __)_|.  |   |.  |.  |   |.  |   |
|:  |   |:  |   |:  |   |:  |    |:  |   |:  |   |:  |:  |   |:  |   |
|::.|:. |::.|:. |::.|:. |::.. . /|::.. . |::.|   |::.|::.|   |::.. . |
`--- ---`--- ---`--- ---`------' `-------`--- ---`---`--- ---`-------'
⠀⠀⣾⣿⣿⣿⣿⣷⠀⠀⠀⠀_______ ___ _______ _______ _______ _______  ___ ___
⠀⠀⣿⣿⠀⠀⣿⣿⠀⠀⠀|   _   |   |   _   |   _   |   _   |   _   |(   Y   )
⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀|.  |___|.  |.  |   |.  |___|.  |___|.  |   | \  |  /
⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⠀|.  __) |.  |.  _   |.  __)_|.  __) |.  |   | /  _  \
⣿⣿⠀⠀⣾⣷⠀⠀⣿⣿⠀|:  |   |:  |:  |   |:  |   |:  |   |:  |   |/:  |   \
⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⠀|::.|   |::.|::.|:. |::.. . |::.|   |::.. . |::. |:.  |
⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀`---'   `---`--- ---`-------`---'   `-------'`--- ---'
```

# Firefox Privacy & Security Concerns

## Overview

Firefox has long been a popular browser choice for users prioritizing privacy and security, Heck, I've been using it for 20+ years. However, recent changes and issues have raised concerns about how well it upholds these principles. While Firefox continues to emphasize privacy, recent decisions and changes introduce potential risks that users should be aware of, mainly features that:

- collect and transmit data
- integrate third-party services
- alter extension capabilities

These decisions can introduce issues that may impact the browser’s ability to offer a fully private experience. Understanding these concerns allows users to make informed decisions about their browser configuration and online privacy practices.

In this repo, I'll try to outline key privacy and security risks associated with the latest versions of Firefox and some advice to harden it should you choose to continue using it, that is, for as long as Mozilla allows users to make these changes.

By addressing these privacy, anonymity, and security concerns, you can significantly improve your online safety while using Firefox. Firefox offers powerful tools to protect your data, but proactive configuration and smart browsing habits are key to maintaining your privacy and security.

# Recent Privacy & Security Concerns

## Table of Contents

1. [Recent Changes to Mozilla's Terms of Use](#recent-changes-to-mozillas-terms-of-use)  
2. [Manifest V3 and Extension Restrictions](#manifest-v3-and-extension-restrictions)  
3. [DNS over HTTPS (DoH) and Trusted Recursive Resolver (TRR)](#dns-over-https-doh-and-trusted-recursive-resolver-trr)  
4. [Firefox Sponsored Content and Recommendations](#firefox-sponsored-content-and-recommendations)  
5. [Tracking and Fingerprinting Protection](#tracking-and-fingerprinting-protection)  
6. [Telemetry and Data Collection](#telemetry-and-data-collection)  
7. [WebRTC IP Leaks](#webrtc-ip-leaks)  
8. [Add-On and Extension Security](#add-on-and-extension-security)  
9. [Search Engine Privacy](#search-engine-privacy)  
10. [Best Practices Summary](#best-practices-summary)

## Recent Changes to Mozilla's Terms of Use

In February 2025, Mozilla introduced its first Terms of Use for Firefox, which included language that appeared to grant the company broad rights over user data. The original terms stated that by uploading or inputting information through Firefox, users granted Mozilla a nonexclusive, royalty-free, worldwide license to use that information to help navigate, experience, and interact with online content.  

### Why It’s Important:  

➡️ Such language led to concerns that Mozilla could use user-uploaded information beyond the browser's core functionalities, potentially impacting user privacy.  

### Solution

Mozilla clarified that the intent was solely to enable core Firefox functionalities and that they do not claim ownership of user data. The terms were revised to state that Mozilla processes user data as described in the Firefox Privacy Notice and that this does not give Mozilla any ownership of user content.  

---

## Manifest V3 and Extension Restrictions

Mozilla plans to adopt parts of Google's Manifest V3 (MV3) for extensions. MV3 introduces new limitations on the webRequest API, which many privacy-focused extensions (like **uBlock Origin**) rely on to block ads and trackers effectively. MV3 limits the ability for extensions to modify network requests, reducing the effectiveness of ad blockers and privacy tools.  

### Why It’s Important:  

➡️ Privacy and security extensions are essential for blocking tracking, ads, and malicious scripts. Ad blockers and tracking protection may become less effective due to MV3's stricter rules.  

### Solution

Mozilla has committed to retaining some capabilities in MV3 that Chrome is removing, including allowing more flexibility for ad blockers. Since MV3 is primarily a Chromium initiative, consider switching to a non-Chromium browser that is privacy-focused forks like **LibreWolf** or **Waterfox** if MV3 significantly limits functionality.

---

## DNS over HTTPS (DoH) and Trusted Recursive Resolver (TRR)

Firefox routes DNS queries over HTTPS to a Trusted Recursive Resolver (TRR) by default, such as Cloudflare. While DoH encrypts DNS queries, using a centralized resolver like Cloudflare raises concerns about data centralization and potential surveillance.  

### Why It’s Important

➡️ Encryption prevents ISPs from spying on DNS queries, but it also gives the TRR access to your browsing data. Cloudflare has a privacy policy, but it still logs some data, which could be subpoenaed.  

### Solution

Use a custom TRR by setting `network.trr.uri` in `about:config` to a trusted, privacy-focused resolver like NextDNS or Quad9. Alternatively, disable TRR entirely and rely on encrypted local DNS resolution if possible.  

---

## Firefox Sponsored Content and Recommendations

Firefox shows sponsored content and Pocket recommendations on the New Tab page. Sponsored content is based on browsing habits and activity, which raises privacy concerns.  

### Why It’s Important:  

➡️ Sponsored content creates a potential vector for tracking and profiling. Even if Mozilla anonymizes data, third-party sponsors may still gather behavioral insights.  

### Solution

Disable sponsored content and Pocket recommendations in `about:preferences#home`. Set `browser.newtabpage.activity-stream.showSponsored` to `false` in `about:config`.  

---

## Tracking and Fingerprinting Protection

Websites and advertisers track users through cookies, tracking scripts, and fingerprinting (e.g., browser settings, extensions, fonts, etc.). Even in "private browsing" mode, fingerprinting can be used to identify you across sessions.  

### Why It’s Important

➡️ Tracking creates detailed profiles about your browsing habits, which can be sold to advertisers or misused for manipulation (e.g., political targeting). Fingerprinting undermines privacy even when cookies are blocked.  

### Solution
- Enable **Enhanced Tracking Protection** (set to **Strict**).  
- Use the **Resist Fingerprinting** option (`about:config > privacy.resistFingerprinting`).  
- Disable third-party cookies (`about:preferences#privacy`).  

---

## Telemetry and Data Collection

Firefox collects some user data (like performance stats, search terms, and usage patterns) to improve the browser. Even though Firefox is open source and transparent, this data collection still introduces potential privacy risks.  

### Why It’s Important

➡️ Data collection can reveal sensitive patterns in browsing behavior. While Firefox anonymizes much of this data, breaches or misuse are always a risk.  

### Solution

- Disable telemetry in `about:preferences#privacy`:  
  - Uncheck **"Allow Firefox to send technical and interaction data"**.  
  - Uncheck **"Allow Firefox to make personalized recommendations"**.  

---

## WebRTC IP Leaks 

WebRTC (used for real-time communication like video calls) can expose your real IP address, even when using a VPN.  

### Why It’s Important

➡️ An exposed IP address can reveal your approximate location, network, and ISP, compromising anonymity.  

### Solution

- Disable WebRTC in `about:config`:  
  - Set `media.peerconnection.enabled` to `false`.  

---

## Add-On and Extension Security

Browser extensions can request excessive permissions, inject malicious code, or track your activity. Some add-ons (even popular ones) have been caught harvesting user data.  

### Why It’s Important:  

➡️ Malicious extensions can compromise your browsing security, steal passwords, or track activity.  

### Solution:

Install only trusted, well-reviewed extensions. Limit permissions where possible. Regularly audit and remove unused extensions.  

---

## Search Engine Privacy

The default search engine (Google) tracks searches and links them to your profile. Even encrypted searches can still lead to profiling based on metadata.  

### Why It’s Important:  

➡️ Search data is highly sensitive and can reveal personal information (health issues, financial data, political views).  

### Solution: 

- Switch to a privacy-focused search engine like **DuckDuckGo**, **Startpage**, or **Searx** and disable search suggestions in Firefox to reduce data sent to search engines.  

---

## Best Practices Summary

- Enable **Enhanced Tracking Protection** (Strict mode)  
- Use **DNS over HTTPS** (with a trusted provider)  
- Disable **Telemetry** and **WebRTC**  
- Install only trusted extensions and limit permissions  
- Switch to a **private search engine**  
- Enforce **HTTPS connections**  
- Clear **history and cache** regularly  
- Review and limit **permissions**  

These are additional security items I won't be covering here but that increase your Security and Privacy Posture

- Since MV3 affects browser-based protection, shifting privacy tools to the network or system level can help:
    - **Pi-hole** – A network-level ad blocker that blocks ads and trackers across all devices.
    - **Little Snitch** (macOS) – A firewall that allows you to monitor and block network activity.
- Try Alternative Content Blockers like **uBlock Origin Lite** or **AdGuard**.
- Use User Scripts Instead of Extensions. Since Manifest V3 limits the ability of extensions to modify network requests, user scripts can act as a workaround like **Greasemonkey**.
