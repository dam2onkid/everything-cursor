Create a pull request for the current changes.

1. **Sync project docs** — If `docs/overview.md` exists, run `/sync-docs` to update all project-level docs (`docs/overview.md`, `docs/architecture.md`, `docs/database.md`, `docs/api.md`, `docs/design-system.md`, `docs/roadmap.md`) to reflect the current codebase state. If `docs/overview.md` does not exist, skip this step.
2. **Sync feature docs** — Determine the current branch's feature name (from the branch name, e.g. `feature/auth` → `auth`). If `docs/features/{feature-name}/` exists, run `/update-docs` for each doc in that directory (`requirements.md`, `design.md`, `implementation.md`, `testing.md`) to reflect the latest changes. If no matching feature docs directory exists, skip this step.
3. If steps 1 or 2 produced changes, commit them with message `docs: sync docs before PR`
4. Look at all staged and unstaged changes with `git diff`
5. Write a clear commit message based on what changed
6. Commit and push to the current branch
7. Use `gh pr create` to open a pull request with title/description
8. Return the PR URL when done
