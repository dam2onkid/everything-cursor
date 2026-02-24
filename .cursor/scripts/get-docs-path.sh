#!/bin/sh
# Cross-platform (Linux, macOS, Windows via Git Bash/WSL/MSYS2)
# Outputs the versioned feature docs base path.
#
# Usage:
#   .cursor/scripts/get-docs-path.sh    # e.g., docs/features/v0

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MAJOR=$("$SCRIPT_DIR/get-version.sh" major)

echo "docs/features/$MAJOR"
