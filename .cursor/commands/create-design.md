---
description: Create a system design document for a feature
---

# Create Design Document

You are creating a **System Design & Architecture** document for a feature.

## Instructions

1. Read the template at `.cursor/templates/design.md`
2. Read the corresponding requirements doc at `docs/feature/{feature-name}/requirements.md`
3. Ask the user for:
   - **Feature name** (e.g., "search", "listing-detail")
4. Research existing code patterns in the codebase
5. Generate the design document following the template structure
6. Save to: `docs/feature/{feature-name}/design.md`

## Output Rules

- Follow the exact template structure from `.cursor/templates/design.md`
- Requirements doc MUST exist before creating design — warn if missing
- Include mermaid diagrams for architecture overview and screen/page flow
- Include ASCII wireframes for key screens/pages
- Document all key UI states: default, loading, empty, error, success
- Follow existing project patterns
- Define clear component boundaries and data flow
- Document design decisions with trade-off analysis

## Input

Feature: $ARGUMENTS
