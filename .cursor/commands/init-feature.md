---
description: Initialize a complex feature with a single parent-level overview doc
---

# Initialize Complex Feature

You are initializing a **complex feature** that will contain multiple sub-features. This creates a single parent-level `README.md` that provides the high-level overview — scope, shared architecture, and sub-feature index.

**Principle**: Parent-level doc contains ONLY cross-cutting information. All implementation details (data models, API specs, screen layouts, validation, module structure) live exclusively in sub-feature docs. Zero duplication.

## Instructions

1. Read the template: `.cursor/templates/feature-overview.md`
2. Ask the user for:
   - **Feature name** (e.g., "listing", "scanning")
   - **Sub-features** list (e.g., "filter, export, search, detail")
3. Research the codebase for any existing related code, designs, or docs
4. Generate and save 1 file:
   - `docs/features/{feature-name}/README.md` — from `feature-overview.md` template

## What the README Covers

| Section             | Content                         | What NOT to include                                 |
| ------------------- | ------------------------------- | --------------------------------------------------- |
| Summary             | What & why                      | —                                                   |
| Sub-Features        | Table with links + status       | Sub-feature internals                               |
| Scope & Boundaries  | In/out of scope, future         | Detailed requirements per sub-feature               |
| User Flows          | Cross-feature flow diagram      | Screen-level flows (those go in sub-feature design) |
| Shared Architecture | Overview diagram, key decisions | Data models, API specs, code snippets, module trees |
| Shared Constraints  | Tech stack, shared NFRs         | Per-screen performance or accessibility details     |
| Open Questions      | Unresolved cross-cutting items  | Sub-feature-specific questions                      |
| Documentation Map   | File tree with links            | —                                                   |

## Output Rules

- Follow `feature-overview.md` template
- List all sub-features with status
- Architecture section: **diagrams and decision tables only** — no code, no DTOs, no API endpoint tables
- If shared data models or APIs exist, **name them and point to the sub-feature doc** that defines them — don't duplicate the definition
- After creation, suggest next steps: use `/create-requirements {feature}/{sub-feature}` for each sub-feature

## Expected Result

```
docs/features/{feature-name}/
└── README.md
```

Then the user creates sub-feature docs separately:

```
docs/features/{feature-name}/{sub-feature}/
├── requirements.md
├── design.md
├── implementation.md
└── testing.md
```

## Input

Feature: $ARGUMENTS
