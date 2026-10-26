# Product Loop Kit Eval Plan

Created: 2026-10-25

## Scope

This eval plan covers:

- Product slice: readiness evidence boundary.
- Critical workflows: every score level exposes the evidence boundary; P4 keeps a stable name while its meaning stays honest; external adoption remains a separate roadmap gate.
- Known risks: changing only documentation, weakening stable score output, or accidentally presenting a local test as external proof.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Yes | Self-application artifacts must remain complete. |
| Readiness score | `./scripts/score-loop-kit.sh .` | Yes | Must remain 100/100 P4 and print the boundary. |
| Score regression tests | `./scripts/test-score-loop-kit.sh` | Yes | P0-P4 output must each contain the exact boundary. |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` | Yes | Existing product evidence must remain stable. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` | Yes | All scripts must parse. |
| YAML parse | Ruby YAML parse for all three loop maps | Yes | Loop maps remain valid YAML. |
| Boundary consistency | Targeted search across CLI, tests, README, repo tour, roadmap, and `.loop` | Yes | Product surfaces must distinguish readiness from adoption. |
| Whitespace check | `git diff --check` | Yes | Catches patch and table formatting issues. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | P0-P4 score regression tests | Five fixture outputs contain the exact evidence-boundary sentence. |
| A2 | CLI output and source inspection | P4 says artifacts can capture learning and does not claim adoption. |
| A3 | Documentation inspection | README, repo tour, and roadmap keep the same claim boundary. |
| A4 | Test source inspection plus regression run | One shared assertion is executed for every scenario. |
| A5 | Full local regression suite | All command-level checks pass and current score remains 100/100 P4. |
| A6 | Decision-log and roadmap inspection | Dated decision exists; v0.7 remains in progress pending a cold builder. |

## Manual Review Checklist

- [x] The boundary appears in the command output, not only in surrounding documentation.
- [x] The P4 identifier and score thresholds remain stable.
- [x] The wording distinguishes artifact completeness, external adoption, and product-market validation.
- [x] The regression assertion covers every score fixture.
- [x] No local check is described as human validation.

## Regression Evals

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Stale README links | Path inspection | Maintainer | 2026-06-29 |
| Prototype evidence regresses | Node scoring tests | Maintainer | 2026-06-29 |
| `.loop` drift | Validator pass | Maintainer | 2026-06-29 |
| Score thresholds drift silently | Score regression tests | Maintainer | 2026-07-06 |
| Human correction remains only in review prose | Retention ledger and durable-destination check | Maintainer | 2026-07-13 |
| Roadmap advances without adoption evidence | v0.7 exit-gate inspection | Maintainer | 2026-07-13 |
| P4 artifact readiness is mistaken for external proof | Exact boundary assertion across P0-P4 | Maintainer | 2026-10-25 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| P0 missing loop | Repo without `.loop/` | P0 headline, missing-artifact next actions, and evidence boundary. |
| P1 initialized | Fresh template artifacts | P1 headline and evidence boundary. |
| P2 agent ready | Filled product handoff | P2 headline and evidence boundary. |
| P3 evidence ready | Handoff plus implementation evidence | P3 headline and evidence boundary. |
| P4 current repo | Complete self-application | 100/100 P4 headline and evidence boundary. |

## Evidence Required From Agent

- Changed files and rationale.
- Exact P0-P4 regression result count.
- Current readiness output including the boundary.
- Full local check results.
- Honest statement that v0.7 still lacks a cold real-builder loop and second-task reuse evidence.
