---
description: Create a requirements document for a feature or sub-feature
---

# Create Requirements Document

You are creating a **Requirements & Problem Understanding** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/requirements.md`
2. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path — if it fails, stop and suggest `/init-docs`
3. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"profile-screen"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
4. Determine the save path:
   - Simple: `{DOCS_PATH}/{feature-name}/requirements.md`
   - Sub-feature: `{DOCS_PATH}/{parent}/{sub-feature}/requirements.md`
5. Check if this feature has docs from a previous major version — if so, read old requirements for context
6. Research the codebase for any existing related code, designs, or docs for this feature
7. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `{DOCS_PATH}/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared constraints, sub-feature index)
8. Generate the requirements document following the template structure
9. Save to the determined path
10. Update `VERSION.md`: set the feature's status to `in-progress` (if currently `not-started`)

## Path Examples

Given current version `v0.1.0` (major = `v0`):

| Input               | Save path                                            |
| ------------------- | ---------------------------------------------------- |
| `search`            | `docs/features/v0/search/requirements.md`            |
| `listing/filter`    | `docs/features/v0/listing/filter/requirements.md`    |
| `listing/export`    | `docs/features/v0/listing/export/requirements.md`    |

## Output Rules

- Follow the exact template structure from `.cursor/templates/requirements.md`
- Keep user stories specific and actionable with acceptance criteria
- Clearly define non-goals to prevent scope creep
- List all open questions that need stakeholder input
- For sub-features: reference the parent feature context where relevant
