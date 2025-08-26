#!/usr/bin/env bash
set -euo pipefail

if ! command -v npx >/dev/null; then
  echo "Please install Node.js (npx required)"; exit 1
fi

# Install Capacitor deps
npm i -D @capacitor/cli
npm i @capacitor/core
npm i @capacitor/ios

# Copy config if not present
if [ ! -f capacitor.config.ts ]; then
  cp ios_wrapper_kit/capacitor.config.ts ./capacitor.config.ts || true
fi

# Init and add iOS (safe if already done)
npx cap init "Cluck Hub" "com.cluckhub.app" --web-dir=dist || true
npx cap add ios || true

# Open Xcode
npx cap open ios
