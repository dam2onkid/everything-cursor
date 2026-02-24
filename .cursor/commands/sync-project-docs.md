---
description: Sync all project-level docs with the current codebase state — detect drift and update
---

# Sync Project Documentation

You are **synchronizing** all project-level docs in `docs/` with the current state of the codebase. This command detects drift between documentation and code, then updates docs while preserving user-written content.

**Principle**: Docs should always reflect the current reality. When code changes, docs must follow. The Changelog tracks what changed and when.

## Instructions

1. Read ALL existing docs:
   - `VERSION.md` (project root)
   - `docs/overview.md`
   - `docs/architecture.md`
   - `docs/design-system.md`
   - `docs/database.md`
   - `docs/api.md`
   - `docs/roadmap.md`
2. If any file is **missing**, warn the user and suggest `/init-docs` to create it
3. Re-analyze the entire codebase for current state:
   - Dependencies and versions (`package.json`, lock files, etc.)
   - Folder structure changes (new/removed/renamed directories)
   - Database schema changes (new tables, columns, migrations)
   - API endpoint changes (new/removed/modified routes)
   - UI/theme changes (new components, design token changes)
   - Build/dev/test command changes
4. Compare current codebase state against each doc
5. For each doc with detected drift:
   - Update the sections that are outdated
   - Preserve user-written narrative content (don't overwrite prose with auto-generated text)
   - Add a Changelog entry with today's date and summary of what changed
6. Report a sync summary to the user

## Drift Detection Checklist

| Doc              | Check For                                                                 |
| ---------------- | ------------------------------------------------------------------------- |
| VERSION.md       | Feature list matches `docs/features/v{MAJOR}/` dirs, statuses are current |
| overview.md      | Project status changes, new features, command changes                     |
| architecture.md  | New/removed dependencies, folder restructure, pattern changes             |
| design-system.md | Theme/color changes, new component patterns, breakpoint changes           |
| database.md      | New tables/columns, schema migrations, index changes                      |
| api.md           | New/removed endpoints, auth changes, response format changes              |
| roadmap.md       | Milestone completion, priority shifts, new versions planned               |

## Changelog Format

Same format as `/update-feature-doc`:

```markdown
## Changelog

| Date       | Action  | Summary                                           |
| ---------- | ------- | ------------------------------------------------- |
| YYYY-MM-DD | Synced  | Added new User table, updated dependency versions |
| YYYY-MM-DD | Created | Initial creation                                  |
```

- **Action** values for sync: `Synced`, `Updated`, `Added`, `Removed`
- Newest entries go **first**

## Sync Rules

- **Replace outdated data** — when a dependency version changed, update it; don't keep the old version
- **Preserve prose** — user-written descriptions, rationale, and design philosophy should not be overwritten
- **Add, don't remove** — if a new table appears, add it; don't remove tables that still exist in schema
- **Flag ambiguity** — if a change is unclear (e.g., removed code that's still referenced in docs), flag it for user review instead of guessing
- **Skip unchanged docs** — if a doc is already in sync, don't touch it

## Sync Summary Format

After syncing, output a summary:

```
## Sync Summary

| Doc              | Status    | Changes                                    |
| ---------------- | --------- | ------------------------------------------ |
| VERSION.md       | Updated   | 1 feature status changed to done           |
| overview.md      | Updated   | Added 2 new features to index              |
| architecture.md  | Updated   | 3 dependencies updated, 1 new pattern      |
| design-system.md | No change | —                                          |
| database.md      | Updated   | New Payment table, updated User columns    |
| api.md           | Updated   | 4 new endpoints, auth flow revised         |
| roadmap.md       | No change | —                                          |
```

## Feature Docs

This command syncs **project-level** docs only (`docs/*.md`). Feature-level docs (`docs/features/`) are managed by `/update-feature-doc`.

If feature-level docs appear severely outdated during analysis, mention it in the sync summary as a recommendation.

## Input

$ARGUMENTS
