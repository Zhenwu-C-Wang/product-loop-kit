# Product Loop Kit Eval Plan

Created: 2026-07-13

## Scope

This eval plan covers:

- Product slice: roadmap refresh and human-token retention contract.
- Critical workflows: roadmap prioritizes real adoption; adoption protocol measures repeated human explanation; review persists material corrections; existing checks remain stable.
- Known risks: turning a useful principle into more documentation ceremony, implying external proof before it exists, or requiring trivial feedback to enter permanent product memory.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Yes | Self-application artifacts must remain complete. |
| Readiness score | `./scripts/score-loop-kit.sh .` | Yes | Should remain P4 external-learning-ready, not external-validated. |
| Score regression tests | `./scripts/test-score-loop-kit.sh` | Yes | P0-P4 behavior must remain stable. |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` | Yes | Existing implementation evidence must still pass. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` | Yes | All scripts must parse. |
| YAML parse | Ruby YAML parse for all three loop maps | Yes | Loop maps remain valid YAML. |
| Retention contract inspection | Inspect roadmap, adoption guide, review template, framework, and first-loop guide | Yes | The same rule must be coherent across artifacts. |
| Whitespace check | `git diff --check` | Yes | Catches patch and table formatting issues. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | Roadmap inspection | v0.7 is next; v0.8 covers memory; v0.9 covers executable contracts; distribution remains conditional. |
| A2 | Adoption guide inspection | Observation table and ledger measure first evidence, extra prompts, corrections, destinations, and second-task reuse. |
| A3 | Review template inspection | Human-token retention table and prior-correction handoff field exist. |
| A4 | Framework and first-loop inspection | Both instruct builders to persist material corrections before the next task. |
| A5 | `.loop` inspection | Product spec, external feedback digest, and decision log retain the source and decision. |
| A6 | Local regression suite | All existing command-level checks pass. |

## Manual Review Checklist

- [ ] Roadmap changes priority rather than merely adding terminology.
- [ ] Adoption measures can be captured during a 30-60 minute session.
- [ ] Material corrections are distinguished from ordinary implementation chatter.
- [ ] The retention rule points to existing artifacts instead of adding a tenth mandatory file.
- [ ] External adoption is still explicitly pending.

## Regression Evals

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Stale README links | Path inspection | Maintainer | 2026-06-29 |
| Prototype evidence regresses | Node scoring tests | Maintainer | 2026-06-29 |
| `.loop` drift | Validator pass | Maintainer | 2026-06-29 |
| Score thresholds drift silently | Score regression tests | Maintainer | 2026-07-06 |
| Human correction remains only in review prose | Retention ledger and durable-destination check | Maintainer | 2026-07-13 |
| Roadmap advances to packaging without adoption evidence | v0.7 exit gate inspection | Maintainer | 2026-07-13 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Material product preference | Human changes expected user behavior | Update spec, vision, or decision before next task. |
| Repeatable implementation failure | Same failure recurs or is expensive | Add an automated or manual eval. |
| Ordinary implementation chatter | Local explanation with no future product impact | Do not add permanent artifact ceremony. |
| Second agent task | Prior material correction exists in repo | Agent follows it without repeated human explanation. |

## Evidence Required From Agent

- Changed files and rationale.
- Evidence for every acceptance criterion.
- Local check results.
- The durable destination for the human feedback that caused this slice.
- Honest statement that real adoption evidence remains pending.
