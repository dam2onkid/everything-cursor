---
description: Initialize project-level documentation — overview, architecture, design system, database, API, and roadmap
---

# Initialize Project Documentation

You are generating **project-level documentation** that describes the entire application at a high level. These docs live in `docs/` and serve as the LLM's primary context for understanding the project.

**Principle**: Each doc file has a single responsibility. No content duplication between files. Feature-level details stay in `docs/features/`.

## Instructions

1. Read ALL 7 templates:
   - `.cursor/templates/docs-overview.md`
   - `.cursor/templates/docs-architecture.md`
   - `.cursor/templates/docs-design-system.md`
   - `.cursor/templates/docs-database.md`
   - `.cursor/templates/docs-api.md`
   - `.cursor/templates/docs-roadmap.md`
   - `.cursor/templates/version.md`
2. Ask the user for:
   - **Project name**
   - **One-line description** (what it does, who it serves)
   - **Confirm or correct** the auto-detected tech stack
   - **Initial version** (default: `v0.1.0`)
   - **Planned features** for the initial version
3. Analyze the codebase:
   - Package manager and dependencies (`package.json`, `pubspec.yaml`, `Cargo.toml`, etc.)
   - Folder structure (top 2-3 levels)
   - Database schemas, migrations, or ORM models
   - API routes, endpoints, or controllers
   - UI framework, theme configuration, component library
   - Existing `docs/` content (skip files that already exist)
4. Generate 7 files:
   - `VERSION.md` (project root) — from `version.md` template, populated with the initial version and feature list
   - `docs/overview.md` — from `docs-overview.md` template
   - `docs/architecture.md` — from `docs-architecture.md` template
   - `docs/design-system.md` — from `docs-design-system.md` template
   - `docs/database.md` — from `docs-database.md` template
   - `docs/api.md` — from `docs-api.md` template
   - `docs/roadmap.md` — from `docs-roadmap.md` template
5. If any file already exists, **skip it** and notify the user — suggest `/sync-project-docs` to update existing docs

## Content Boundaries (No Overlap)

| File              | Owns                                        | Does NOT contain                     |
| ----------------- | ------------------------------------------- | ------------------------------------ |
| overview.md       | Concept, quick ref, doc index, key decisions| Detailed tech stack, schemas, APIs   |
| architecture.md   | Tech stack, folder structure, patterns, infra| UI/UX details, DB schemas, endpoints |
| design-system.md  | Colors, typography, spacing, components      | Architecture, data models, API specs |
| database.md       | ERD, tables, indexes, relationships          | API endpoints, UI patterns           |
| api.md            | Endpoints, auth, response format, conventions| DB schemas, UI components            |
| roadmap.md        | Versions, milestones, priorities, backlog    | Implementation details, tech specs   |
| VERSION.md (root) | Current version, feature statuses, releases  | Milestones, architecture, tech specs |

## Output Rules

- Follow each template structure exactly
- Fill sections with real data from codebase analysis — do NOT leave placeholder text when actual data is available
- Use mermaid diagrams for architecture, ERD, and API flows
- `overview.md` must link to all other docs, `VERSION.md`, and `docs/features/v{MAJOR}/` if it exists
- `VERSION.md` must list all planned features for the initial version with `not-started` status
- `roadmap.md` must use SemVer versions (v0.1.0, v0.2.0, v1.0.0) — no "MVP" label
- Set today's date in all Changelog entries
- After creation, suggest next steps:
  - Use `/init-feature {name}` to start working on a feature (creates branch and docs)
  - Use `/sync-project-docs` to keep docs in sync after codebase changes
  - Use `/ship-version` when all features for the current version are done

## Expected Result

```
VERSION.md               ← project root
docs/
├── overview.md
├── architecture.md
├── design-system.md
├── database.md
├── api.md
└── roadmap.md
```
