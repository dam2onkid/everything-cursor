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
   - Simple: `docs/features/{feature-name}/`
   - Sub-feature: `docs/features/{parent}/{sub-feature}/`
4. Read the corresponding requirements doc at `{doc-path}/requirements.md`
5. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `docs/features/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared architecture, constraints)
6. Research existing code patterns in the codebase
7. Generate the design document following the template structure
8. Save to: `{doc-path}/design.md`

## Path Examples

| Input            | Save path                                |
| ---------------- | ---------------------------------------- |
| `search`         | `docs/features/search/design.md`         |
| `listing/filter` | `docs/features/listing/filter/design.md` |
| `listing/export` | `docs/features/listing/export/design.md` |

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

The user provides both the feature path and detailed context. Parse the first line or phrase as the **feature path**, and treat everything else as **design context**.

If the user only provides a feature name with no description, **ask for more details** before generating — include architecture preferences, performance targets, tech stack constraints, or UI expectations.

**Good input example:**

```
listing/filter

Filter system for property listings page.
- Filter by: price range (slider), bedrooms (1-5+), area (district multi-select), property type
- Filters apply instantly without page reload (URL params sync)
- "Save filter" for logged-in users (max 5 saved filters)
- Must handle 50k+ listings with <100ms filter response
- Backend: Supabase with PostGIS for location queries
- Frontend: Next.js with Zustand for filter state
```

**Insufficient input example (ask for more):**

```
listing/filter
```

Feature: $ARGUMENTS
