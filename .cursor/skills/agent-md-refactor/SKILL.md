---
name: agent-md-refactor
description: Create, sync, and refactor project documentation and agent instruction files. Manages the full docs lifecycle — from initialization through drift detection to progressive disclosure refactoring.
license: MIT
---

# Agent MD Refactor

Full lifecycle management for project documentation and agent instruction files. Handles **creation**, **syncing**, and **refactoring** — using progressive disclosure principles and the project's docs workflow.

---

## Triggers

Use this skill when:

### Create
- "create project docs" / "init docs"
- "set up documentation for this project"
- "generate overview, architecture, database docs"

### Sync
- "sync docs" / "update docs"
- "docs are outdated"
- "codebase changed, update documentation"
- "sync all project documentation"

### Refactor
- "refactor my AGENTS.md" / "refactor my CLAUDE.md"
- "split my agent instructions"
- "organize my CLAUDE.md file"
- "my AGENTS.md is too long"
- "progressive disclosure for my instructions"
- "clean up my agent config"

---

## Quick Reference

| Mode | Action | Output |
|------|--------|--------|
| **Create** | Analyze codebase, generate docs | 6 project-level docs in `docs/` |
| **Sync** | Detect drift, update outdated docs | Updated docs with changelog entries |
| **Refactor** | Split bloated files | Root + linked files with progressive disclosure |

---

## Mode 1: Create Project Docs

Generate project-level documentation from codebase analysis.

### Process

1. Check if `docs/` already has files — if so, suggest **Sync** mode instead
2. Read all templates from `.cursor/templates/docs-*.md`
3. Analyze the codebase:
   - Package manager and dependencies
   - Folder structure (top 2-3 levels)
   - Database schemas, migrations, ORM models
   - API routes, endpoints, controllers
   - UI framework, theme, component library
4. Ask the user for: project name, one-line description, tech stack confirmation
5. Generate 6 files:

| File | Template | Owns |
|------|----------|------|
| `docs/overview.md` | `docs-overview.md` | Concept, quick ref, doc index |
| `docs/architecture.md` | `docs-architecture.md` | Tech stack, folder structure, patterns |
| `docs/design-system.md` | `docs-design-system.md` | Colors, typography, spacing, components |
| `docs/database.md` | `docs-database.md` | ERD, tables, indexes, relationships |
| `docs/api.md` | `docs-api.md` | Endpoints, auth, response format |
| `docs/roadmap.md` | `docs-roadmap.md` | Versions, milestones, priorities |

### Content Rules

- Each file has a single responsibility — no overlap
- Fill with real data from codebase, not placeholder text
- `overview.md` links to all other docs (serves as index)
- Feature details stay in `docs/features/`, not here

### After Creation

Suggest: `/init-feature {name}` for feature docs, `/sync-docs` to keep docs current.

---

## Mode 2: Sync Docs

Detect drift between documentation and codebase, then update.

### Process

1. Read all existing `docs/*.md` files
2. Re-analyze the codebase for current state
3. Compare against each doc and detect drift:

| Doc | Check For |
|-----|-----------|
| overview.md | Project status, new features, command changes |
| architecture.md | Dependency changes, folder restructure, new patterns |
| design-system.md | Theme/color changes, new components, breakpoints |
| database.md | New tables/columns, migrations, index changes |
| api.md | New/removed endpoints, auth changes, format changes |
| roadmap.md | Milestone completion, priority shifts, new versions |

4. For each outdated doc:
   - Update sections with current data
   - Preserve user-written prose (descriptions, rationale, philosophy)
   - Add Changelog entry: date, action (`Synced`/`Updated`/`Added`/`Removed`), summary
5. Output a sync summary table showing what changed per doc

### Sync Rules

- Replace outdated data, preserve prose
- Add new content, don't remove still-valid content
- Flag ambiguous changes for user review
- Skip unchanged docs

---

## Mode 3: Refactor Agent Instructions

Split bloated agent instruction files (AGENTS.md, CLAUDE.md, etc.) into progressive disclosure structure.

### Phase 1: Find Contradictions

Identify conflicting instructions.

**Look for:**
- Contradictory style guidelines (e.g., "use semicolons" vs "no semicolons")
- Conflicting workflow instructions
- Incompatible tool preferences
- Mutually exclusive patterns

**For each contradiction:** present both instructions and ask the user to resolve.

### Phase 2: Identify the Essentials

Extract ONLY what belongs in the root file — information that applies to **every single task**.

**Keep in root:**

