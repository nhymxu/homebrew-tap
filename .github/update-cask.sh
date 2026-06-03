#!/bin/bash
# Check latest version and update cask file if newer version available.
# Usage: update-cask.sh <cask-file> <repo> <cask-name>

set -euo pipefail

CASK_FILE="$1"
REPO="$2"
CASK_NAME="$3"

echo "::group::$CASK_NAME"

if [ "$REPO" = "3utools" ]; then
  PAGE=$(curl -sL "https://www.3u.com/productsWin")
  X64_URL=$(echo "$PAGE" | grep -oE 'https://dl\.3u\.com/update/v900/macos/x64/3uTools_v[0-9]+\.[0-9]+\.[0-9]+_x64\.dmg' | head -1 || true)
  if [ -z "$X64_URL" ]; then
    echo "::warning::Could not find macOS download link"
    echo "::endgroup::"
    exit 0
  fi
  LATEST_VERSION=$(echo "$X64_URL" | sed -n 's/.*3uTools_v\([0-9.]*\)_x64\.dmg/\1/p')
else
  LATEST_TAG=$(gh release view --repo "$REPO" --json tagName -q .tagName 2>/dev/null || true)
  if [ -z "$LATEST_TAG" ]; then
    echo "::warning::No GitHub releases found for $REPO"
    echo "::endgroup::"
    exit 0
  fi
  LATEST_VERSION="${LATEST_TAG#v}"
fi

CURRENT_VERSION=$(sed -n 's/.*version "\([^"]*\)".*/\1/p' "$CASK_FILE")
echo "Current: $CURRENT_VERSION"
echo "Latest:  $LATEST_VERSION"

if [ -z "$LATEST_VERSION" ] || [ "$LATEST_VERSION" = "$CURRENT_VERSION" ]; then
  echo "No update needed"
  echo "::endgroup::"
  exit 0
fi

NEWER=$(printf '%s\n%s\n' "$CURRENT_VERSION" "$LATEST_VERSION" | sort -V | tail -1)
if [ "$NEWER" != "$LATEST_VERSION" ]; then
  echo "Current version is newer, skipping"
  echo "::endgroup::"
  exit 0
fi

echo "Updating to $LATEST_VERSION..."
ESCAPED_CURRENT=$(printf '%s\n' "$CURRENT_VERSION" | sed 's/[.[\]\\*^$]/\\&/g')
sed -i "s/version \"${ESCAPED_CURRENT}\"/version \"${LATEST_VERSION}\"/" "$CASK_FILE"
echo "Done"

echo "::endgroup::"
