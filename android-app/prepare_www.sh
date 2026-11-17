#!/usr/bin/env bash
# Copies the web app into the Android project. The Android app bundles every file, so the service worker is removed.
set -euo pipefail
cd "$(dirname "$0")"
rm -rf www && cp -r ../web www
rm -f www/sw.js www/README.md www/privacy.html
sed -i 's#<script>if("serviceWorker" in navigator).*</script>#<!-- Android build: files are bundled, no service worker -->#' www/index.html
grep -q 'serviceWorker' www/index.html && { echo "service worker line not removed"; exit 1; } || true
