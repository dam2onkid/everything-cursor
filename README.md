# everything-cursor

A batteries-included `.cursor` configuration for AI-assisted development. Provides structured commands, rules, agents, skills, and templates to enforce consistent workflows across any project.

## Setup

```bash
git clone https://github.com/<your-org>/everything-cursor.git
cp -r everything-cursor/.cursor /path/to/your-project/
```

Open your project in Cursor and the rules, commands, and agents are ready to use.

## What's Included

```
.cursor/
├── commands/          # Slash commands for Cursor chat
├── rules/
│   ├── common/        # Language-agnostic rules (always applied)
│   └── typescript/    # TypeScript-specific rules (applied to .ts/.tsx/.js/.jsx)
├── agents/            # Specialized AI agents
├── scripts/           # Cross-platform helper scripts used by commands
├── skills/            # Reusable multi-mode skills
└── templates/         # Document templates used by commands
```

## Commands

Run these in Cursor chat with `/command-name`.

| Command                  | Description                                                                     |
| ------------------------ | ------------------------------------------------------------------------------- |
| `/init-docs`             | Initialize project docs + `VERSION.md` from codebase analysis                   |
| `/sync-project-docs`     | Detect drift between docs/VERSION.md and code, update outdated sections         |
| `/init-feature`          | Initialize a feature with overview doc + `feat/{version}/{name}` branch         |
| `/create-requirements`   | Create a requirements document for a feature or sub-feature                     |
| `/create-design`         | Create a system design & architecture document                                  |
| `/create-implementation` | Create an implementation plan document                                          |
| `/create-testing`        | Create a testing strategy document                                              |
| `/update-feature-docs`   | Update an existing feature doc and add a changelog entry                        |
| `/code-review`           | Run a comprehensive security and quality review on uncommitted changes          |
| `/run-tests`             | Run all tests, curl API endpoints, save results, and auto-fix failures          |
| `/tdd`                   | Start a TDD session — scaffolds interfaces, writes tests first, then implements |
| `/pr`                    | Sync docs, commit, push, and open a PR targeting the default branch             |
| `/ship-version`          | Tag current version (SemVer), advance VERSION.md to next version                |

## Workflows

### Project Documentation

Initialize and maintain project-level docs that give the AI full context about your codebase.

```
/init-docs
    │  generates VERSION.md + 6 docs from codebase analysis
    ▼
VERSION.md               ← current version, feature statuses, release history
docs/
├── overview.md          ← project index (AI reads this first)
├── architecture.md      ← tech stack, folder structure, patterns
├── design-system.md     ← colors, typography, spacing, components
├── database.md          ← ERD, tables, indexes, relationships
├── api.md               ← endpoints, auth, response format
└── roadmap.md           ← versions, milestones, priorities
```

After code changes, sync docs to keep them current:

```
/sync-project-docs
```

Detects drift between documentation/VERSION.md and code, updates outdated sections, preserves user-written prose, and adds changelog entries.

The `docs-context` rule (always applied) ensures the AI reads `docs/overview.md` first as the project index before any task, then navigates to specific docs on demand — progressive disclosure to reduce context waste.

### Feature Documentation

The commands follow a sequential workflow for documenting and building features. Feature doc paths use the **major version** only (`v0`, `v1`, `v2`), extracted from the current SemVer in `VERSION.md`.

```
/init-feature {name}
       │  creates docs/features/v{MAJOR}/{name}/README.md
       │  switches to feat/{version}/{name} branch (from default branch)
       │  adds feature to VERSION.md with not-started status
       │  if feature existed in prior major version, references old docs
       ▼
/create-requirements {name}
       │
       ▼
/create-design {name}
       │
       ▼
/create-implementation {name}
       │
       ▼
/create-testing {name}
```

### Versioning & Shipping

All versions follow SemVer (`vMAJOR.MINOR.PATCH`). Initial development starts at `v0.1.0`.

```
default branch ──┬── feat/v0.1.0/auth ──── /pr ──→ merge + VERSION.md: auth=done
                  ├── feat/v0.1.0/search ── /pr ──→ merge + VERSION.md: search=done
                  │
                  └── /ship-version ──→ git tag v0.1.0, advance VERSION.md to v0.2.0
```

- `/pr` merges the feature branch into the default branch and marks the feature as `done` in `VERSION.md`
- `/ship-version` validates all features are done, creates a git tag, auto-suggests the next SemVer bump, and advances `VERSION.md`

### Pull Request

```
/pr
```

Automatically syncs project docs and feature docs (if they exist), updates `VERSION.md` feature status, commits doc changes, then creates a PR targeting the default branch.

### Tips: provide detailed requirements

The more context you give with a command, the better the output. Don't just pass a name — describe **what the feature does, who it's for, and any constraints**.

**Bad** (vague, produces generic docs):

```
/create-requirements search
```

**Good** (specific, produces actionable docs):

```
/create-requirements search

Full-text and semantic search for marketplace listings.
- Users can search by title, description, tags, and seller name
- Results ranked by relevance with optional filters (price range, category, date)
- Must support Vietnamese diacritics and fuzzy matching
- Autocomplete suggestions as user types (debounced 300ms)
- Mobile-first, must work offline with cached recent searches
- Target: <200ms response time for 500k listings
```

### Simple feature

```
/create-requirements search
<describe what search does, who uses it, constraints, tech stack...>

/create-design search
<describe architecture preferences, performance targets...>

/create-implementation search
/create-testing search
```

Output (given current version `v0.1.0`, major = `v0`):

