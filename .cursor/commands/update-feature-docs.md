---
description: Update an existing feature or sub-feature document and add a changelog entry
---

# Update Feature Document

You are updating an existing feature document and tracking the change in a **Changelog** section.

## Instructions

1. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path — if it fails, stop and suggest `/init-docs`
2. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
   - **Document type** to update: `requirements`, `design`, `implementation`, or `testing`
   - **What changed** (brief description of the update)
3. Determine the doc path:
   - Simple: `{DOCS_PATH}/{feature-name}/{doc-type}.md`
   - Sub-feature: `{DOCS_PATH}/{parent}/{sub-feature}/{doc-type}.md`
4. Read the target document at the determined path
5. If the document does NOT exist, stop and warn the user — suggest using the corresponding `create-*` command instead
6. Apply the requested changes to the document content
7. Add or update the **Changelog** section at the top of the document (right after the YAML frontmatter and title)
8. Save the updated document

## Changelog Format

Insert the changelog block immediately after the document title (`# ...`). If a `## Changelog` section already exists, prepend the new entry to it. If it doesn't exist, create it.

```markdown
## Changelog

| Date       | Action  | Summary                                           |
| ---------- | ------- | ------------------------------------------------- |
| YYYY-MM-DD | Updated | Redesigned Data Models section (replaced old ERD) |
| YYYY-MM-DD | Created | Initial creation                                  |
```

- Use today's date
- Newest entries go **first** (top of table)
- Keep entries concise (1 line each)
- **Action** column values: `Created`, `Updated`, `Removed`, `Replaced`

## Content Replacement Rules

When updating a section with new content that **replaces** the old design:

1. **Remove** the outdated content from the document body entirely
2. **Record** what was removed in the Changelog summary (e.g., "Replaced old polling-based API Design with WebSocket approach")
3. **Write** only the new/current content in the document

This keeps the document lean — the Changelog serves as the historical record, not the document body.

### Path Examples

Given current version `v0.1.0` (major = `v0`):

| Input            | Doc type       | Target path                                       |
| ---------------- | -------------- | ------------------------------------------------- |
| `search`         | `design`       | `docs/features/v0/search/design.md`               |
| `listing/filter` | `requirements` | `docs/features/v0/listing/filter/requirements.md` |
| `listing/export` | `design`       | `docs/features/v0/listing/export/design.md`       |

### Example

If the user says "thay đổi Data Models từ SQL sang NoSQL":

| Date       | Action   | Summary                                                        |
| ---------- | -------- | -------------------------------------------------------------- |
| 2026-02-12 | Replaced | Data Models: removed SQL schema, replaced with NoSQL doc model |

The old SQL schema is **deleted** from the doc. Only the new NoSQL model remains.

## Output Rules

- **Replace, don't append** — when a section is redesigned, remove the old version and write the new one
- Preserve unchanged sections as-is
- The Changelog is the **only place** old decisions are referenced (briefly)
- Ensure the changelog summary is descriptive enough to understand what was removed without needing to see it
- If multiple sections are updated, list each in a separate changelog row

## Input

Feature: $ARGUMENTS
