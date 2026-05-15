#!/bin/bash
set -e

# Load environment variables
source "$(dirname "$0")/.env"

echo "Build ios .ipa"

flutter build ipa --release

firebase appdistribution:distribute build/ios/ipa/App.ipa \
  --app $FIREBASE_IOS_APP_ID \
  --groups testers