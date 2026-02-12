---
description: Create a testing strategy document for a feature or sub-feature
---

# Create Testing Document

You are creating a **Testing Strategy** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/testing.md`
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
   - Implementation: `{doc-path}/implementation.md`
5. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `docs/features/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared architecture, constraints)
6. Analyze existing test patterns in the codebase
7. Generate the testing document following the template structure
8. Save to: `{doc-path}/testing.md`

## Path Examples

| Input               | Save path                                      |
| ------------------- | ---------------------------------------------- |
| `search`            | `docs/features/search/testing.md`               |
| `listing/filter`    | `docs/features/listing/filter/testing.md`       |
| `listing/export`    | `docs/features/listing/export/testing.md`       |

## Output Rules

- Follow the exact template structure from `.cursor/templates/testing.md`
- Implementation doc MUST exist before creating testing — warn if missing
- Derive test cases from requirements acceptance criteria and design specifications
- Cover unit, integration, and E2E tests
- Include edge cases and error scenarios
- Reference specific components/classes to test from the implementation doc
- Define test data and fixtures needed
- Set coverage goals aligned with project standards
- For sub-features: reference the parent feature test context where relevant

## Input

The user provides both the feature path and detailed context. Parse the first line or phrase as the **feature path**, and treat everything else as **testing context**.

If the user only provides a feature name with no description, **ask for more details** before generating — include critical paths to test, known edge cases, performance thresholds, or specific user scenarios.

**Good input example:**

```
listing/filter

Critical scenarios:
- Combining multiple filters simultaneously (price + category + location)
- Empty results state when no listings match
- Filter state persists on page refresh via URL params
- Saved filters load correctly for returning users
- Performance: filter response <100ms with 50k listings
Edge cases:
- Max price < min price (should show validation error)
- Special characters in search-within-filter
- Rapid filter toggling (debounce handling)
```

**Insufficient input example (ask for more):**

```
listing/filter
```

Feature: $ARGUMENTS
