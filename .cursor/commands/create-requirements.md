---
description: Create a requirements document for a feature or sub-feature
---

# Create Requirements Document

You are creating a **Requirements & Problem Understanding** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/requirements.md`
2. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"profile-screen"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
3. Determine the save path:
   - Simple: `docs/features/{feature-name}/requirements.md`
   - Sub-feature: `docs/features/{parent}/{sub-feature}/requirements.md`
4. Research the codebase for any existing related code, designs, or docs for this feature
5. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `docs/features/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared constraints, sub-feature index)
6. Generate the requirements document following the template structure
7. Save to the determined path

## Path Examples

| Input               | Save path                                       |
| ------------------- | ----------------------------------------------- |
| `search`            | `docs/features/search/requirements.md`           |
| `listing/filter`    | `docs/features/listing/filter/requirements.md`   |
| `listing/export`    | `docs/features/listing/export/requirements.md`   |

## Output Rules

- Follow the exact template structure from `.cursor/templates/requirements.md`
- Keep user stories specific and actionable with acceptance criteria
- Clearly define non-goals to prevent scope creep
- List all open questions that need stakeholder input
- For sub-features: reference the parent feature context where relevant

## Input

Feature: $ARGUMENTS
