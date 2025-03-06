```
                 __ __   ____  ____   ___      ___  ____   ____  ____    ____  
                |  |  | /    ||    \ |   \    /  _]|    \ |    ||    \  /    |
  ##########    |  |  ||  o  ||  D  )|    \  /  [_ |  _  | |  | |  _  ||   __|
  ##      ##    |  _  ||     ||    / |  D  ||    _]|  |  | |  | |  |  ||  |  |
  ##      ##    |  |  ||  _  ||    \ |     ||   [_ |  |  | |  | |  |  ||  |_ |
  ##            |  |  ||  |  ||  .  \|     ||     ||  |  | |  | |  |  ||     | 
##############  |__|__||__|__||__|\_||_____||_____||__|__||____||__|__||___,_|
##          ##         _____  ____  ____     ___  _____   ___   __ __ 
##    ##    ##        |     ||    ||    \   /  _]|     | /   \ |  |  |
##    ##    ##        |   __| |  | |  D  ) /  [_ |   __||     ||  |  |
##          ##        |  |_   |  | |    / |    _]|  |_  |  O  ||_   _|
##############        |   _]  |  | |    \ |   [_ |   _] |     ||     |
                      |  |    |  | |  .  \|     ||  |   |     ||  |  |
                      |__|   |____||__|\_||_____||__|    \___/ |__|__|  
```

# Firefox Privacy & Security Concerns

## Overview

Firefox has long been a popular browser choice for users prioritizing privacy and security, Heck, I've been using it for 20+ years. However, recent changes and issues have raised concerns about how well it upholds these principles. While Firefox continues to emphasize privacy, recent decisions and changes introduce potential risks that users should be aware of, mainly features that:

- collect and transmit data
- integrate third-party services
- alter extension capabilities

These decisions can introduce issues that may impact the browser’s ability to offer a fully private experience. Understanding these concerns allows users to make informed decisions about their browser configuration and online privacy practices.

Firfor's changes to their Terms of Use has raised concerns as it included language that seems to grant Mozilla broad rights over users data. Privacy advocates and long time users have criticized Mozilla over concerns of potential implications and data ownership. Mozilla has responded that the Terms of Use were to explain how the browser function not to claim ownership of data and has announced revisions to amke things clearer but the damage has already been done and concern remains about transparency and trust in Mozilla and Firefox's commitments to privacy and security of it's users and their data.

In this repo, I'll try to outline key privacy and security risks associated with the latest versions of Firefox and some advice to harden it should you choose to continue using it, that is, for as long as Mozilla allows users to make these changes.

## Recent Privacy & Security Concerns

### Telemetry & Data Collection

Firefox collects and sends telemetry data to Mozilla by default, including usage statistics and performance metrics. While intended to improve the browser, this data transmission raises concerns about user privacy and potential tracking. Users may not be fully aware of the extent of the data being collected or how it is used.

### Firefox Suggest & Sponsored Content

Firefox Suggest introduces recommendations and sponsored search results, which involve sending user search queries to Mozilla and third-party providers. This raises concerns about data exposure, profiling, and targeted advertising within a browser marketed as privacy-focused. Users who expect a fully private browsing experience may find these features intrusive.

### Weak Default Settings for Cookies & Tracking Protection

The default "Standard" setting for Enhanced Tracking Protection (ETP) does not block all third-party cookies, leaving users susceptible to cross-site tracking. Many users may assume Firefox provides strong privacy by default, without realizing they need to adjust settings for better protection. The balance between usability and privacy may not align with the expectations of security-conscious users.

### Pocket Integration

Firefox includes Pocket, a read-it-later service that collects user data to provide recommendations. While convenient, this feature integrates an external service that may process and store browsing habits. Users who do not use Pocket may be unaware that it is running in the background and interacting with their data.

### DNS over HTTPS (DoH) and Mozilla’s Trusted Recursive Resolver (TRR)

Firefox routes DNS queries through specific third-party resolvers (such as Cloudflare) by default when DoH is enabled. This centralization of DNS traffic raises concerns about reliance on a single provider and potential data retention policies. While DoH improves security against network-based attacks, it also shifts trust from ISPs to Mozilla’s selected partners.

### Manifest V3 Extensions Impact

Mozilla's adoption of Manifest V3 (MV3) for browser extensions introduces new limitations on how add-ons can interact with web content. This change affects privacy-focused extensions, such as content blockers, by restricting their ability to block certain types of network requests. Users relying on extensions like uBlock Origin may experience reduced effectiveness in blocking ads and trackers.

For those that don't know, Manifest V3 is a new extension framework introduced by Google and adopted by Mozilla, it imposes stricter limitations on how extensions interact with web requests but many privacy and security-focused extensions, including uBlock Origin, have raised concerns that MV3 limits their effectiveness, leading to weaker user protections against online tracking and malicious content.
