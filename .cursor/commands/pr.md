Create a pull request for the current changes.

1. **Detect context**:
   - Run `.cursor/scripts/get-docs-path.sh` to get the feature docs base path
   - Run `.cursor/scripts/get-default-branch.sh` to get the default branch name
   - Parse the current branch name for version and feature: `feat/{version}/{feature-name}` → version + feature name
2. **Sync project docs** — If `docs/overview.md` exists, run `/sync-docs` to update all project-level docs (`docs/overview.md`, `docs/architecture.md`, `docs/database.md`, `docs/api.md`, `docs/design-system.md`, `docs/roadmap.md`) to reflect the current codebase state. If `docs/overview.md` does not exist, skip this step.
3. **Sync feature docs** — If `{DOCS_PATH}/{feature-name}/` exists, run `/update-docs` for each doc in that directory (`requirements.md`, `design.md`, `implementation.md`, `testing.md`) to reflect the latest changes. If no matching feature docs directory exists, skip this step.
4. **Update VERSION.md** — Set the feature's status to `done` in `VERSION.md`
5. If steps 2, 3, or 4 produced changes, commit them with message `docs: sync docs before PR`
6. Look at all staged and unstaged changes with `git diff`
7. Write a clear commit message based on what changed
8. Commit and push to the current branch
9. Use `gh pr create` to open a pull request targeting the **default branch**, with title/description
10. Return the PR URL when done
11. If all features in the current version are now `done`, suggest running `/ship-version`
