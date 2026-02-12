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

Feature: $ARGUMENTS
