#!/bin/bash

# Script Name: hardenfox.sh
# Description: Firefox Hardening Script
# Author: SilentGlasses
# Version: 0.1.0
# Usage: ./hardenfox.sh
# Last Updated: 2025-03-06

# Ensure Firefox is closed before making changes
pkill firefox

# Firefox profile path (modify if necessary)
PROFILE_PATH="$HOME/.mozilla/firefox"
FIREFOX_PROFILE=$(find "$PROFILE_PATH" -maxdepth 1 -type d -name "*.default-release" | head -n 1)

if [ -z "$FIREFOX_PROFILE" ]; then
    echo "Firefox profile not found! Exiting..."
    exit 1
fi

PREFS="$FIREFOX_PROFILE/user.js"
LOG_FILE="firefox_hardening_log.txt"

# Function to set Firefox preferences
set_preference() {
  local pref=$1
  local value=$2
  echo "user_pref(\"$pref\", $value);" >> "$PREFS"
  echo "Set $pref to $value" >> "$LOG_FILE"
}

# Start logging
echo "Firefox Hardening Script Log - $(date)" > "$LOG_FILE"
echo "Profile path: $FIREFOX_PROFILE" >> "$LOG_FILE"
echo "--------------------------------------" >> "$LOG_FILE"

# Create user.js if it doesn't exist
touch "$PREFS"
echo "Created user.js at $PREFS" >> "$LOG_FILE"

# General Privacy & Security Settings
# Enable Do Not Track
set_preference "privacy.donottrackheader.enabled" true
# Important for requesting websites not to track your browsing behavior.
# To disable manually: set privacy.donottrackheader.enabled to false in about:config.

# Resist Fingerprinting
set_preference "privacy.resistFingerprinting" true
# Prevents websites from tracking you based on browser/device characteristics.
# To disable manually: set privacy.resistFingerprinting to false in about:config.

# Enable Tracking Protection
set_preference "privacy.trackingprotection.enabled" true
set_preference "privacy.trackingprotection.pbmode.enabled" true
# Blocks known trackers to enhance privacy.
# To disable manually: set privacy.trackingprotection.enabled and privacy.trackingprotection.pbmode.enabled to false in about:config.

# Enable First-Party Isolation
set_preference "privacy.firstparty.isolate" true
# Isolates cookies to the first-party domain, mitigating cross-site tracking.
# To disable manually: set privacy.firstparty.isolate to false in about:config.

# Disable Telemetry
set_preference "toolkit.telemetry.enabled" false
set_preference "toolkit.telemetry.unified" false
set_preference "toolkit.telemetry.archive.enabled" false
set_preference "datareporting.healthreport.uploadEnabled" false
set_preference "datareporting.policy.dataSubmissionEnabled" false
# Prevents Firefox from sending usage data to Mozilla.
# To disable manually: set these preferences to true in about:config.

# Disable Pocket
set_preference "extensions.pocket.enabled" false
# Prevents the Pocket integration from functioning, reducing data sharing.
# To disable manually: set extensions.pocket.enabled to true in about:config.

# Disable WebRTC
set_preference "media.peerconnection.enabled" false
# Prevents WebRTC from leaking your real IP address.
# To disable manually: set media.peerconnection.enabled to true in about:config.

# Enable Strict Enhanced Tracking Protection
set_preference "browser.contentblocking.category" "\"strict\""
# Ensures the strictest level of tracking protection is applied.
# To disable manually: set browser.contentblocking.category to "standard" or "custom" in about:config.

# Disable Geolocation
set_preference "geo.enabled" false
# Prevents websites from accessing your geolocation.
# To disable manually: set geo.enabled to true in about:config.

# Disable Prefetching
set_preference "network.prefetch-next" false
set_preference "network.dns.disablePrefetch" true
set_preference "network.dns.disablePrefetchFromHTTPS" true
# Prevents prefetching of links and DNS to reduce information leakage.
# To disable manually: set these preferences to true in about:config.

# Disable Speculative Connections
set_preference "network.http.speculative-parallel-limit" 0
# Prevents Firefox from making speculative connections.
# To disable manually: set network.http.speculative-parallel-limit to a positive number in about:config.

# Disable Search Suggestions
set_preference "browser.search.suggest.enabled" false
# Reduces data sent to search engines by disabling search suggestions.
# To disable manually: set browser.search.suggest.enabled to true in about:config.

# Enable HTTPS-Only Mode
set_preference "dom.security.https_only_mode" true
# Ensures Firefox only loads websites over HTTPS, enhancing security.
# To disable manually: set dom.security.https_only_mode to false in about:config.

# Disable Third-Party Cookies
set_preference "network.cookie.cookieBehavior" 1
# Prevents cross-site tracking by blocking third-party cookies.
# To disable manually: set network.cookie.cookieBehavior to 0 in about:config.

