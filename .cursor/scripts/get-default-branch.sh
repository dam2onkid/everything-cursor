#!/bin/sh
# Cross-platform (Linux, macOS, Windows via Git Bash/WSL/MSYS2)
# Detects the repo's default branch name.
#
# Usage:
#   .cursor/scripts/get-default-branch.sh    # e.g., main

set -e

if git symbolic-ref refs/remotes/origin/HEAD >/dev/null 2>&1; then
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
else
  echo "ERROR: Could not detect default branch. Run: git remote set-head origin --auto" >&2
  exit 1
fi
