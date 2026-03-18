---
phase: testing
title: Testing
description: What to verify, edge cases, and current status
context: [requirements.md]
---

# Testing

## Coverage Goal

80% minimum (enforced by `testing.mdc` rule). Focus coverage on business logic and critical paths.

## Key Scenarios

Group by whatever makes sense for the feature (by flow, by component, by risk area). Each scenario should trace back to a user story or success criterion in requirements.md.

### Happy paths

- [ ] Scenario: expected input produces expected output
- [ ] Scenario: ...

### Error paths

- [ ] Scenario: invalid input returns clear error
- [ ] Scenario: dependency failure is handled gracefully

## Edge Cases & Boundaries

What breaks at the limits? Think: empty inputs, max values, concurrent access, missing permissions, network failures.

- [ ] ...
- [ ] ...

## Last Run Results

> Updated automatically by `/run-tests`. Do not edit manually.

| Metric               | Value |
| -------------------- | ----- |
| Date                 |       |
| Total tests          |       |
| Passed               |       |
| Failed               |       |
| Coverage             |       |

### Remaining Issues

_None yet._
