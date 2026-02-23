---
description: Run all tests, curl API endpoints, save results into testing.md, and fix failures.
---

# Run Tests & Fix

## Step 1: Load Context

1. Read `docs/features/**/testing.md` to get test cases, coverage goals, and API endpoints
2. If no `testing.md` exists, auto-detect from test files and route definitions
3. Detect test runner from project config (`package.json`, `pyproject.toml`, etc.)

## Step 2: Run Tests

1. Run the project's test command with coverage enabled
2. For each API endpoint found in `testing.md` or source code, run:

```bash
curl -s -w "\nHTTP_CODE:%{http_code} TIME:%{time_total}s" \
  -X {METHOD} {URL} -H "Content-Type: application/json" -d '{body}'
```

3. Use test data from `testing.md` → `## Test Data` for request bodies

## Step 3: Fix Failures

For each failure (max 3 iterations):

1. Read the failing test and its source code
2. Use `testing.md` → `requirements.md` → `design.md` as source of truth for expected behavior
3. Fix implementation to match requirements (not the other way around)
4. Re-run the specific test to verify the fix

## Step 4: Save Results

Update each `testing.md` that was loaded:

1. Mark passing checklist items: `- [ ]` → `- [x]`
2. Add notes to items that could not be fixed
3. Fill in the `## Last Run Results` section with pass/fail counts, coverage, curl results, and fixes applied
4. Add a changelog entry: `| {date} | Tested | /run-tests: X/Y passed, Z fixed |`

Print the summary to the user when done.

## Rules

- Fix implementation, not test expectations (unless test contradicts requirements)
- Max 3 fix-and-rerun iterations
- If dev server is needed for curl tests, ask user to start it first