# Disable WebGL
set_preference "webgl.disabled" true
# Prevents potential security vulnerabilities related to WebGL.
# To disable manually: set webgl.disabled to false in about:config.

# Disable Firefox Snippets
set_preference "browser.aboutHomeSnippets.updateUrl" "\"\""
# Disables snippets on the Firefox home page.
# To disable manually: set browser.aboutHomeSnippets.updateUrl to the default value in about:config.

# Disable Firefox Studies
set_preference "app.shield.optoutstudies.enabled" false
# Prevents Firefox from enrolling you in studies.
# To disable manually: set app.shield.optoutstudies.enabled to true in about:config.

# Clear Cookies and Site Data on Exit
set_preference "network.cookie.lifetimePolicy" 2
# Ensures cookies and site data are cleared on exit, enhancing privacy.
# To disable manually: set network.cookie.lifetimePolicy to 0 in about:config.

# Disable WebAuthn
set_preference "security.webauth.webauthn" false
# Prevents the use of WebAuthn, which is used for browser-based authentication.
# To disable manually: set security.webauth.webauthn to true in about:config.

# Clear Browsing Data on Exit
set_preference "privacy.sanitize.sanitizeOnShutdown" true
set_preference "privacy.clearOnShutdown.cookies" true
set_preference "privacy.clearOnShutdown.history" true
set_preference "privacy.clearOnShutdown.cache" true
# Clears browsing data on exit to enhance privacy.
# To disable manually: set these preferences to false in about:config.

# Additional Recommendations
# Disable JavaScript
set_preference "javascript.enabled" false
# Prevents running JavaScript to avoid potential security risks.
# To disable manually: set javascript.enabled to true in about:config.

# Disable DOM Storage
set_preference "dom.storage.enabled" false
# Prevents websites from using DOM storage.
# To disable manually: set dom.storage.enabled to true in about:config.

# Disable WebAssembly
set_preference "javascript.options.wasm" false
# Prevents running WebAssembly to avoid potential security vulnerabilities.
# To disable manually: set javascript.options.wasm to true in about:config.

# Enable Strict Content Security Policy
set_preference "security.csp.enable" true
# Enforces strict content security policies to mitigate cross-site scripting attacks.
# To disable manually: set security.csp.enable to false in about:config.

# Disable Service Workers
set_preference "dom.serviceWorkers.enabled" false
# Prevents the use of service workers which can be used for background tasks.
# To disable manually: set dom.serviceWorkers.enabled to true in about:config.

# Disable Web Notifications
set_preference "dom.webnotifications.enabled" false
# Prevents websites from showing web notifications.
# To disable manually: set dom.webnotifications.enabled to true in about:config.

# Disable WebGL Debugging Information
set_preference "webgl.disable-extensions" true
set_preference "webgl.disable-fail-if-major-performance-caveat" true
set_preference "webgl.enable-debug-renderer-info" false
# Prevents WebGL from exposing debugging information.
# To disable manually: set these preferences to false in about:config.

# Disable Beacon
set_preference "beacon.enabled" false
# Prevents the use of the Beacon API to send small amounts of data to the server.
# To disable manually: set beacon.enabled to true in about:config.

# Disable Offline Cache
set_preference "browser.cache.offline.enable" false
# Prevents websites from storing data for offline use.
# To disable manually: set browser.cache.offline.enable to true in about:config.

# Disable Battery Status API
set_preference "dom.battery.enabled" false
# Prevents websites from accessing battery status information.
# To disable manually: set dom.battery.enabled to true in about:config.

# Disable Clipboard Events
set_preference "dom.event.clipboardevents.enabled" false
# Prevents websites from detecting clipboard actions.
# To disable manually: set dom.event.clipboardevents.enabled to true in about:config.

echo "Preferences set for profile $FIREFOX_PROFILE" >> "$LOG_FILE"

# Install Privacy Extensions
EXTENSIONS=(
    "uBlock Origin" "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-634704-latest.xpi"
    "Privacy Badger" "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/addon-531830-latest.xpi"
    "Decentraleyes" "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/addon-521238-latest.xpi"
    "Cookie AutoDelete" "https://addons.mozilla.org/firefox/downloads/latest/cookie-autodelete/addon-606505-latest.xpi"
    "CanvasBlocker" "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/addon-602406-latest.xpi"
)

for ((i=0; i<${#EXTENSIONS[@]}; i+=2)); do
    EXT_NAME="${EXTENSIONS[i]}"
    EXT_URL="${EXTENSIONS[i+1]}"
    echo "Installing $EXT_NAME..." >> "$LOG_FILE"
    firefox --new-tab "$EXT_URL"
done

echo "Firefox hardening complete! Restart Firefox to apply changes." >> "$LOG_FILE"

# Print log file location
echo "Changes logged to $LOG_FILE"
