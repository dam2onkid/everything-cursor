---
description: Initialize a complex feature with parent-level overview, requirements, and design docs
---

# Initialize Complex Feature

You are initializing a **complex feature** that will contain multiple sub-features. This creates the 3 parent-level docs that provide the high-level view of the entire feature.

## Instructions

1. Read the templates:
   - `.cursor/templates/feature-overview.md`
   - `.cursor/templates/requirements.md`
   - `.cursor/templates/design.md`
2. Ask the user for:
   - **Feature name** (e.g., "listing", "scanning")
   - **Sub-features** list (e.g., "filter, export, search, detail")
3. Research the codebase for any existing related code, designs, or docs
4. Generate and save 3 files:
   - `docs/feature/{feature-name}/README.md` — from `feature-overview.md` template
   - `docs/feature/{feature-name}/requirements.md` — high-level requirements covering the whole feature
   - `docs/feature/{feature-name}/design.md` — overall architecture and how sub-features relate

## What Each File Covers

| File              | Purpose                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------ |
| `README.md`       | Feature overview, sub-feature map, documentation index, user flows                               |
| `requirements.md` | High-level problem statement, goals, shared constraints — NOT sub-feature details                |
| `design.md`       | Overall architecture, shared data models, how sub-features integrate — NOT sub-feature internals |

## Output Rules

- `README.md`: Follow `feature-overview.md` template. List all sub-features with status. Include documentation map.
- `requirements.md`: Follow `requirements.md` template. Focus on the **whole feature** scope. Reference sub-features but don't detail them.
- `design.md`: Follow `design.md` template. Focus on **shared architecture** — data models, APIs, component boundaries between sub-features. Don't detail individual sub-feature internals.
- All 3 files must be consistent with each other
- After creation, suggest next steps: use `create-requirements {feature}/{sub-feature}` for each sub-feature

## Expected Result

```
docs/feature/{feature-name}/
├── README.md
├── requirements.md
└── design.md
```

Then the user creates sub-feature docs separately:

```
docs/feature/{feature-name}/{sub-feature}/
├── requirements.md
├── design.md
├── implementation.md
└── testing.md
```

## Input

Feature: $ARGUMENTS
