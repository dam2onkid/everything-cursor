---
description: Create an implementation plan document for a feature or sub-feature
---

# Create Implementation Document

You are creating a **Planning & Implementation Guide** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/implementation.md`
2. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
3. Determine the doc path:
   - Simple: `docs/features/{feature-name}/`
   - Sub-feature: `docs/features/{parent}/{sub-feature}/`
4. Read the corresponding docs:
   - Requirements: `{doc-path}/requirements.md`
   - Design: `{doc-path}/design.md`
5. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `docs/features/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared architecture, constraints)
6. Analyze existing codebase structure and patterns for the target module
7. Generate the implementation document following the template structure
8. Save to: `{doc-path}/implementation.md`

## Path Examples

| Input            | Save path                                        |
| ---------------- | ------------------------------------------------ |
| `search`         | `docs/features/search/implementation.md`         |
| `listing/filter` | `docs/features/listing/filter/implementation.md` |
| `listing/export` | `docs/features/listing/export/implementation.md` |

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
