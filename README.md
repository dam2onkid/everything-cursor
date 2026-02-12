# everything-cursor

A batteries-included `.cursor` configuration for AI-assisted development. Provides structured commands, rules, agents, and templates to enforce consistent workflows across any project.

## Setup

```bash
git clone https://github.com/<your-org>/everything-cursor.git
cp -r everything-cursor/.cursor /path/to/your-project/
```

That's it. Open your project in Cursor and the rules, commands, and agents are ready to use.

## What's Included

```
.cursor/
├── commands/          # Slash commands for Cursor chat
├── rules/
│   ├── common/        # Language-agnostic rules (always applied)
│   └── typescript/    # TypeScript-specific rules (applied to .ts/.tsx/.js/.jsx)
├── agents/            # Specialized AI agents
└── templates/         # Document templates used by commands
```

## Commands

Run these in Cursor chat with `/command-name`.

| Command                  | Description                                                                     |
| ------------------------ | ------------------------------------------------------------------------------- |
| `/init-feature`          | Initialize a complex feature with a parent-level overview doc                   |
| `/create-requirements`   | Create a requirements document for a feature or sub-feature                     |
| `/create-design`         | Create a system design & architecture document                                  |
| `/create-implementation` | Create an implementation plan document                                          |
| `/create-testing`        | Create a testing strategy document                                              |
| `/update-docs`           | Update an existing feature doc and add a changelog entry                        |
| `/code-review`           | Run a comprehensive security and quality review on uncommitted changes          |
| `/tdd`                   | Start a TDD session — scaffolds interfaces, writes tests first, then implements |

## Feature Documentation Workflow

The commands follow a sequential workflow for documenting and building features:

```
/init-feature {name}
       │
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

**Bad**:

```
/create-design listing/filter
```

**Good**:

```
/create-design listing/filter

Filter system for property listings page.
- Filter by: price range (slider), bedrooms (1-5+), area (district multi-select), property type
- Filters apply instantly without page reload (URL params sync)
- "Save filter" feature for logged-in users (max 5 saved filters)
- Must handle 50k+ listings with <100ms filter response
- Backend: Supabase with PostGIS for location queries
- Frontend: Next.js with Zustand for filter state
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

Output:

```
docs/features/search/
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

Output:

```
docs/features/listing/
├── README.md              ← parent overview (from init-feature)
└── filter/
    ├── requirements.md
    ├── design.md
    ├── implementation.md
    └── testing.md
```

### Updating existing docs

```
/update-docs listing/filter
<describe what changed and why>
```

Prompts you for which doc type to update. Automatically adds a changelog entry.

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
| **pattern**      | Repository pattern, consistent API response envelope, skeleton projects             |
| **security**     | No hardcoded secrets, input validation, injection prevention, rate limiting         |
| **testing**      | 80% coverage minimum, TDD workflow, unit + integration + E2E tests                  |

### TypeScript (applied to `*.ts`, `*.tsx`, `*.js`, `*.jsx`)

| Rule             | Enforces                                                                   |
| ---------------- | -------------------------------------------------------------------------- |
| **coding-style** | Spread-based immutability, async/await error handling, Zod validation      |
| **pattern**      | `ApiResponse<T>` interface, custom hooks pattern, typed repository pattern |

## Templates

Templates live in `.cursor/templates/` and are used automatically by the commands:

- `feature-overview.md` — parent-level feature overview
- `requirements.md` — requirements & problem understanding
- `design.md` — system design & architecture
- `implementation.md` — implementation plan
- `testing.md` — testing strategy

## Customization

- **Add language-specific rules**: Create a new folder under `.cursor/rules/` (e.g., `python/`) with `.mdc` files
- **Add new commands**: Create `.md` files in `.cursor/commands/`
- **Add new agents**: Create `.md` files in `.cursor/agents/`
- **Edit templates**: Modify files in `.cursor/templates/` to match your team's doc standards

## References

- [everything-claude-code](https://github.com/affaan-m/everything-claude-code)
