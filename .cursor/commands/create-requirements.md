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

The user provides both the feature path and detailed context. Parse the first line or phrase as the **feature path**, and treat everything else as **requirements context**.

If the user only provides a feature name with no description, **ask for more details** before generating — the more context, the better the output.

**Good input example:**

```
search

Full-text and semantic search for marketplace listings.
- Users can search by title, description, tags, and seller name
- Results ranked by relevance with filters (price range, category, date)
- Must support Vietnamese diacritics and fuzzy matching
- Autocomplete suggestions (debounced 300ms)
- Target: <200ms response time for 500k listings
```

**Insufficient input example (ask for more):**

```
search
```

Feature: $ARGUMENTS
