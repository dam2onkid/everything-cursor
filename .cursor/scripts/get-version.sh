#!/bin/sh
# Cross-platform (Linux, macOS, Windows via Git Bash/WSL/MSYS2)
# Reads VERSION.md and outputs version info.
#
# Usage:
#   .cursor/scripts/get-version.sh          # full version (e.g., v0.1.0)
#   .cursor/scripts/get-version.sh major    # major only (e.g., v0)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
VERSION_FILE="$PROJECT_ROOT/VERSION.md"

if [ ! -f "$VERSION_FILE" ]; then
  echo "ERROR: VERSION.md not found at $VERSION_FILE" >&2
  echo "Run /init-docs to create it." >&2
  exit 1
fi

FULL=$(grep -m 1 '^## Current:' "$VERSION_FILE" | sed 's/^## Current: *//')

if [ -z "$FULL" ]; then
  echo "ERROR: Could not parse current version from VERSION.md." >&2
  exit 1
fi

case "${1:-full}" in
  full)  echo "$FULL" ;;
  major) echo "$FULL" | sed 's/^\(v[0-9]*\).*/\1/' ;;
  *)     echo "Usage: $0 {full|major}" >&2; exit 1 ;;
esac
