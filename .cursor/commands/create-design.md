---
description: Create system design and (optionally) UI design documents for a feature or sub-feature
---

# Create Design Document

You are creating a **Design** document for a feature or sub-feature. If the feature has a user interface, you will also create a **UI Design** document.

## Instructions

1. Read the template at `.cursor/templates/design.md`
2. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path — if it fails, stop and suggest `/init-docs`
3. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
   - **Has UI?** — does this feature have screens/pages the user interacts with?
4. Determine the doc path:
   - Simple: `{DOCS_PATH}/{feature-name}/`
   - Sub-feature: `{DOCS_PATH}/{parent}/{sub-feature}/`
5. Check if this feature has a design doc from a previous major version — if so, read it for context
6. Read the corresponding requirements doc at `{doc-path}/requirements.md`
7. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `{DOCS_PATH}/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, user flows)
8. Research existing code patterns in the codebase
9. Generate the design document following the template structure
10. Save to: `{doc-path}/design.md`
11. **If the feature has a UI:**
    - Read the template at `.cursor/templates/ui-design.md`
    - Read `docs/design-system.md` for project tokens, colors, typography
    - Generate the UI design document with ASCII wireframes + Tailwind classes
    - Save to: `{doc-path}/ui-design.md`

## Path Examples

Given current version `v0.1.0` (major = `v0`):

| Input            | Save path                                      |
| ---------------- | ---------------------------------------------- |
| `search`         | `docs/features/v0/search/design.md`            |
| `search` (UI)    | `docs/features/v0/search/ui-design.md`         |
| `listing/filter` | `docs/features/v0/listing/filter/design.md`    |

## Output Rules

### design.md

- Follow the template structure from `.cursor/templates/design.md`
- Requirements doc MUST exist before creating design — warn if missing
- Include mermaid diagram for architecture overview
- Document design decisions with trade-off analysis
- Define constraints specific to this feature
- For sub-features: reference the parent feature architecture where relevant

### ui-design.md (only if feature has UI)

- Follow the template structure from `.cursor/templates/ui-design.md`
- ASCII wireframes annotated with Tailwind classes for each key screen
- Include responsive breakpoint notes
- Document UI states: default, loading, empty, error
- Include screen flow diagram (mermaid)
- List animations only if they serve a purpose (state change, attention, feedback)
- Reference `docs/design-system.md` tokens — don't redefine colors/typography