```
docs/features/v0/search/
├── requirements.md
├── design.md
├── implementation.md
└── testing.md
```

### Complex feature with sub-features

```
/init-feature listing
<list all sub-features and their purposes>

/create-requirements listing/filter
<detailed filter requirements, user stories, edge cases...>

/create-design listing/filter
/create-implementation listing/filter
/create-testing listing/filter
```

Output (given current version `v0.1.0`, major = `v0`):

```
docs/features/v0/listing/
├── README.md              ← parent overview (from init-feature)
└── filter/
    ├── requirements.md
    ├── design.md
    ├── implementation.md
    └── testing.md
```

### Updating existing docs

```
/update-feature-docs listing/filter
<describe what changed and why>
```

Prompts you for which doc type to update. Automatically adds a changelog entry. Old content is replaced (not appended) — the changelog serves as the historical record.

### TDD session

```
/tdd
I need a function to validate Vietnamese phone numbers.
- Accept 10-digit format: 0xx-xxx-xxxx
- Support all carriers: Viettel (032-039), Mobifone (070-079), Vinaphone (081-089)
- Return { valid: boolean, carrier: string | null, normalized: string }
- Throw on non-string input
```

### Code review

```
/code-review
```

No arguments needed — automatically reviews all uncommitted changes.

## Skills

Skills are reusable, multi-mode capabilities that combine multiple commands into a single workflow.

| Skill                 | Description                                                                   |
| --------------------- | ----------------------------------------------------------------------------- |
| **agent-md-refactor** | Create, sync, and refactor project docs and agent instruction files (3 modes) |

The `agent-md-refactor` skill supports three modes:

- **Create** — analyze codebase and generate all 6 project-level docs
- **Sync** — detect drift between docs and code, update outdated sections
- **Refactor** — split bloated agent instruction files (AGENTS.md, CLAUDE.md) into progressive disclosure structure

## Agents

| Agent                 | Description                                                   | When to use                                                |
| --------------------- | ------------------------------------------------------------- | ---------------------------------------------------------- |
| **tdd-guide**         | Enforces Red-Green-Refactor TDD cycle with 80%+ coverage      | New features, bug fixes, refactoring                       |
| **security-reviewer** | Detects OWASP Top 10, hardcoded secrets, injection, XSS, SSRF | After writing auth, API, input handling, or financial code |

## Rules (Auto-Applied)

### Common (all languages)

| Rule             | Enforces                                                                            |
| ---------------- | ----------------------------------------------------------------------------------- |
| **coding-style** | Immutability, small files (<800 lines), small functions (<50 lines), error handling |
| **docs-context** | Progressive disclosure — read `docs/overview.md` first, then navigate on demand     |
| **pattern**      | Repository pattern, consistent API response envelope, skeleton projects             |
| **security**     | No hardcoded secrets, input validation, injection prevention, rate limiting         |
| **testing**      | 80% coverage minimum, TDD workflow, unit + integration + E2E tests                  |

### TypeScript (applied to `*.ts`, `*.tsx`, `*.js`, `*.jsx`)

| Rule             | Enforces                                                                   |
| ---------------- | -------------------------------------------------------------------------- |
| **coding-style** | Spread-based immutability, async/await error handling, Zod validation      |
| **pattern**      | `ApiResponse<T>` interface, custom hooks pattern, typed repository pattern |
| **security**     | Zod for runtime validation, DOMPurify for HTML, helmet for HTTP headers    |
| **testing**      | Vitest + React Testing Library, MSW for API mocking, Playwright for E2E    |

## Scripts

Scripts live in `.cursor/scripts/` and are called by commands to avoid repeating version/branch logic in every command prompt. Cross-platform: Linux, macOS, Windows (Git Bash / WSL / MSYS2).

| Script                   | Output                  | Example          |
| ------------------------ | ----------------------- | ---------------- |
| `get-version.sh`         | Full SemVer version     | `v0.1.0`         |
| `get-version.sh major`   | Major version only      | `v0`             |
| `get-docs-path.sh`       | Feature docs base path  | `docs/features/v0` |
| `get-default-branch.sh`  | Repo's default branch   | `main`           |

## Templates

Templates live in `.cursor/templates/` and are used automatically by the commands.

### Project-level (used by `/init-docs`)

- `docs-overview.md` — project index and quick reference
- `docs-architecture.md` — tech stack, folder structure, patterns
- `docs-design-system.md` — colors, typography, spacing, components
- `docs-database.md` — ERD, tables, indexes, relationships
- `docs-api.md` — endpoints, auth, response format
- `docs-roadmap.md` — versions, milestones, priorities (SemVer)
- `version.md` — VERSION.md file template (current version, feature statuses, releases)

### Feature-level (used by `/init-feature` and `/create-*`)

- `feature-overview.md` — parent-level feature overview
- `requirements.md` — requirements & problem understanding
- `design.md` — system design & architecture
- `implementation.md` — implementation plan
- `testing.md` — testing strategy

## Customization

- **Add language-specific rules**: Create a new folder under `.cursor/rules/` (e.g., `python/`) with `.mdc` files
- **Add new commands**: Create `.md` files in `.cursor/commands/`
- **Add new agents**: Create `.md` files in `.cursor/agents/`
- **Add new skills**: Create a `SKILL.md` in `.cursor/skills/{skill-name}/`
- **Edit templates**: Modify files in `.cursor/templates/` to match your team's doc standards

## References

- [everything-claude-code](https://github.com/affaan-m/everything-claude-code)
