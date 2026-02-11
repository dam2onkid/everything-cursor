---
description: Create an implementation plan document for a feature
---

# Create Implementation Document

You are creating a **Planning & Implementation Guide** document for a feature.

## Instructions

1. Read the template at `.cursor/templates/implementation.md`
2. Read the corresponding docs:
   - Requirements: `docs/feature/{feature-name}/requirements.md`
   - Design: `docs/feature/{feature-name}/design.md`
3. Ask the user for:
   - **Feature name** (e.g., "search", "listing-detail")
4. Analyze existing codebase structure and patterns for the target module
5. Generate the implementation document following the template structure
6. Save to: `docs/feature/{feature-name}/implementation.md`

## Output Rules

- Follow the exact template structure from `.cursor/templates/implementation.md`
- Requirements and design docs MUST exist before creating implementation — warn if missing
- Break tasks into concrete, actionable items with checkboxes
- Reference specific files/directories from the existing codebase
- Follow established code patterns (Clean Architecture + MVVM for app)
- Include dependency graph between tasks
- Estimate effort per task/phase
- Document error handling and security considerations

## Input

Feature: $ARGUMENTS
