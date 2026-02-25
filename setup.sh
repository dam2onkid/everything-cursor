#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/.cursor"
BACKUP_SUFFIX=".backup.$(date +%Y%m%d%H%M%S)"

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] <target-project-path>

Copy .cursor configuration into an existing or new project.

Options:
  -f, --force       Overwrite existing files without prompting
  -b, --backup      Backup existing .cursor before overwriting
  -d, --dry-run     Show what would be copied without making changes
  -e, --exclude     Exclude pattern (can be repeated, e.g. -e "rules/typescript")
  -i, --include     Include only matching pattern (can be repeated)
  -h, --help        Show this help message

Examples:
  $(basename "$0") ~/projects/my-app
  $(basename "$0") --backup ~/projects/my-app
  $(basename "$0") --exclude "rules/typescript" --exclude "templates" ~/projects/my-app
  $(basename "$0") --include "rules/common" --include "commands" ~/projects/my-app
  $(basename "$0") --dry-run ~/projects/my-app
EOF
  exit 0
}

FORCE=false
BACKUP=false
DRY_RUN=false
EXCLUDES=()
INCLUDES=()
TARGET=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--force)   FORCE=true; shift ;;
    -b|--backup)  BACKUP=true; shift ;;
    -d|--dry-run) DRY_RUN=true; shift ;;
    -e|--exclude) EXCLUDES+=("$2"); shift 2 ;;
    -i|--include) INCLUDES+=("$2"); shift 2 ;;
    -h|--help)    usage ;;
    -*)           echo "Unknown option: $1" >&2; usage ;;
    *)            TARGET="$1"; shift ;;
  esac
done

if [[ -z "$TARGET" ]]; then
  echo "Error: target project path is required." >&2
  usage
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: source .cursor directory not found at $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"
TARGET_CURSOR="$TARGET/.cursor"

should_include() {
  local rel_path="$1"

  for pattern in "${EXCLUDES[@]+"${EXCLUDES[@]}"}"; do
    if [[ "$rel_path" == *"$pattern"* ]]; then
      return 1
    fi
  done

  if [[ ${#INCLUDES[@]} -gt 0 ]]; then
    for pattern in "${INCLUDES[@]}"; do
      if [[ "$rel_path" == *"$pattern"* ]]; then
        return 0
      fi
    done
    return 1
  fi

  return 0
}

if [[ "$BACKUP" == true && -d "$TARGET_CURSOR" && "$DRY_RUN" == false ]]; then
  backup_path="${TARGET_CURSOR}${BACKUP_SUFFIX}"
  echo "Backing up existing .cursor → $(basename "$backup_path")"
  cp -r "$TARGET_CURSOR" "$backup_path"
fi

copied=0
skipped=0

while IFS= read -r -d '' file; do
  rel_path="${file#"$SOURCE_DIR"/}"

  if [[ "$rel_path" == ".gitignore" ]]; then
    continue
  fi

  if ! should_include "$rel_path"; then
    continue
  fi

  dest="$TARGET_CURSOR/$rel_path"
  dest_dir="$(dirname "$dest")"

  if [[ -f "$dest" && "$FORCE" == false && "$DRY_RUN" == false ]]; then
    echo "SKIP (exists): .cursor/$rel_path"
    skipped=$((skipped + 1))
    continue
  fi

  if [[ "$DRY_RUN" == true ]]; then
    echo "WOULD COPY: .cursor/$rel_path"
    copied=$((copied + 1))
    continue
  fi

  mkdir -p "$dest_dir"
  cp "$file" "$dest"
  echo "COPIED: .cursor/$rel_path"
  copied=$((copied + 1))

done < <(find "$SOURCE_DIR" -type f -not -name ".gitignore" -print0 | sort -z)

echo ""
if [[ "$DRY_RUN" == true ]]; then
  echo "Dry run complete: $copied file(s) would be copied."
else
  echo "Done: $copied file(s) copied, $skipped file(s) skipped."
  if [[ $skipped -gt 0 ]]; then
    echo "Use --force to overwrite existing files, or --backup to save a copy first."
  fi
fi
