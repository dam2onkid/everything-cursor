---
description: Create a testing strategy document for a feature or sub-feature
---

# Create Testing Document

You are creating a **Testing Strategy** document for a feature or sub-feature.

## Instructions

1. Read the template at `.cursor/templates/testing.md`
2. Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path — if it fails, stop and suggest `/init-docs`
3. Ask the user for:
   - **Feature path** — one of:
     - Simple feature: `"search"`, `"listing-detail"`
     - Sub-feature: `"listing/filter"`, `"listing/export"`
4. Determine the doc path:
   - Simple: `{DOCS_PATH}/{feature-name}/`
   - Sub-feature: `{DOCS_PATH}/{parent}/{sub-feature}/`
5. Check if this feature has a testing doc from a previous major version — if so, read it for context
6. Read the corresponding docs:
   - Requirements: `{doc-path}/requirements.md`
   - Design: `{doc-path}/design.md`
   - Implementation: `{doc-path}/implementation.md`
7. If this is a sub-feature:
   - Check if parent-level `README.md` exists at `{DOCS_PATH}/{parent}/README.md`
   - If **missing**, warn the user and suggest running `/init-feature {parent}` first
   - If it exists, read it for context (scope, shared architecture, constraints)
8. Analyze existing test patterns in the codebase
9. Generate the testing document following the template structure
10. Save to: `{doc-path}/testing.md`

## Path Examples

Given current version `v0.1.0` (major = `v0`):

| Input               | Save path                                           |
| ------------------- | --------------------------------------------------- |
| `search`            | `docs/features/v0/search/testing.md`                 |
| `listing/filter`    | `docs/features/v0/listing/filter/testing.md`         |
| `listing/export`    | `docs/features/v0/listing/export/testing.md`         |

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
