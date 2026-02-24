---
description: Create a system design document for a feature or sub-feature
---

# Create Design Document

You are creating a **System Design & Architecture** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/design.md`
2. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path — if it fails, stop and suggest `/init-docs`
3. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
4. Determine the doc path:
   - Simple: `{DOCS_PATH}/{feature-name}/`
   - Sub-feature: `{DOCS_PATH}/{parent}/{sub-feature}/`
5. Check if this feature has a design doc from a previous major version — if so, read it for context
6. Read the corresponding requirements doc at `{doc-path}/requirements.md`
7. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `{DOCS_PATH}/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared architecture, constraints)
8. Research existing code patterns in the codebase
9. Generate the design document following the template structure
10. Save to: `{doc-path}/design.md`

## Path Examples

Given current version `v0.1.0` (major = `v0`):

| Input            | Save path                                   |
| ---------------- | ------------------------------------------- |
| `search`         | `docs/features/v0/search/design.md`         |
| `listing/filter` | `docs/features/v0/listing/filter/design.md` |
| `listing/export` | `docs/features/v0/listing/export/design.md` |

## Output Rules

- Follow the exact template structure from `.cursor/templates/design.md`
- Requirements doc MUST exist before creating design — warn if missing
- Include mermaid diagrams for architecture overview and screen/page flow
- Include ASCII wireframes for key screens/pages
- Document all key UI states: default, loading, empty, error, success
- Follow existing project patterns
- Define clear component boundaries and data flow
- Document design decisions with trade-off analysis
- For sub-features: reference the parent feature architecture where relevant
