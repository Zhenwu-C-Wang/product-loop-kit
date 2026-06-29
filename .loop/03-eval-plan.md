# Product Loop Kit Eval Plan

Created: 2026-06-29

## Scope

This eval plan covers:

- Product slice: v0.5 share-ready repo organization.
- Critical workflows: reviewer starts from README, follows repo tour, finds example README, runs validator, and runs prototype tests.
- Known risks: over-polishing docs without improving evaluation, stale links, or hiding caveats about missing external adoption.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Yes | This repo's `.loop/` must stay complete. |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` | Yes | Case-study evidence must still pass. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` | Yes | Existing scripts must parse. |
| Whitespace check | `git diff --check` | Yes | Catches trailing whitespace and patch issues. |
| YAML parse | Ruby YAML parse for loop maps | Yes | Applies to `.loop`, template, and typing-tutor loop maps. |
| Share docs file check | `test -f` for README, repo tour, share checklist, example README | Yes | Confirms entrypoints exist. |
| Link/path inspection | `test -e` for key README and tour paths | Yes | Confirms referenced local paths exist. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | README inspection | README states what, why, start path, use path, repo map, case study, and status. |
| A2 | Share docs file/path checks | Reviewer docs exist and local links resolve. |
| A3 | Typing Tutor README inspection | Example README links to artifact sequence, prototype, tests, and screenshots. |
| A4 | Validator pass | Validator exits 0 with no failed checks. |
| A5 | Prototype scoring tests | Node tests pass. |

## Manual Review Checklist

- [ ] README is clear enough to send as a repo link.
- [ ] Repo tour gives a short review path.
- [ ] Share checklist includes commands and caveats.
- [ ] Typing Tutor README gives a local example entrypoint.
- [ ] Known caveats are explicit.
- [ ] No generated proof is described as external adoption.

## Regression Evals

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Stale README links | Path inspection | Maintainer | 2026-06-29 |
| Prototype evidence regresses | Node scoring tests | Maintainer | 2026-06-29 |
| `.loop` drift | Validator pass | Maintainer | 2026-06-29 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Reviewer starts at README | `README.md` | Can find framework, tour, `.loop`, case study, scripts, and status. |
| Share checklist commands | `docs/share-checklist.md` | Commands match existing files. |
| Example entrypoint | `examples/typing-tutor/README.md` | Links to prototype, evidence, and screenshots. |

## Evidence Required From Agent

- Command output summaries.
- Path checks.
- Updated evidence and developer review.
- Known caveats.
