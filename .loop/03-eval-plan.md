# Product Loop Kit Eval Plan

Created: 2026-07-06

## Scope

This eval plan covers:

- Product slice: v0.6 external adoption kit and score tests.
- Critical workflows: first-time builder finds a smaller first-loop path, external adoption loop is observable, score regression tests protect P0-P4 behavior, and local share checks cover core regressions.
- Known risks: adding docs that still do not reduce first-use friction, brittle score fixtures, stale check commands, or implying external adoption has already happened.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Yes | This repo's `.loop/` must stay complete. |
| Readiness score | `./scripts/score-loop-kit.sh .` | Yes | Should report P4 and show category scores. |
| Score regression tests | `./scripts/test-score-loop-kit.sh` | Yes | Covers P0, P1, P2, P3, and P4 scenarios. |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` | Yes | Case-study evidence must still pass. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` | Yes | All scripts must parse. |
| Whitespace check | `git diff --check` | Yes | Catches trailing whitespace and patch issues. |
| YAML parse | Ruby YAML parse for loop maps | Yes | Applies to `.loop`, template, and typing-tutor loop maps. |
| Docs path check | `for path in README.md docs/repo-tour.md docs/first-loop.md docs/external-adoption-loop.md docs/roadmap.md docs/share-checklist.md scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh tests/fixtures/score/expected-levels.tsv; do test -f "$path" || exit 1; done` | Yes | Confirms entrypoints and tests exist. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | First-loop doc inspection and path check | Guide narrows first use to four files and targets P2 before agent handoff. |
| A2 | External adoption doc inspection and path check | Guide defines recruitment, task, observations, success criteria, and evidence to bring back. |
| A3 | Score regression tests | Test output includes passing assertions for P0, P1, P2, P3, and P4. |
| A4 | Share checklist inspection | Share checklist runs the same core local checks used for regression. |
| A5 | Validator pass | Validator exits 0 with no failed checks. |
| A6 | Regression command suite | Score, prototype, shell syntax, YAML, path, and whitespace checks pass. |

## Manual Review Checklist

- [ ] First-loop guide reduces the first-use surface area.
- [ ] External adoption guide records observations separately from interpretations.
- [ ] Score fixtures are small enough to maintain.
- [ ] Local checks do not introduce package or release complexity.
- [ ] Known caveats still say external adoption is pending.

## Regression Evals

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Stale README links | Path inspection | Maintainer | 2026-06-29 |
| Prototype evidence regresses | Node scoring tests | Maintainer | 2026-06-29 |
| `.loop` drift | Validator pass | Maintainer | 2026-06-29 |
| Score output breaks on shell formatting | Readiness score command | Maintainer | 2026-07-06 |
| Score thresholds drift silently | Score regression tests | Maintainer | 2026-07-06 |
| Share checklist commands drift | Local check command parity | Maintainer | 2026-07-06 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Missing `.loop` | Temporary empty repo | P0 not-ready. |
| Fresh init | Temporary initialized repo | P1 initialized. |
| Agent-ready handoff | Temporary repo with vision, spec, eval, task, and feedback digest filled | P2 agent-ready. |
| Evidence-ready slice | Temporary repo with PR evidence added | P3 evidence-ready. |
| Current repo | Product Loop Kit self-application artifacts | P4 external-learning-ready. |

## Evidence Required From Agent

- Command output summaries.
- Score regression output.
- Local check path and command summary.
- Updated evidence and developer review.
- Known caveats.
