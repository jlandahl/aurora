#!/usr/bin/env sh

set -euo pipefail

URL=$(curl -s https://api.github.com/repos/bitwarden/clients/releases | jq -r 'first(.[] | .assets[]? | select(.browser_download_url | endswith(".rpm")) | .browser_download_url)')

if [ -n "$URL" ]; then
    curl -sL -o bitwarden-latest.rpm "$URL"
else
    echo "--- Could not find Bitwarden RPM URL"
fi
