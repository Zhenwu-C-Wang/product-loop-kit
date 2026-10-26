# Product Loop Kit Agent Task

Created: 2026-10-25

## Goal

Make the readiness command explicitly distinguish artifact completeness from external adoption evidence, then protect that claim boundary with P0-P4 regression tests.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Roadmap: `docs/roadmap.md`
- Existing adoption evidence: `.loop/07-external-feedback-digest.md`
- Relevant implementation:
  - `scripts/score-loop-kit.sh`
  - `scripts/test-score-loop-kit.sh`
  - `tests/fixtures/score/expected-levels.tsv`
  - `README.md`
  - `docs/repo-tour.md`

## Scope

In scope:

- Add an exact evidence-boundary statement to readiness output and help text.
- Clarify the P4 level description without renaming the level or changing thresholds.
- Assert the boundary in every P0-P4 score regression scenario.
- Align README, repo tour, roadmap, and self-application artifacts.
- Run the complete existing local check suite.

Out of scope:

- Claiming or simulating external adoption.
- Contacting testers or publishing the project.
- Changing score thresholds or fixture headline expectations.
- Advancing v0.8 or v0.9.
- Adding dependencies or a new status/log source.

## Implementation Rules

- Keep the exact boundary sentence stable and testable.
- Preserve `P4 external-learning-ready` as the public level name.
- Apply the boundary to every level because no artifact score proves adoption.
- Treat assisted-pilot evidence as feasibility only.
- Record the decision in `.loop/08-decision-log.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` |
| Readiness score | `./scripts/score-loop-kit.sh .` |
| Score regression tests | `./scripts/test-score-loop-kit.sh` |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Boundary consistency | `rg -n "Evidence boundary|artifact completeness|does not prove external adoption" scripts README.md docs .loop` |
| Whitespace | `git diff --check` |

## Working Loop

1. Inspect the current score contract and adoption gate.
2. Add the product-facing claim boundary at the scoring source.
3. Lock the statement across P0-P4 fixtures.
4. Align the high-traffic documentation surfaces.
5. Run all required checks and repair any regression.
6. Record implementation evidence, developer review, and the dated decision.

## Completion Contract

Return:

- The concrete behavior added to the readiness command.
- P0-P4 and full-suite check results.
- Files that retain the evidence-boundary decision.
- Confirmation that v0.7 remains in progress.
- The exact remaining external proof: one cold builder, a completed real loop, and second-task reuse without repeated explanation.
