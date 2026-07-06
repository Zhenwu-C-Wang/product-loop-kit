# Product Loop Kit PR Evidence

Created: 2026-07-06

## Summary

- Slice: v0.6 external adoption kit and score tests
- Branch/PR: local working tree
- Agent: Codex
- Status: ready for developer review

## Changes

- Added `docs/first-loop.md` to reduce first use to the core handoff path: vision, spec, eval plan, and agent task.
- Added `docs/external-adoption-loop.md` to define a real-repo adoption test with observation prompts and privacy guidance.
- Added `scripts/test-score-loop-kit.sh` with P0-P4 regression coverage.
- Added `tests/fixtures/score/expected-levels.tsv` for expected score outputs.
- Added `.github/workflows/ci.yml` for lightweight validation on push and pull request.
- Updated README, repo tour, roadmap, and share checklist to expose the new adoption path and checks.
- Updated `.loop` spec, eval plan, agent task, evidence, developer review, and decision log for this slice.

## Acceptance Criteria Evidence

| Criterion | Evidence | Status |
| --- | --- | --- |
| A1 | `docs/first-loop.md` narrows the first hour to four files and tells users to aim for P2 before agent handoff. | Complete |
| A2 | `docs/external-adoption-loop.md` defines recruitment, setup, task, observations, success criteria, evidence to bring back, and privacy handling. | Complete |
| A3 | `./scripts/test-score-loop-kit.sh` passes with assertions for P0, P1, P2, P3, and P4 scenarios. | Complete |
| A4 | `.github/workflows/ci.yml` runs validator, score, score tests, prototype tests, shell syntax, YAML parse, path checks, and whitespace. | Complete |
| A5 | Product Loop Kit validator passes with `63 passed, 0 warning(s), 0 failed`. | Complete |
| A6 | Score, prototype, shell syntax, YAML, path, and whitespace checks pass locally. | Complete |

## Checks Run

| Check | Command/Method | Result | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Pass | 63 passed, 0 warnings, 0 failed. |
| Product-loop readiness score | `./scripts/score-loop-kit.sh .` | Pass | 100/100, P4 external-learning-ready. |
| Score regression tests | `./scripts/test-score-loop-kit.sh` | Pass | P0, P1, P2, P3, and P4 assertions passed. |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` | Pass | Six tests passed. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` | Pass | All scripts parse. |
| YAML parse | Ruby YAML parse for `.loop/00-loop-map.yaml`, `templates/00-loop-map.yaml`, and `examples/typing-tutor/loop-map.yaml` | Pass | YAML artifacts parse. |
| Docs path check | `for path in README.md docs/repo-tour.md docs/first-loop.md docs/external-adoption-loop.md docs/roadmap.md docs/share-checklist.md scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh tests/fixtures/score/expected-levels.tsv .github/workflows/ci.yml; do test -f "$path" || exit 1; done` | Pass | All checked paths exist. |
| Whitespace | `git diff --check` | Pass | No whitespace errors. |
| CI workflow inspection | Read `.github/workflows/ci.yml` and compared commands against local checks | Pass | Hosted CI has not run until pushed. |

## Product Inspection

- Entry point: `README.md`.
- First-loop path: `docs/first-loop.md`.
- External adoption path: `docs/external-adoption-loop.md`.
- Reviewer path: `docs/repo-tour.md`.
- Share path: `docs/share-checklist.md`.
- Score test path: `scripts/test-score-loop-kit.sh`.
- CI path: `.github/workflows/ci.yml`.
- Workflow note: local checks now match the intended CI gate, but the hosted workflow still needs a push or PR to execute.

## Risks And Tradeoffs

| Risk | Impact | Mitigation/Next Step |
| --- | --- | --- |
| More docs could add maintenance burden. | First-time users may see more entrypoints instead of less. | README and repo tour route users to first-loop first; share checklist path checks catch stale files. |
| Score fixtures may become brittle as scoring evolves. | Legitimate scoring changes could require fixture updates. | Fixture table is small and explicit about expected levels. |
| CI can imply maturity before external adoption. | Reviewers may overestimate validation. | Current status and caveats still state external adoption has not happened. |

## Skipped Or Blocked Checks

| Check | Reason | Owner |
| --- | --- | --- |
| Hosted GitHub Actions run | Requires pushing this workflow to GitHub. | Maintainer |
| External adoption validation | Requires a real user or real product repo. | Maintainer |

## Questions For Developer Review

- Should `docs/first-loop.md` be copied into initialized repos as `.loop/README.md` after the first adoption session?
- Should CI be required before tagging a public release?
