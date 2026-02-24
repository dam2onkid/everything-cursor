---
description: Tag the current version as a SemVer release, then advance VERSION.md to the next version
---

# Ship Version

You are **shipping the current version** — creating a git tag and advancing the project to the next version.

## Instructions

1. Run `.cursor/scripts/get-version.sh` to get the full version — if it fails, stop and suggest `/init-docs`
2. Run `.cursor/scripts/get-default-branch.sh` to get the default branch name
3. Read `VERSION.md` and validate that **all features** in the Current section have status `done`
   - If any feature is not `done`, list the incomplete features and stop
4. Ensure the working tree is on the default branch and is clean (`git status --porcelain` is empty)
   - If not, warn the user and stop
5. Analyze changes since the last release:
   - Get the latest tag: `git describe --tags --abbrev=0 2>/dev/null`
   - If no tags exist, this is the first release — diff against the initial commit
   - Run `git log --oneline {latest-tag}..HEAD` to summarize changes
   - Suggest a SemVer bump type:
     - **PATCH** — only bug fixes, docs, refactors (no new features)
     - **MINOR** — new features, backward-compatible changes
     - **MAJOR** — breaking changes or major milestone (e.g., `v0.x.x` → `v1.0.0` for first stable)
   - Present the suggestion and let the user **confirm or override**
6. Use the version from the script output (the `## Current: vX.Y.Z` value)
7. Create an **annotated git tag**:
   ```bash
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   ```
8. Update `VERSION.md`:
   - Move the current version's feature table into the `## Released` table as a new row with today's date and a one-line summary
   - Set `## Current:` to the next version (based on the confirmed bump)
   - Ask the user for the **next version's feature list** and populate the feature table with `not-started` statuses
   - For features carried over from the current version, set **Prior Version** to `docs/features/v{CURRENT_MAJOR}/{feature-name}/`
   - New features get `-` in the Prior Version column
9. If the MAJOR version changed (e.g., `v0.x.x` → `v1.0.0`), note that feature docs for the new version will live in a new directory (`docs/features/v{NEW_MAJOR}/`)
10. Push the tag: `git push origin vX.Y.Z`
11. Report the result:
    - Tag created
    - VERSION.md updated to next version
    - Suggest next steps: `/init-feature {name}` to start working on the new version's features

## SemVer Reference

| Bump  | When                                  | Example            |
| ----- | ------------------------------------- | ------------------ |
| PATCH | Bug fixes, docs, no new features      | v1.0.0 → v1.0.1   |
| MINOR | New features, backward-compatible     | v1.0.0 → v1.1.0   |
| MAJOR | Breaking changes or major milestone   | v0.2.0 → v1.0.0   |

`v0.x.x` = initial development (pre-stable). `v1.0.0` = first stable release.

## Feature Status Values

| Status      | Meaning                    |
| ----------- | -------------------------- |
| not-started | Work has not begun         |
| in-progress | Currently being worked on  |
| done        | Merged into default branch |

## Input

$ARGUMENTS
