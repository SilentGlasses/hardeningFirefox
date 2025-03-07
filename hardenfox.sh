#!/bin/bash

# Script Name: hardenfox.sh
# Description: Firefox Hardening Script
# Author: SilentGlasses
# Version: 0.1.0
# Usage: hardenfox.sh
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
set_preference "privacy.donottrackheader.enabled" true
set_preference "privacy.resistFingerprinting" true
set_preference "privacy.trackingprotection.enabled" true
set_preference "privacy.trackingprotection.pbmode.enabled" true
set_preference "privacy.firstparty.isolate" true

# Disable Telemetry
set_preference "toolkit.telemetry.enabled" false
set_preference "toolkit.telemetry.unified" false
set_preference "toolkit.telemetry.archive.enabled" false
set_preference "datareporting.healthreport.uploadEnabled" false
set_preference "datareporting.policy.dataSubmissionEnabled" false

# Disable Pocket
set_preference "extensions.pocket.enabled" false

# Disable WebRTC (to prevent IP leaks)
set_preference "media.peerconnection.enabled" false

# Enhanced Tracking Protection
set_preference "browser.contentblocking.category" "\"strict\""

# Disable Geolocation
set_preference "geo.enabled" false

# Disable prefetching
set_preference "network.prefetch-next" false
set_preference "network.dns.disablePrefetch" true
set_preference "network.dns.disablePrefetchFromHTTPS" true

# Disable speculative connections
set_preference "network.http.speculative-parallel-limit" 0

# Disable search suggestions
set_preference "browser.search.suggest.enabled" false

# Enable HTTPS-Only Mode
set_preference "dom.security.https_only_mode" true

# Disable third-party cookies
set_preference "network.cookie.cookieBehavior" 1

# Disable WebGL
set_preference "webgl.disabled" true

# Disable Firefox Snippets
set_preference "browser.aboutHomeSnippets.updateUrl" "\"\""

# Disable Firefox Studies
set_preference "app.shield.optoutstudies.enabled" false

# Enable First-Party Isolation
set_preference "privacy.firstparty.isolate" true

# Clear cookies and site data on exit
set_preference "network.cookie.lifetimePolicy" 2

# Disable WebAuthn (Prevents browser-based face recognition authentication)
set_preference "security.webauth.webauthn" false

# Clear Browsing Data on Exit
set_preference "privacy.sanitize.sanitizeOnShutdown" true
set_preference "privacy.clearOnShutdown.cookies" true
set_preference "privacy.clearOnShutdown.history" true
set_preference "privacy.clearOnShutdown.cache" true

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
