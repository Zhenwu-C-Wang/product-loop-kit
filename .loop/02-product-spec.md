# Product Loop Kit Product Spec

Created: 2026-10-25

## Slice

- Name: readiness evidence boundary
- Owner: maintainer
- Status: complete
- Related vision bet: Product Loop Kit should make the proof level of every readiness signal explicit so local completeness cannot be mistaken for real adoption.

## Problem

The readiness command reports `100/100 (P4 external-learning-ready)` when the repo-owned artifact system is complete. The roadmap and feedback records already say that P4 is not external validation, but the CLI output itself did not state that boundary. A reader could therefore treat a local artifact score as proof that an independent builder adopted the product.

The v0.7 adoption gate cannot be completed without a cold real-builder loop. This slice improves the product while that external dependency remains unavailable by turning a repeatedly important evidence boundary into executable CLI behavior and a regression check.

## User Story

As a maintainer or evaluator reading a readiness result, I want the command to say what its score does and does not prove, so that I can distinguish artifact readiness from external adoption evidence without finding a separate caveat.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Print an explicit evidence boundary in every readiness report. | Must | State that the score measures artifact completeness and does not prove external adoption or product-market validation. |
| R2 | Describe P4 as readiness to capture external learning, not proof that adoption occurred. | Must | Keep the stable `P4 external-learning-ready` level name. |
| R3 | Explain the same boundary in the README and reviewer tour. | Must | A copied headline score must not stand alone without its meaning. |
| R4 | Lock the boundary with score regression tests for P0 through P4. | Must | Every fixture output must contain the exact boundary statement. |
| R5 | Keep v0.7 in progress and retain the cold-builder exit gate. | Must | This local improvement is not adoption evidence. |
| R6 | Preserve the existing validator, score thresholds, prototype behavior, shell syntax, and YAML validity. | Must | No new dependency or artifact is added. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | `score-loop-kit.sh` prints the evidence-boundary sentence for readiness reports at every level. | Run the P0-P4 score regression fixtures. |
| A2 | The P4 level description says artifacts can capture external learning and does not claim adoption. | Inspect CLI output and source. |
| A3 | README, repo tour, and roadmap use the same artifact-readiness versus adoption distinction. | Documentation inspection and targeted search. |
| A4 | Score regression tests fail if the boundary disappears from any P0-P4 scenario. | Inspect the shared assertion and run the test script. |
| A5 | The full local regression suite passes with the readiness score still at 100/100 P4. | Run validator, score, score tests, prototype tests, syntax, YAML, and whitespace checks. |
| A6 | The decision log records the product decision while v0.7 remains externally blocked. | Inspect the dated decision and roadmap status. |

## UX Notes

- Entry point: `./scripts/score-loop-kit.sh [target-dir]`.
- Main flow: run score -> read level -> read evidence boundary -> choose next action using the correct proof level.
- Empty state: even P0 output explains the evidence boundary.
- Error state: invalid target behavior is unchanged.
- Accessibility: the boundary is plain text and does not rely on color or formatting.

## Data And State

- Inputs: current `.loop/` artifact files.
- Outputs: readiness score, category detail, level descriptions, evidence boundary, and next action.
- State transitions: none; scoring remains read-only.
- Persistence: regression test, documentation, roadmap, and decision log.
- Privacy/security considerations: no product or user data is collected.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Boundary assertion count | Score fixture completes | Proves all five P0-P4 scenarios expose the boundary. |
| P4 headline stability | Current repo is scored | Prevents an evidence clarification from changing score thresholds or level names. |
| Cold-builder adoption evidence | Independent v0.7 session completes | Remains the separate signal required to advance the roadmap. |

## Dependencies

- Existing POSIX-like shell environment and repository fixtures.
- A real builder is still required for the v0.7 exit gate, but not for this bounded CLI slice.

## Non-Goals

- Claiming external adoption, product-market validation, or v0.7 completion.
- Contacting a tester or running a human session.
- Renaming score levels or changing thresholds.
- Adding packaging, telemetry, orchestration, or a new dependency.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Will an independent builder interpret P4 correctly without explanation? | Maintainer | During the cold v0.7 session |
| Should a later machine-readable score mode expose evidence scope as a field? | Maintainer | Only if v0.9 is justified by adoption evidence |
