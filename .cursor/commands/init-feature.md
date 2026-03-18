---
description: Initialize a complex feature with a single parent-level overview doc
---

# Initialize Complex Feature

You are initializing a **complex feature** that will contain multiple sub-features. This creates a single parent-level `README.md` that provides the high-level overview — scope and sub-feature index.

**Principle**: Parent-level doc contains ONLY cross-cutting information. All implementation details (data models, API specs, screen layouts, validation, module structure) live exclusively in sub-feature docs. Zero duplication.

## Instructions

1. Read the template: `.cursor/templates/feature-overview.md`
2. Run `.cursor/scripts/get-version.sh` to get the full version — if it fails, stop and suggest `/init-docs`
3. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path
4. Run `.cursor/scripts/get-default-branch.sh` to get the default branch name
5. Ask the user for:
   - **Feature name** (e.g., "listing", "scanning")
   - **Sub-features** list (e.g., "filter, export, search, detail")
6. Create and switch to a new git branch: `feat/{version}/{feature-name}` from the default branch
   - Example: `feat/v0.1.0/auth`
   - If the branch already exists, switch to it and inform the user
7. Check if this feature existed in a previous major version — if so, read the old docs for context
8. Research the codebase for any existing related code, designs, or docs
9. Generate and save 1 file:
   - `{docs-path}/{feature-name}/README.md` — from `feature-overview.md` template
10. Update `VERSION.md`: add the feature to the Current version's feature table with `not-started` status (if not already listed)

## What the README Covers

| Section      | Content                    | What NOT to include                                 |
| ------------ | -------------------------- | --------------------------------------------------- |
| Summary      | What & why                 | —                                                   |
| Sub-Features | Table with links + status  | Sub-feature internals                               |
| Scope        | In/out of scope            | Detailed requirements per sub-feature               |
| User Flows   | Cross-feature flow diagram | Screen-level flows (those go in sub-feature design) |

## Output Rules

- Follow `feature-overview.md` template
- List all sub-features with status
- Use major-version paths in all doc references: `docs/features/v{MAJOR}/{feature-name}/`
- After creation, suggest next steps: use `/create-requirements {feature}/{sub-feature}` for each sub-feature

## Expected Result

```
docs/features/v{MAJOR}/{feature-name}/
└── README.md
```

Then the user creates sub-feature docs separately:

```
docs/features/v{MAJOR}/{feature-name}/{sub-feature}/
├── requirements.md
├── design.md
├── ui-design.md    ← optional, only for features with UI
├── implementation.md
└── testing.md
```