| Category | Example |
|----------|---------|
| Project description | One sentence: "A React dashboard for analytics" |
| Package manager | Only if not npm (e.g., "Uses pnpm") |
| Non-standard commands | Custom build/test/typecheck commands |
| Critical overrides | Things that MUST override defaults |
| Universal rules | Applies to 100% of tasks |

**Move to linked files:** language conventions, testing, code style, framework patterns, docs standards, git workflow.

### Phase 3: Group the Rest

Organize into logical categories (3-8 files). Each file is self-contained for its topic.

**Common categories:**

| Category | Contents |
|----------|----------|
| `typescript.md` | TS conventions, type patterns, strict mode rules |
| `testing.md` | Test frameworks, coverage, mocking patterns |
| `code-style.md` | Formatting, naming, comments, structure |
| `git-workflow.md` | Commits, branches, PRs, reviews |
| `architecture.md` | Patterns, folder structure, dependencies |
| `api-design.md` | REST/GraphQL conventions, error handling |
| `security.md` | Auth patterns, input validation, secrets |

### Phase 4: Create the File Structure

```
project-root/
├── CLAUDE.md (or AGENTS.md)     # Minimal root with links
└── .claude/                      # Or .cursor/rules/ or docs/
    ├── typescript.md
    ├── testing.md
    ├── code-style.md
    └── architecture.md
```

**Root file:** under 50 lines, only universal info + links to detailed files.

### Phase 5: Flag for Deletion

Remove instructions that are:

| Criterion | Example | Why Delete |
|-----------|---------|------------|
| Redundant | "Use TypeScript" (in a .ts project) | Agent already knows |
| Too vague | "Write clean code" | Not actionable |
| Overly obvious | "Don't introduce bugs" | Wastes context |
| Default behavior | "Use descriptive variable names" | Standard practice |
| Outdated | References deprecated APIs | No longer applies |

---

## Workflow Integration

This skill works with the project's existing documentation workflow:

| Command | Purpose | Scope |
|---------|---------|-------|
| `/init-docs` | Generate all project-level docs | `docs/*.md` |
| `/sync-docs` | Update project docs after changes | `docs/*.md` |
| `/init-feature` | Initialize feature documentation | `docs/features/{name}/` |
| `/update-docs` | Update a specific feature doc | `docs/features/{name}/*.md` |

**Rule:** `docs-context.mdc` (always applied) routes the LLM to read `docs/overview.md` first as the project index.

**Templates:** All doc templates live in `.cursor/templates/docs-*.md`.

**Documentation hierarchy:**
```
docs/overview.md              ← Project index (read first)
docs/{other}.md               ← Project-level docs (read on demand)
docs/features/{name}/         ← Feature-level docs (read per feature)
```

---

## Execution Checklist

### For Create mode
```
[ ] All 6 templates read
[ ] Codebase analyzed (deps, structure, DB, API, UI)
[ ] All 6 docs generated with real data
[ ] overview.md links to all other docs
[ ] No placeholder text where real data is available
```

### For Sync mode
```
[ ] All existing docs read
[ ] Codebase re-analyzed
[ ] Drift detected per doc
[ ] Outdated sections updated
[ ] Prose preserved
[ ] Changelog entries added
[ ] Sync summary output
```

### For Refactor mode
```
[ ] All contradictions identified and resolved
[ ] Root file contains ONLY essentials
[ ] All remaining instructions categorized
[ ] File structure created with proper links
[ ] Redundant/vague instructions removed
[ ] Each linked file is self-contained
[ ] Root file is under 50 lines
[ ] All links work correctly
```

---

## Anti-Patterns

| Avoid | Why | Instead |
|-------|-----|---------|
| Keeping everything in root | Bloated, hard to maintain | Split into linked files |
| Too many categories | Fragmentation | Consolidate related topics |
| Vague instructions | Wastes tokens, no value | Be specific or delete |
| Duplicating defaults | Agent already knows | Only override when needed |
| Deep nesting | Hard to navigate | Flat structure with links |
| Overlapping docs | Context waste, contradictions | Single responsibility per file |
| Reading all docs at once | Token waste | Progressive disclosure — overview first |

---

## Verification

After any mode, verify:

1. **No overlap** — each file owns its topic exclusively
2. **Links work** — all referenced files exist
3. **No contradictions** — instructions are consistent across files
4. **Actionable content** — every instruction is specific and useful
5. **Complete coverage** — no information was lost (unless flagged for deletion)
6. **Changelog updated** — all changes tracked with dates

---
