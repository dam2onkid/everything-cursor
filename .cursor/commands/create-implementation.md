---
description: Create an implementation plan document for a feature or sub-feature
---

# Create Implementation Document

You are creating a **Planning & Implementation Guide** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/implementation.md`
2. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path — if it fails, stop and suggest `/init-docs`
3. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
4. Determine the doc path:
   - Simple: `{DOCS_PATH}/{feature-name}/`
   - Sub-feature: `{DOCS_PATH}/{parent}/{sub-feature}/`
5. Check if this feature has an implementation doc from a previous major version — if so, read it for context
6. Read the corresponding docs:
   - Requirements: `{doc-path}/requirements.md`
   - Design: `{doc-path}/design.md`
7. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `{DOCS_PATH}/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared architecture, constraints)
8. Analyze existing codebase structure and patterns for the target module
9. Generate the implementation document following the template structure
10. Save to: `{doc-path}/implementation.md`

## Path Examples

Given current version `v0.1.0` (major = `v0`):

| Input            | Save path                                             |
| ---------------- | ----------------------------------------------------- |
| `search`         | `docs/features/v0/search/implementation.md`           |
| `listing/filter` | `docs/features/v0/listing/filter/implementation.md`   |
| `listing/export` | `docs/features/v0/listing/export/implementation.md`   |

## Output Rules

- Follow the exact template structure from `.cursor/templates/implementation.md`
- Requirements and design docs MUST exist before creating implementation — warn if missing
- Break tasks into concrete, actionable items with checkboxes
- Reference specific files/directories from the existing codebase
- Follow established code patterns (Clean Architecture + MVVM for app)
- Include dependency graph between tasks
- Estimate effort per task/phase
- Document error handling and security considerations
- For sub-features: reference the parent feature implementation context where relevant
