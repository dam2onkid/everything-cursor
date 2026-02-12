---
description: Create a system design document for a feature or sub-feature
---

# Create Design Document

You are creating a **System Design & Architecture** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/design.md`
2. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
3. Determine the doc path:
   - Simple: `docs/feature/{feature-name}/`
   - Sub-feature: `docs/feature/{parent}/{sub-feature}/`
4. Read the corresponding requirements doc at `{doc-path}/requirements.md`
5. If this is a sub-feature:
   - Check if parent-level docs exist at `docs/feature/{parent}/` (`README.md`, `requirements.md`, `design.md`)
   - If parent-level docs are **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If they exist, read them for context
6. Research existing code patterns in the codebase
7. Generate the design document following the template structure
8. Save to: `{doc-path}/design.md`

## Path Examples

| Input            | Save path                               |
| ---------------- | --------------------------------------- |
| `search`         | `docs/feature/search/design.md`         |
| `listing/filter` | `docs/feature/listing/filter/design.md` |
| `listing/export` | `docs/feature/listing/export/design.md` |

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

## Input

Feature: $ARGUMENTS
