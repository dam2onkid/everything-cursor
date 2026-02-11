---
description: Create a testing strategy document for a feature
---

# Create Testing Document

You are creating a **Testing Strategy** document for a feature.

## Instructions

1. Read the template at `.cursor/templates/testing.md`
2. Read the corresponding docs:
   - Requirements: `docs/feature/{feature-name}/requirements.md`
   - Design: `docs/feature/{feature-name}/design.md`
   - Implementation: `docs/feature/{feature-name}/implementation.md`
3. Ask the user for:
   - **Feature name** (e.g., "search", "listing-detail")
4. Analyze existing test patterns in the codebase
5. Generate the testing document following the template structure
6. Save to: `docs/feature/{feature-name}/testing.md`

## Output Rules

- Follow the exact template structure from `.cursor/templates/testing.md`
- Implementation doc MUST exist before creating testing — warn if missing
- Derive test cases from requirements acceptance criteria and design specifications
- Cover unit, integration, and E2E tests
- Include edge cases and error scenarios
- Reference specific components/classes to test from the implementation doc
- Define test data and fixtures needed
- Set coverage goals aligned with project standards

## Input

Feature: $ARGUMENTS
